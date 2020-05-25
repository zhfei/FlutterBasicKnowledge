import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "app 的 标题",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Page(),
    );
  }
}

class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('App Bar 的标题'),),
      body: Center(
        child: Signature(),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "常按 提示",
        child: CustomButton("长按提示的自定义按钮"),
      ),
    
    );
  }
}

// -----------------绘图-----------------------------

class Signature extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: impleSignatureStatement createState
    return SignatureState();
  }
}


//绘图算法
class SignaturePainter extends CustomPainter {
  SignaturePainter(this.points);

  final List<Offset> points;

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var paint = Paint()..color = Colors.black
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 5.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i+1] != null)
        canvas.drawLine(points[i], points[i+1], paint);
    }
  }

  @override
  bool shouldRepaint(SignaturePainter other) {
    // TODO: implement shouldRepaint
    return other.points != points;
  }
}

// 绘图状态Widget
class SignatureState extends State<Signature> {
  List<Offset> _points = <Offset>[];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails details){
        setState(() {
          RenderBox referenceBox = context.findRenderObject();
          Offset localPosition = referenceBox.globalToLocal(details.globalPosition);
          _points = List.from(_points)..add(localPosition);
        });
      },
      onPanEnd: (DragEndDetails details) {
        _points.add(null);
      },

      child: CustomPaint(painter: SignaturePainter(_points),size: Size.infinite,),
    );
  }

}

//自定义一个widget button
class CustomButton extends StatelessWidget {
  final String label;
  CustomButton(this.label);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(onPressed: (){}, child: Text(label),);
  }
}

