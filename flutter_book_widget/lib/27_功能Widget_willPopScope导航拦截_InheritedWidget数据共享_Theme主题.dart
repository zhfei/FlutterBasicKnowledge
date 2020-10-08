import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      home: Scaffold(
////        body: WillPopScopeTestRoute(),
//        body: InheritedWidgetTestRoute(),
//      ),
      home: ThemeTestRoute(),
    );
  }
}


//1.WillPopScope: 返回事件拦截
class WillPopScopeTestRoute extends StatefulWidget {
  @override
  _WillPopScopeTestRouteState createState() => _WillPopScopeTestRouteState();
}

class _WillPopScopeTestRouteState extends State<WillPopScopeTestRoute> {
  DateTime _lastPressAt; //上次点击时间
  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Container(
          alignment: Alignment.center,
          child: Text("1秒内连续点击2次，可推出"),
        ),
        onWillPop: () async {
          if (_lastPressAt == null || DateTime.now().difference(_lastPressAt) > Duration(seconds: 1)) {
            _lastPressAt = DateTime.now();
            return false;
          }
          return true;
        });
  }
}


//2.InheritedWidget: 遗传Widget,子widget可共享这里面的数据
class InheritedWidgetTestRoute extends StatefulWidget {
  @override
  _InheritedWidgetTestRouteState createState() => _InheritedWidgetTestRouteState();
}

class _InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShareDataWidget(
        data: count,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 50),
              //子widget中依赖了父ShareDataWidget中的数据
              child: _InheritedTestWidget(),
            ),
            RaisedButton(onPressed: (){
              //重新build时，ShareDataWidget中的数据会更新
              setState(() {
                count++;
              });
            },
              child: Text("点击 +1"),
            )
          ],
        ),
      ),
    );
  }
}

//创建遗传widget
class ShareDataWidget extends InheritedWidget {
  int data;//需要在子widget中共享的数据
  ShareDataWidget({@required this.data, Widget child}):super(child: child);

  //定义一个便捷方法，方便子widget访问共享数据
  static ShareDataWidget of (BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
  }

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    // TODO: implement updateShouldNotify
    //返回true: 通知子widget中依赖了data的widget更新，调用方法void didChangeDependencies()
    return oldWidget.data != data;
  }

}

//使用InheritedWidget中共享的数据
class _InheritedTestWidget extends StatefulWidget {
  @override
  __InheritedTestWidgetState createState() => __InheritedTestWidgetState();
}

class __InheritedTestWidgetState extends State<_InheritedTestWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(ShareDataWidget.of(context).data.toString());
  }
  
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    //如果build方法中没有依赖InheritedWidget中的数据，就不会被调用
    debugPrint("Dependencies changed");
  }
}


//Theme: 肤色切换
class ThemeTestRoute extends StatefulWidget {
  @override
  _ThemeTestRouteState createState() => _ThemeTestRouteState();
}

class _ThemeTestRouteState extends State<ThemeTestRoute> {
  Color _themeColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Theme(
        data: ThemeData(
          primarySwatch: _themeColor,//用于导航栏，FloatingActionButton的背景色
          iconTheme: IconThemeData(color: _themeColor),
        ),
        child: Scaffold(
          appBar: AppBar(title: Text("主题色 切换"),),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite),
                  Icon(Icons.airport_shuttle),
                  Text("  颜色跟随主题  ")
                ],
              ),
              //第二行Icon自定义颜色（固定为黑色）
              Theme(
                  data: ThemeData(
                    iconTheme: IconThemeData(color: Colors.black),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.favorite),
                      Icon(Icons.airport_shuttle),
                      Text("  颜色颜色固定为黑色  ")
                    ],
                  ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(onPressed: (){
            setState(() {
              _themeColor = _themeColor == Colors.teal?Colors.blue:Colors.teal;
            });
            debugPrint("按钮点击。。。");
          },
            child: Icon(Icons.palette),
          ),
        ),
    );
  }
}




