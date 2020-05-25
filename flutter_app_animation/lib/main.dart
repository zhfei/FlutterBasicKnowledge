import 'package:flutter/material.dart';

void main() {
  runApp(SampleApp());
}

// 根Widget
class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '动画app 标题',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyFadeTest(title: '动画app 标题',),
    );
  }
}

// home页Widget
class MyFadeTest extends StatefulWidget {
  MyFadeTest({Key key, this.title}): super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyFadeTest();
  }
}

// home页Widget内 子Widgets工厂
class _MyFadeTest extends State<MyFadeTest> with TickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation corve;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    corve = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),),
      body: Center(
        child: Container(
          child: FadeTransition(
            opacity: corve,
            child: FlutterLogo(size: 100,),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "颜色渐变",
        child: Icon(Icons.brush),
        onPressed: (){
          controller.forward();
        },
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

}