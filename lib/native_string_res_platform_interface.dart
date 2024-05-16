import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'native_string_res_method_channel.dart';

abstract class NativeStringResPlatform extends PlatformInterface {
  /// Constructs a NativeStringResPlatform.
  NativeStringResPlatform() : super(token: _token);

  static final Object _token = Object();

  static NativeStringResPlatform _instance = MethodChannelNativeStringRes();

  /// The default instance of [NativeStringResPlatform] to use.
  ///
  /// Defaults to [MethodChannelNativeStringRes].
  static NativeStringResPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NativeStringResPlatform] when
  /// they register themselves.
  static set instance(NativeStringResPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getValue(
    String androidName,
    String iOSName,
    String iOSPlistName,
  ) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
