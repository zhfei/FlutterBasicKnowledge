import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("流式布局"),),
//        body: RowErrorDemo(),
//        body: WrapDemo(),
      body: FlowDemo(),
      ),
    );
  }
}

class RowErrorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Text超出边界报错
    return Wrap(
      children: [
        Text("hello world"*100),
      ],
    );
  }
}

//可以认为Wrap除了超出屏幕会自动换行外，其他和Row,Column一样
class WrapDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      //主轴方向间隔
      spacing: 10,
      alignment: WrapAlignment.center,
      //交叉轴方向间隔
      runSpacing: 5,

      children: [
        Text("Hamilton"),
        Text("Hamilton34535345345"),
        Text("Hamiltonrtrtrtrt"),
        Text("Hamilton34444"),
        Text("Hamilton7878"),
      ],
    );
  }
}

class FlowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: TestFlowDelegate(margin: EdgeInsets.all(20)),
      children: [
        Container(
          color: Colors.red,
          width: 80,
          height: 80,
        ),
        Container(
          color: Colors.green,
          width: 80,
          height: 80,
        ),
        Container(
          color: Colors.amber,
          width: 80,
          height: 80,
        ),
        Container(
          color: Colors.indigo,
          width: 80,
          height: 80,
        ),
        Container(
          color: Colors.green,
          width: 80,
          height: 80,
        ),
        Container(
          color: Colors.black54,
          width: 80,
          height: 80,
        ),
        Container(
          color: Colors.blue,
          width: 80,
          height: 80,
        ),
        Container(
          color: Colors.purple,
          width: 80,
          height: 80,
        ),
      ],
    );
  }
}



class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    // TODO: implement paintChildren
    var y = margin.top;
    var x = margin.left;

    //计算每个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
          transform: Matrix4.translationValues(x, y, 0)
        );
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;

        //绘制子widget
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }
  
  @override
  Size getSize(BoxConstraints constraints) {
    // TODO: implement getSize
    //返回Flow的大小
    return Size(double.infinity, 400);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate != this;
  }
  

}


