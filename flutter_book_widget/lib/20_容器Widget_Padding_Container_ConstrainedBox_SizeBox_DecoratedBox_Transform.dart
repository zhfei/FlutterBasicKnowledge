import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("容器"),),
//        body: PaddingDemo(),
//        body: ConstrainedBoxDemo(),
//        body: SizedBoxDemo(),
//        body: MoreConstraintsDemo(),
//        body: DecoratedBoxDemo(),
//        body: TransformDemo(),
        body: ContainerDemo(),
      ),
    );
  }
}

//1.Padding: 给子widget增加留白
class PaddingDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      //上下左右 都是20个留白
      padding: EdgeInsets.all(20),
      child: Column(
        //全部左对齐，排除干扰
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("左边10个留白"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text("上下各10个留白"),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Text("上下左右各20个留白"),
          ),
        ],
      ),
    );
  }
}

//2.ConstrainedBox: 约束子widget的宽高大小
class ConstrainedBoxDemo extends StatelessWidget {
  Widget redBox = DecoratedBox(decoration: BoxDecoration(color: Colors.red));

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
//      constraints: BoxConstraints(
//        minWidth: double.infinity,//宽尽可能大
//        minHeight: 50,
//      ),
      //BoxConstraints.expand：宽高尽可能大，铺满全屏
//      constraints: BoxConstraints.expand(),
      constraints: BoxConstraints.tight(Size(200, 200)),

      child: Container(
        height: 5,
        child: redBox,
      ),

    );
  }
}

//3.SizedBox是对ConstrainedBox的内部定制，约束宽高
class SizedBoxDemo extends StatelessWidget {
  Widget blueBox = DecoratedBox(decoration: BoxDecoration(color: Colors.blue));

  @override
  Widget build(BuildContext context) {

//    return SizedBox(
//      width: 100,
//      height: 100,
//      child: blueBox,
//    );
    //上面使用SizedBox和下面使用ConstrainedBox是一样的效果
    //SizeBox是ConstrainedBox的一种定制。
    return ConstrainedBox(constraints: BoxConstraints(minWidth: 100, maxWidth: 100, minHeight: 100, maxHeight: 100),
      child: blueBox,
    );
  }
}

//4.Constraints多重约束生效方式：取多个Constraints中宽高最大值。
class MoreConstraintsDemo extends StatelessWidget {
  Widget redBox = DecoratedBox(decoration: BoxDecoration(color: Colors.red));

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 60, minHeight: 60),
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 90, minHeight: 20),
        child: redBox,
      ),
    );
  }
}


//5.UnconstrainedBox可以让父约束对子元素大小失效，但是无法让结构布局失效(留个子wiget的位置还在，失效的是子widget宽高)。
class UnConstrainedBoxDemo extends StatelessWidget {
  Widget redBox = DecoratedBox(decoration: BoxDecoration(color: Colors.red));

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 60, minHeight: 60),
      child: UnconstrainedBox(
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: 90, minHeight: 20),
          child: redBox,
        ),
      ),
    );
  }
}


//6.DecoratedBox: 在子widget绘制前，添加一个装饰（如：背景色，边框，阴影色等）。
class DecoratedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.red, Colors.orange]),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(5, 5),
            blurRadius: 5
          )
        ]
      ),
      
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
        child: Text("Login", style: TextStyle(color: Colors.white),),
      ),
    );
  }
}


//7.Transform变换，对子widget应用一个矩形变换，Matrix4是一个4D矩阵，可以实现各种矩阵操作
//Transform变换是发生在layout之后，绘制时进行的
class TransformDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
          color: Colors.black,
          child: Transform(
            alignment: Alignment.topRight, //相对于坐标原点的对齐方式
            transform: Matrix4.skewY(-0.3),//沿Y轴倾斜0.3弧度
            child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.deepOrange,
              child: Text("Apartment for rent!"),
            ),
          ),
        ),

        SizedBox(height: 20,),

        DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
          child: Transform.translate(offset: Offset(-20, -5), child: Text("平移 Hello world"),),
        ),
        SizedBox(height: 50,),
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.blue),
          child: Transform.rotate(angle: math.pi/2, child: Text('旋转 Hello world'),),
        ),
        SizedBox(height: 50,),
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
          child: Transform.scale(scale: 1.5, child: Text('缩放 Hello world'),),
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Transform变换是发生在layout之后，绘制时进行的
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Transform.scale(scale: 1.5, child: Text("Hello world 这是缩放文字"),),
            ),
            Text("这是边距：Hello world"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Transform变换是发生在layout之后，绘制时进行的
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: RotatedBox(
                quarterTurns: 1,//旋转1/4圈
                child: Text("旋转 RotatedBox,在layout阶段旋转"),
              ),

            ),
            Text("这是边距：Hello world"),
          ],
        ),
      ],
    );
  }
}


//Container并不对应一个RenderObject, 它是DecoratedBox, ConstrainedBox, Transform
//Padding, Align等widget的组合。 一个Container可以实现多种容器类型修饰
//padding：元素内边距， margin：元素外边距
class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50, left: 120),
      constraints: BoxConstraints.tight(Size(200, 150)),
      decoration: BoxDecoration(
        //径向渐变色
        gradient: RadialGradient(
          colors: [Colors.red, Colors.orange],
          center: Alignment.topLeft,
          radius: 0.98
        ),
        
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(5, 5),
            blurRadius: 10
          )
        ]
      ),
      transform: Matrix4.rotationZ(0.2),//卡片旋转
      alignment: Alignment.center,
      child: Text("5.20", style: TextStyle(color: Colors.white, fontSize: 40),),
    );
  }
}







