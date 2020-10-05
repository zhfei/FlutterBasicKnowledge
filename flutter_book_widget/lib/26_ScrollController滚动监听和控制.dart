import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("ScrollController 滚动控制器"),),
//        body: RowErrorDemo(),
//        body: WrapDemo(),
        body: ScrollControllerTestRoute(),
      ),
    );
  }
}


class ScrollControllerTestRoute extends StatefulWidget {
  @override
  _ScrollControllerTestRouteState createState() => _ScrollControllerTestRouteState();
}

class _ScrollControllerTestRouteState extends State<ScrollControllerTestRoute> {
  ScrollController _scrollController = ScrollController();
  bool showToTopBtn = false; //是否显示返回到顶部按钮

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

