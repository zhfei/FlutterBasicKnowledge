import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PlatformChannleDemo(),
      ),
    );
  }
}

//平台通道，方法通道：Flutter调用原生方法
class PlatformChannleDemo extends StatefulWidget {
  @override
  _PlatformChannleDemoState createState() => _PlatformChannleDemoState();
}

class _PlatformChannleDemoState extends State<PlatformChannleDemo> {
  String batteryInfo;
  //1.创建平台渠道
  static const MethodChannel channel = MethodChannel("samples.flutter.io/battery");

  Future<Null> getBatteryLevel() async {
    String _batteryResult;
    try {
      //2.调用平台渠道方法
      final int result = await channel.invokeMethod("getBatteryLevel");
      _batteryResult = "电量：$result";
    } on PlatformException catch (e) {
      _batteryResult = "电量：$e";
    }
    setState(() {
      batteryInfo = _batteryResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RaisedButton(
            child: Text("获取电量"),
            onPressed: getBatteryLevel,
          ),
          Text("$batteryInfo"),
        ],
      ),
    );
  }
}


