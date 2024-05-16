import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'native_string_res_platform_interface.dart';

/// An implementation of [NativeStringResPlatform] that uses method channels.
class MethodChannelNativeStringRes extends NativeStringResPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('native_string_res');

  // final String androidName;
  // final String iOSName;
  // final String iOSPlistName;

  // MethodChannelNativeStringRes({
  // required this.androidName,
  // required this.iOSName,
  // required this.iOSPlistName,
  // });

  @override
  Future<String?> getValue(
    String androidName,
    String iOSName,
    String iOSPlistName,
  ) async {
    String valName;
    String plistName = '';

    switch (Platform.operatingSystem) {
      case 'android':
        if (androidName.isEmpty) {
          throw PlatformException(
              code: 'no_android_value_name',
              message:
                  'There is no provided value name for Android. androidName is null');
        }

        valName = androidName;
        break;
      case 'ios':
        if (iOSName.isEmpty) {
          throw PlatformException(
              code: 'no_ios_value_name',
              message:
                  'There is no provided value name for iOS. iOSName is null');
        }

        if (iOSPlistName.isEmpty) {
          throw PlatformException(
              code: 'no_ios_plist_name',
              message:
                  'There is no provided plist resource name for iOS. iOSPlistName is null');
        }

        valName = iOSName;
        plistName = iOSPlistName;
        break;
      default:
        throw PlatformException(
            code: 'unsupported_platform',
            message:
                'The platform ${Platform.operatingSystem} is not supported');
    }

    Map<String, dynamic> arguments = {'name': valName, 'plist': plistName};
    final val = await methodChannel.invokeMethod<String>('getValue', arguments);
    return val;
  }
}
