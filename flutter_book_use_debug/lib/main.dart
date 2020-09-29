import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'dart:developer';
import 'package:flutter/rendering.dart';

//1.Dart语法分析器，打印语法错误和警告： flutter analyze


void main() {
  //1.可视化调试开关,打开后，元素盒子外面会有一个边框
//  debugPaintSizeEnabled = true;
  //2.和1的功能一样，添加了基线提示
  debugPaintBaselinesEnabled = true;
  //3.和1的功能一样，添加了widget点击范围提示
//  debugPaintPointersEnabled = true;
  //4.展示图层轮廓，调试图层是否添加正确
//  debugPaintLayerBordersEnabled = true;
  //5.调试动画，减慢动画速度，默认是：1.0
//  timeDilation = 50;
  //6.性能问题调试：每当widget被要求重新布局时，就会将堆栈打印到控制台
//  debugPrintMarkNeedsLayoutStacks = true;
  //7.性能问题调试：每当widget被要求重新绘制时，就会将堆栈打印到控制台
//  debugPrintMarkNeedsPaintStacks = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //上表GPU，下表CPU，追踪高度超过三条线说明运行频率低于60Hz,需要性能优化
      showPerformanceOverlay: true,
      //开启网格调试，用于元素对齐
//      debugShowMaterialGrid: true,
      title: "MaterialApp title",
      home: Scaffold(
        appBar: AppBar(title: Text("AppBar titile"),),
        body: MyBody(),
      ),
    );
  }
}

class MyBody extends StatelessWidget {

  var btn = Icon(Icons.phone);

  // 3. 对象描述打印
  // 包含runtimeType 的单行输出
  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    // TODO: implement toString
    return super.toString();
  }
  // 从该点，返回整个子树的多行描述
  @override
  String toStringDeep({String prefixLineOne = '', String prefixOtherLines, DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    // TODO: implement toStringDeep
    return super.toStringDeep();
  }
  // 返回简短的描述
  @override
  String toStringShort() {
    // TODO: implement toStringShort
    return super.toStringShort();
  }




  @override
  Widget build(BuildContext context) {

    //测试Dart代码性能
//    Timeline.startSync('测试方法1运行时长');
//    iWonderHowLongThisTakes();
//    Timeline.finishSync();

    return Center(
      child: Column(
        children: [
          Text("Flutter 调试"),
          FlatButton(onPressed: (){
            // widget层 状态转存
            // 这是widget根对象调用toStringDeepwidget函数输出。可以看到内部系统插入的widget,手势监听TapGestureDetector
            debugDumpApp();
          }, child: Text("Dump App")),

          FlatButton(onPressed: (){
            // 渲染层 状态转存
            // 这是根RenderObject 对象的toStringDeep函数输出，用于查看布局问题
            debugDumpRenderTree();
          }, child: Text("Dump Render Tree")),

          FlatButton(onPressed: (){
            // 层 调试合成问题
            // 这是根Layer 的toStringDeep函数输出。屏幕的渲染量
            debugDumpLayerTree();
          }, child: Text("Dump Layer Tree")),

          FlatButton(onPressed: (){
            // 获取语义树
            // 呈现给系统可访问API的树
//            debugDumpSemanticsTree(childOrder);
          }, child: Text("Dump Smantics Tree")),
        ],
      ),
    );
  }
}

void someFunction(double offset) {
  debugger(when: offset > 30.0);

  //2.可以通过flutter logs 查看print()打印到系统控制台的信息
  print("打印信息 将输出到系统控制台");
  debugPrint('可以使用此方法替代');
}


void runModel() {
  // flutter run : flutter 的调试模式
  // flutter run --release 关闭调试模式，开启发布模式
  // flutter run --profile 关闭出Observatory之外的所有调试辅助工具。

  // flutter run --trace-startup --profile 打印Flutter项目启动耗时
  //（ 进入Flutter引擎时. 展示应用第一帧时. 初始化Flutter框架时. 完成Flutter框架初始化时.）

}

void iWonderHowLongThisTakes() {
  sleep(Duration(seconds: 2));
  debugPrint("测试耗时");
}
