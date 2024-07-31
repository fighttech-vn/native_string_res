import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'native_string_res_platform_interface.dart';
///
/// The web implementation of [NativeStringResPlatform].
///
/// This class implements the `package:url_launcher` functionality for the web.
class NativeStringResWebPlugin extends NativeStringResPlatform {
  /// Registers this class as the default instance of [UrlLauncherPlatform].
  static void registerWith(Registrar registrar) {
    NativeStringResPlatform.instance = NativeStringResWebPlugin();
  }
}