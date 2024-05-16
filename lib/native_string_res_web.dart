// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter

import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:web/web.dart' as web;

import 'native_string_res_platform_interface.dart';

/// A web implementation of the NativeStringResPlatform of the NativeStringRes plugin.
class NativeStringResWeb extends NativeStringResPlatform {
  /// Constructs a NativeStringResWeb
  NativeStringResWeb();

  static void registerWith(Registrar registrar) {
    NativeStringResPlatform.instance = NativeStringResWeb();
  }

  /// Returns a [String] containing the version of the platform.
  @override
  Future<String?> getPlatformVersion() async {
    final version = web.window.navigator.userAgent;
    return version;
  }
}
