
import 'native_string_res_platform_interface.dart';

class NativeStringRes {
  Future<String?> getPlatformVersion() {
    return NativeStringResPlatform.instance.getPlatformVersion();
  }
}
