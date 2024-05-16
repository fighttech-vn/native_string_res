import 'native_string_res_platform_interface.dart';

class NativeStringRes {
  Future<String?> getValue({
    required String androidName,
    required String iOSName,
    required String iOSPlistName,
  }) {
    return NativeStringResPlatform.instance
        .getValue(androidName, iOSName, iOSPlistName);
  }
}
