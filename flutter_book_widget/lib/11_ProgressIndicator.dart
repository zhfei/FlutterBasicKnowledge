import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LinearProgressIndicatorDemo(),
              CircleProgressIndicatorDemo(),
              CustomProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}

class LinearProgressIndicatorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          LinearProgressIndicator(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: LinearProgressIndicator(
              backgroundColor: Colors.red,
              value: 0.2,
              minHeight: 10,
            ),
          ),
        ],
      ),
    );
  }
}


class CircleProgressIndicatorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircularProgressIndicator(
          //渐变色
//          valueColor: ColorTween(
//            begin: Colors.green,
//            end: Colors.red
//          ).animate(_controller),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: CircularProgressIndicator(
            value: 0.3,
            backgroundColor: Colors.grey[400],
            strokeWidth: 10,
          ),
        )
      ],
    );
  }
}


class CustomProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(

        children:[
          //通过使用SizedBox作为父容器，改变带有默认宽高的子widget的size
          SizedBox(
            height: 10,
            child: LinearProgressIndicator(),
          ),
          SizedBox(height: 20,),
          SizedBox(
            width: 80,
            height: 80,
            child: CircularProgressIndicator(),
          ),
          SizedBox(height: 20,),
          //自定义颜色
          //1.通过设置主题的方式，进度条默认是取主题颜色设置成自己的颜色
          Theme(
              data: ThemeData(primarySwatch: Colors.green),
              child: LinearProgressIndicator(),
          ),
          SizedBox(height: 20,),
          //2.通过给valueColor 设置AlwaysStoppedAnimation<Color>来固定颜色
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          )
        ],
      ),
    );
  }
}



