// Copyright 2016-2024 Tudor Timisescu (verificationgentleman.com)
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


(* some_attr *)
module top;
  import vpi::*;

  initial begin
    automatic chandle mod_it = vpi_iterate(vpiModule, null);
    automatic chandle attr_it;
    automatic chandle attr;

    automatic chandle root = vpi_scan(mod_it);
    $display("root = %d", root);
    $display("  type = %s", vpi_get_str(vpiType, root));
    $display("  name = %s", vpi_get_str(vpiName, root));

    attr_it = vpi_iterate(vpiAttribute, root);
    attr = vpi_scan(attr_it);
    $display("  attr = %s", vpi_get_str(vpiName, attr));

    if (vpi_scan(mod_it) == null)
      $display("no more top modules");
  end
endmodule
