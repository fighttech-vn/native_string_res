# native_string_res

Read values from Native

Flutter plugin for getting native string resources

  ```
///
/// Need define values in native
/// [Android]: `android/app/build.gradle` (or `/android/app/src/main/res/values/string.xml`)
/// [iOS]: `ios/Runner/Info.plist`
///
static Map<String, dynamic> _valuesNative = {};

  static Future<void> loadNative() async {
    _valuesNative = await loadNativeValues([
      ('deeplink_host', 'deeplink_host', 'deeplink_host', 'Info'),
    ]);
  }

  static String get deeplinkHost => _valuesNative['deeplink_host'];
```

## Usage
Check the example folder for code examples.
To get a string resource, create a `NativeStringResource` instance. The constructor is the following:

- String androidName: Name of string resource for Android
- String iOSName: Name of string resource for iOS
- String iOSPlistName: Name of property list file for iOS __(omit the .plist extension)__

All of these arguments can be omitted if, e.g., you are only fetching values for one platform.

To get the actual string from the resource, call the `value` getter of the created instance. Example:
```dart
var helloRes = await NativeStringRes().getValue(
  androidName: 'hello',
  iOSName: 'hello',
  iOSPlistName: 'Info',
)

print( helloRes);
```
This will print `Hello world!` in the example project.

Setting values is __not__ supported. Values other than strings are __not__ supported

## Maintenance
This was a quick and dirty plugin I wrote so don't expect updates. Feel free to fork as I won't license this

Thanks for `https://pub.dev/packages/flutter_native_string_res`
