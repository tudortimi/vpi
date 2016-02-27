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


#include "vpi_user.h"


PLI_INT32 vpi_get__(PLI_INT32 prop, vpiHandle obj) {
  return vpi_get(prop, obj);
}

PLI_INT64 vpi_get64__(PLI_INT32 prop, vpiHandle obj) {
  return vpi_get64(prop, obj);
}

PLI_BYTE8* vpi_get_str__(PLI_INT32 prop, vpiHandle obj) {
  return vpi_get_str(prop, obj);
}

vpiHandle vpi_iterate__(PLI_INT32 type, vpiHandle ref) {
  return vpi_iterate(type, ref);
}

vpiHandle vpi_scan__(vpiHandle itr) {
  return vpi_scan(itr);
}


// TODO Is there a better way to force the VPI functions to get linked?

//PLI_BYTE8* (*vpi_get_str__)(PLI_INT32, vpiHandle) = &vpi_get_str;

//void* vpi_get_str__ = (void*) &vpi_get_str;
