import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController;
    let batterChannel = FlutterMethodChannel.init(name: "samples.flutter.io/battery", binaryMessenger: controller.binaryMessenger);
    //实现平台通道回调
    batterChannel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
        //TODO:
        if ("getBatteryLevel" == call.method) {
            self.receiveBatteryLevel(result: result);
        } else {
            result(FlutterMethodNotImplemented);
        }
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    

    func receiveBatteryLevel(result: FlutterResult) {
        let device: UIDevice = UIDevice.current;
        device.isBatteryMonitoringEnabled = true;
        if (device.batteryState == .unknown) {
            result(FlutterError.init(code: "UNAvalilable", message: "Battery info", details: nil));
        } else {
            result(Int(device.batteryLevel * 100));
        }
    }
}
