import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButtonDemo(),
                FlatButtonDemo(),
                OutlineButtonDemo(),
                IconButtonDemo(),
                CustomButtonDemo(),
                CustomShadowButtonDemo(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//带背景，带阴影
class RaisedButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: (){
          debugPrint("漂浮按钮点击");
        },
      child: Text("RaisedButton: 漂浮按钮"),
    );
  }
}

//无背景，无阴影
class FlatButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(onPressed: (){
      debugPrint("扁平按钮点击");
    }, child: Text("FlatButton: 扁平按钮")
    );
  }
}

//无背景，无阴影，带边框
class OutlineButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(onPressed: (){
      debugPrint("边框按钮点击");
    },
      child: Text("OutlineButton: 边框按钮"),
    );
  }
}

//无背景，无阴影，带图标
class IconButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(icon: Icon(Icons.phone), onPressed: (){
      debugPrint("图标按钮点击");
    });
  }
}


//自定义按钮1：对应FlatButton扁平按钮自定义
class CustomButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(onPressed: (){
      debugPrint("自定义按钮点击");
      },
      child: Text("Submit 扁平型",style: TextStyle(color: Colors.white, fontSize: 16),),
      color: Colors.blue,
      splashColor: Colors.orange,
      highlightColor: Colors.blueGrey,
      colorBrightness: Brightness.dark,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),

      );
  }
}

//自定义按钮2：将FlatButton换成RaisedButton，就变成了带阴影的自定义按钮
class CustomShadowButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(onPressed: (){
      debugPrint("自定义按钮点击");
    },
      child: Text("Submit 漂浮型",style: TextStyle(color: Colors.white, fontSize: 16),),
      color: Colors.blue,
      splashColor: Colors.orange,
      highlightColor: Colors.blueGrey,
      colorBrightness: Brightness.dark,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),

      //修改阴影
      elevation: 10,
      highlightElevation: 20,
    );
  }
}






