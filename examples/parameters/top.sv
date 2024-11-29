module top;
  import vpi::*;

  localparam SOME_VALUE = 'h1234;

  some_module #(.SOME_BIT_PARAM(1), .SOME_OTHER_INT_PARAM(SOME_VALUE[15:8])) some_module_inst();

  initial begin
    automatic vpiHandle some_module_inst = vpi_handle_by_name("top.some_module_inst", null);
    $display("some_module_inst = %d", some_module_inst);
    $display("  type = %s", vpi_get_str(vpiType, some_module_inst));
    $display("  name = %s", vpi_get_str(vpiName, some_module_inst));

    begin
      automatic vpiHandle param_iter = vpi_iterate(vpiParameter, some_module_inst);
      forever begin
        automatic vpiHandle param = vpi_scan(param_iter);
        if (param == null)
          break;

        $display("  param = %d", param);
        $display("    type = %s", vpi_get_str(vpiType, param));
        $display("    name = %s", vpi_get_str(vpiName, param));
      end
    end

    begin
      automatic vpiHandle param_assign_iter = vpi_iterate(vpiParamAssign, some_module_inst);
      forever begin
        automatic vpiHandle param_assign = vpi_scan(param_assign_iter);
        if (param_assign == null)
          break;

        $display("  param_assign = %d", param_assign);
        $display("    type = %s", vpi_get_str(vpiType, param_assign));
        $display("    name = %s", vpi_get_str(vpiName, param_assign));

        begin
          automatic vpiHandle lhs = vpi_handle(vpiLhs, param_assign);
          automatic vpiHandle rhs = vpi_handle(vpiRhs, param_assign);

          $display("    lhs = %d", lhs);
          $display("      type = %s", vpi_get_str(vpiType, lhs));
          $display("      name = %s", vpi_get_str(vpiName, lhs));

          $display("    rhs = %d", rhs);
          $display("      type = %s", vpi_get_str(vpiType, rhs));
        end
      end
    end

    begin
      automatic vpiHandle param_assign_to_part_select = get_param_assign(some_module_inst, "SOME_OTHER_INT_PARAM");

      $display("Analyzing param assign for %s (@%0d)", vpi_get_str(vpiName, param_assign_to_part_select), param_assign_to_part_select);
      begin
        automatic vpiHandle rhs_of_param_assign = vpi_handle(vpiRhs, param_assign_to_part_select);
        assert (vpi_get(vpiType, rhs_of_param_assign) == vpiPartSelect)
          $display("  RHS is a part select");
        else
          $error("Unexpected type for parameter assign RHS: %s", vpi_get_str(vpiType, param_assign_to_part_select));
      end
    end
  end


  function vpiHandle get_param_assign(vpiHandle mod, string param_name);
    automatic vpiHandle param_assign_iter = vpi_iterate(vpiParamAssign, mod);
    forever begin
      automatic vpiHandle param_assign = vpi_scan(param_assign_iter);
      if (param_assign == null)
        break;

      if (vpi_get_str(vpiName, param_assign) == param_name)
        return param_assign;
    end
  endfunction

endmodule
