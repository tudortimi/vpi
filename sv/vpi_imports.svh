// Copyright 2016 Tudor Timisescu (verificationgentleman.com)
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


import "DPI-C" context vpi_get__ =
  function PLI_INT32 vpi_get(PLI_INT32 prop, vpiHandle obj);

import "DPI-C" context vpi_get64__ =
  function PLI_INT64 vpi_get64(PLI_INT32 prop, vpiHandle obj);

import "DPI-C" context vpi_get_str__ =
  function string vpi_get_str(PLI_INT32 prop, vpiHandle obj);

import "DPI-C" context vpi_iterate__ =
  function vpiHandle vpi_iterate(PLI_INT32 type_, vpiHandle ref_);

import "DPI-C" context vpi_handle__ =
  function vpiHandle vpi_handle(PLI_INT32 type_, vpiHandle ref_);

import "DPI-C" context vpi_handle_by_name__ =
  function vpiHandle vpi_handle_by_name(string name, vpiHandle scope);

import "DPI-C" context vpi_scan__ =
  function vpiHandle vpi_scan(vpiHandle itr);


import "DPI-C" context
  function int vpi_get_value_int(vpiHandle obj);

import "DPI-C" context
  function void vpi_put_value_int(vpiHandle obj, int value);

import "DPI-C" context
  function string vpi_get_value_string(vpiHandle obj);

import "DPI-C" context
  function void vpi_put_value_string(vpiHandle obj, string value);
