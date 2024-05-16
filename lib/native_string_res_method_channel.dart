import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'native_string_res_platform_interface.dart';

/// An implementation of [NativeStringResPlatform] that uses method channels.
class MethodChannelNativeStringRes extends NativeStringResPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('native_string_res');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
