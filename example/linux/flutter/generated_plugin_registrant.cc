//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <native_string_res/native_string_res_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) native_string_res_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "NativeStringResPlugin");
  native_string_res_plugin_register_with_registrar(native_string_res_registrar);
}
