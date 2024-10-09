module top;
  import vpi::*;

  some_module #(.SOME_BIT_PARAM(1)) some_module_inst();

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
      end
    end
  end
endmodule
