package vn.fighttech.native_string_res

import android.content.Context
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** NativeStringResPlugin */
class NativeStringResPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var context: Context

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "native_string_res")
    channel.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext // Get the context from FlutterPluginBinding
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getValue") {
      val name: String? = call.argument("name")
      val resId = context.resources.getIdentifier(name, "string", context.packageName)
      if (resId == 0) {
        result.error("resource_missing", "The requested resource '$name' does not exist", null)
      } else {
        result.success(context.getString(resId))
      }

    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
