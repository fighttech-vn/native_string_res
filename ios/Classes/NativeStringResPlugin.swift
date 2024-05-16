import Flutter
import UIKit

public class NativeStringResPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "native_string_res", binaryMessenger: registrar.messenger())
    let instance = NativeStringResPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getValue":
      guard let arguments = call.arguments as? [String: Any],
            let name = arguments["name"] as? String,
            let plist = arguments["plist"] as? String,
            let plistPath = Bundle.main.path(forResource: plist, ofType: "plist") else {
          result(FlutterError(code: "missing_arguments", message: "Invalid arguments", details: nil))
          return
      }

      guard let plistDict = NSDictionary(contentsOfFile: plistPath) as? [String: Any] else {
          result(FlutterError(code: "invalid_plist", message: "An error occurred while parsing the property list", details: nil))
          return
      }

      guard let value = plistDict[name] else {
          result(FlutterError(code: "missing_key", message: "Key does not exist", details: nil))
          return
      }

      if let stringValue = value as? String {
          result(stringValue)
      } else {
          result(FlutterError(code: "not_a_string", message: "Value is not a string", details: nil))
      }
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
