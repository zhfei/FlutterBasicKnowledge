import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("剪裁"),),
//        body: RowErrorDemo(),
//        body: WrapDemo(),
        body: ClipTestRoute(),
      ),
    );
  }
}


class ClipTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget avater = Image(image: AssetImage("asset/images/cat.jpeg"), width: 100,);


    return Center(
      child: Column(
        children: [
          avater,
          ClipOval(child: avater,),
          ClipRRect(child: avater, borderRadius: BorderRadius.circular(20),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                widthFactor: 0.5,//宽度设为原来宽度的一半，另一半会溢出
                child: avater,
              ),
              Text("你好世界", style: TextStyle(color: Colors.orange),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRect(
                child: Align(
                  alignment: Alignment.topLeft,
                  widthFactor: 0.5,
                  child: avater,
                ),
              ),
              Text("你好世界", style: TextStyle(color: Colors.orange),)
            ],
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: ClipRect(
              clipper: MyCustomClipper(),
              child: avater,
            ),
          ),
        ],
      ),
    );
  }
}


//自定义剪裁区域
class MyCustomClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    // TODO: implement getClip
    return Rect.fromLTWH(10, 20, 60, 60);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }

}


