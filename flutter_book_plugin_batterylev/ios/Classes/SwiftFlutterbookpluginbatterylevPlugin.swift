import Flutter
import UIKit

public class SwiftFlutterbookpluginbatterylevPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutterbookpluginbatterylev", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterbookpluginbatterylevPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
