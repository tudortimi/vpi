module top;
  import vpi::*;

  some_module #(.SOME_BIT_PARAM(1)) some_module_inst();

  initial begin
    automatic vpiHandle some_module_inst = vpi_handle_by_name("top.some_module_inst", null);
    $display("some_module_inst = %d", some_module_inst);
    $display("  type = %s", vpi_get_str(vpiType, some_module_inst));
    $display("  name = %s", vpi_get_str(vpiName, some_module_inst));
  end
endmodule
