
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//文本段落

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TextSpanWidget(),
      ),
    );
  }
}


class TextSpanWidget extends StatelessWidget {
  void _tapAction() {
    debugPrint("点击链接");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text.rich(TextSpan(
            children: [
              TextSpan(
                text: "Home: ",
              ),
              TextSpan(
                text: "https://www.flutterchina.club",
                style: TextStyle(
                  color: Colors.blue,
                ),
              )
            ],

          )),
          DefaultTextStyleDemo(),
          GoogFontDemo()
        ],
      ),
    );
  }
}

//默认文本样式
class DefaultTextStyleDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return DefaultTextStyle(
        style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
      //创建了一个DefaultTextStyle，其子节点下的Text会默认继承样式
        child: Column(
          children: [
            Text("Hello world"),
            Text("Hello jack"),
            Text("Hello tom" ,
              //除非指定不继承
              style: TextStyle(inherit: false, color: Colors.green),
            ),
          ],
        ),
    );
  }
}


//1.从google下载font字体文件
//2.在pubspec.yaml中进行声明，并执行packages get
//3.通过fontFamily进行引用
class GoogFontDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Goog Font ", style: TextStyle(fontFamily: "JosefinSans", color: Colors.deepPurpleAccent),);
  }
}


//使用当前package或者别的package中的字体，需要显示声明package名称
//1.如果在pubspec.yaml中进行了声明  - asset: asset/fonts/JosefinSans-Regular.ttf
//则font文件在对应的目录下面。

//2.如果font文件在/lib目录下，则可以不用在pubspec.yaml中进行声明。

class PackageFontDemo extends StatelessWidget {
  final TextStyle _textStyle = TextStyle(
    package: "包名", //从当前包中获取font
    fontFamily: "选择的font名称"
  ) ;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}





