module top;
  import vpi::*;

  initial begin
    automatic vpiHandle top = vpi_handle_by_name("top", null);
    $display("top = %d", top);
    $display("  type = %s", vpi_get_str(vpiType, top));
    $display("  name = %s", vpi_get_str(vpiName, top));
  end
endmodule
