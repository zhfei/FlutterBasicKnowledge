// You have generated a new plugin project without
// specifying the `--platforms` flag. A plugin project supports no platforms is generated.
// To add platforms, run `flutter create -t plugin --platforms <platforms> .` under the same
// directory. You can also find a detailed instruction on how to add platforms in the `pubspec.yaml` at https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.

import 'dart:async';

import 'package:flutter/services.dart';

class Flutterbookpluginbatterylev {
  static const MethodChannel _channel =
      const MethodChannel('flutterbookpluginbatterylev');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }


  //平台通道，方法通道
  static const platform = const MethodChannel('samples.flutter.io/battery');
  //获取电量
  static Future<int> batteryLevel() async {
    int batteryLevel;
    try {
      final int result = await platform.invokeMethod("getBatteryLevel");
      batteryLevel = result;
    } on PlatformException catch (e) {
      batteryLevel = -1;
    }

    return batteryLevel;
  }
}
