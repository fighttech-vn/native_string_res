#ifndef FLUTTER_PLUGIN_NATIVE_STRING_RES_PLUGIN_H_
#define FLUTTER_PLUGIN_NATIVE_STRING_RES_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace native_string_res {

class NativeStringResPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  NativeStringResPlugin();

  virtual ~NativeStringResPlugin();

  // Disallow copy and assign.
  NativeStringResPlugin(const NativeStringResPlugin&) = delete;
  NativeStringResPlugin& operator=(const NativeStringResPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace native_string_res

#endif  // FLUTTER_PLUGIN_NATIVE_STRING_RES_PLUGIN_H_
