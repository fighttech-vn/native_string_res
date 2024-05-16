#include "include/native_string_res/native_string_res_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "native_string_res_plugin.h"

void NativeStringResPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  native_string_res::NativeStringResPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
