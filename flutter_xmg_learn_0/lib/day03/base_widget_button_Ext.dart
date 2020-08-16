import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("基础组件 - button"),),
      body: MyBody(),
    );
  }
}

class MyBody extends StatefulWidget {
  @override
  _MyBodyState createState() => _MyBodyState();
}

//问题1. 按钮不设置内容时，也存在宽高
//原因，按钮使用了默认的ButtonTheme，其设置了最小宽高 final ButtonThemeData buttonTheme = ButtonTheme.of(context);
//解决：自定义ButtonTheme，其中设置最大最小宽高

//class _MyBodyState extends State<MyBody> {
//  @override
//  Widget build(BuildContext context) {
//    return ButtonTheme(
//      minWidth: 30,
//      height: 20,
//      child: FlatButton(
//        color: Colors.blue,
//        onPressed: () => print("自定义按钮 click"),
//
//      ),
//    );
//  }
//}


//问题2.按钮上下不能顶齐
//原因：按钮中设置了最小占据宽高是48px, 由于按钮没有这么大，所以使用空白占据
//enum MaterialTapTargetSize {
///// Expands the minimum tap target size to 48px by 48px.

//class _MyBodyState extends State<MyBody> {
//  @override
//  Widget build(BuildContext context) {
//    return Column(
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children: [
//        FlatButton(
//          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//          color: Colors.blue,
//          onPressed: () => print("自定义按钮 click"),
//          child: Text("标题文字1"),
//        ),
//        FlatButton(
//          color: Colors.blue,
//          onPressed: () => print("自定义按钮 click"),
//          child: Text("标题文字2"),
//        ),
//      ],
//    );
//  }
//}


//问题3.按钮中间的文字内容存在内边距，不能左右顶齐
//解决方法：
//minWidth: 10,
//height: 10,
//padding: EdgeInsets.all(1),

class _MyBodyState extends State<MyBody> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      minWidth: 10,
      height: 10,
      padding: EdgeInsets.all(1),
      color: Colors.blue,
      onPressed: () => print("自定义按钮 click"),
      child: Text("按钮标题"),
    );
  }
}



