import 'package:flutter_test/flutter_test.dart';
import 'package:native_string_res/native_string_res.dart';
import 'package:native_string_res/native_string_res_platform_interface.dart';
import 'package:native_string_res/native_string_res_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNativeStringResPlatform
    with MockPlatformInterfaceMixin
    implements NativeStringResPlatform {
  @override
  Future<String?> getValue(
          String androidName, String iOSName, String iOSPlistName) =>
      Future.value('42');
}

void main() {
  final NativeStringResPlatform initialPlatform =
      NativeStringResPlatform.instance;

  test('$MethodChannelNativeStringRes is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelNativeStringRes>());
  });

  test('getPlatformVersion', () async {
    NativeStringRes nativeStringResPlugin = NativeStringRes();
    MockNativeStringResPlatform fakePlatform = MockNativeStringResPlatform();
    NativeStringResPlatform.instance = fakePlatform;

    expect(
        await nativeStringResPlugin.getValue(
          androidName: 'hello',
          iOSName: 'hello',
          iOSPlistName: 'Test_list',
        ),
        '42');
  });
}
