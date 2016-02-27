module test;
  import vpi::*;

  initial begin
    automatic chandle mod_it = vpi_iterate(vpiModule, null);

    automatic chandle root = vpi_scan(mod_it);
    $display("root = %d", root);
    $display("  type = %s", vpi_get_str(vpiType, root));
    $display("  name = %s", vpi_get_str(vpiName, root));

    if (vpi_scan(mod_it) == null)
      $display("no more top modules");
  end
endmodule
