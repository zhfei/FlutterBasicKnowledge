import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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
      appBar: AppBar(title: Text("appbar 标题"),),
      body: MyBody("my body"),
    );
  }
}

class MyBody extends StatelessWidget {
  final String desc;
  MyBody(this.desc) {
    print("StatelessWidget生命周期验证 -  1.init");
  }

  @override
  Widget build(BuildContext context) {
    print("StatelessWidget生命周期验证 -  2. build");
    return Column(
      children: [
        Text("Hello World"),
        Calculator()
      ],
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() {
    print("StatefulWidget生命周期验证 - 1.createState()");
    return _CalculatorState();
  }
}

class _CalculatorState extends State<Calculator> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //2.类似于iOS中viewDidLoad, StateWiget加载到了渲染树，但是还没有渲染出来
    print("StatefulWidget生命周期验证 - 2.initState()");
    
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      //5.屏幕第一次渲染完成后的回调,只会调用一次，后面再次刷新也不回调了
      print("StatefulWidget生命周期验证 - 5.屏幕第一次渲染完成后的回调 addPostFrameCallback（）");
    });

  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    //3.initState之后调用 or 依赖的父widget发生改变
    print("StatefulWidget生命周期验证 - 3.didChangeDependencies()");
  }
  
  @override
  Widget build(BuildContext context) {
    //4.State开始绘制，在didChangeDependencies方法调用之后执行，build方法是创建widget的方法，不用放置逻辑代码
    print("StatefulWidget生命周期验证 - 4.build()");
    return Text("这是一个StatefulWidget 中的 State 文本！");
  }
  
  @override
  void didUpdateWidget(Calculator oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    //平时不一定会调用
    print("StatefulWidget生命周期验证 - 6.通过key，复用widget时调用didUpdateWidget（）");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    //State对象从渲染树中移除
    print("StatefulWidget生命周期验证 - 7.State对象从渲染树中移除销毁时 会调用。但有时候会刚移除就重新插入，并不会销毁");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //和initState是相反的操作，在这里清理一些监听，类似于iOS中的dealloc
    print("StatefulWidget生命周期验证 - 8.State对象彻底从渲染树中移除，销毁，不再显示");
  }
}



//监听APP的生命周期
class AppLifeCycle extends StatefulWidget {
  @override
  _AppLifeCycleState createState() => _AppLifeCycleState();
}

class _AppLifeCycleState extends State<AppLifeCycle> with WidgetsBindingObserver {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //1.添加APP观察者，监听this
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //2.在State对象销毁时，取消监听
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.paused) {
      //App 进入后台
    }

    if (state == AppLifecycleState.resumed) {
      //App 返回前台
    }

  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}








