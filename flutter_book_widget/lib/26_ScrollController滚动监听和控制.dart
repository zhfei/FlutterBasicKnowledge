import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      home: ScrollControllerTestRoute(),
      home: Scaffold(
        body: ScrollNotificationTestRoute(),
      ),
    );
  }
}


//1.ScrollController： 滚动控制器
class ScrollControllerTestRoute extends StatefulWidget {
  @override
  _ScrollControllerTestRouteState createState() => _ScrollControllerTestRouteState();
}

class _ScrollControllerTestRouteState extends State<ScrollControllerTestRoute> {
  ScrollController _scrollController = ScrollController();
  bool showToTopBtn = false; //是否显示返回到顶部按钮

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      debugPrint("偏移：${_scrollController.offset}");

      if (_scrollController.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_scrollController.offset >= 1000 && !showToTopBtn) {
        setState(() {
          showToTopBtn = true;
        });
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动监听标题"),
      ),
      body: Scrollbar(
        child: ListView.builder(
            itemCount: 100,
            itemExtent: 50,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(title: Text("标题：$index"),);
            },
            controller: _scrollController,
        ),
      ),
      floatingActionButton: !showToTopBtn ? null : FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: (){
            _scrollController.animateTo(0.0, duration: Duration(milliseconds: 200), curve: Curves.ease);
        },
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //避免内存泄漏，销毁变量
    _scrollController.dispose();
    super.dispose();
  }
}

//滚动位置保存
//PageStorage: 是一个功能型Widget， 它有一个PageStorageBucket(桶)，用于保存子widget的滚动offset
//如果一个页面有多个Scrollable widget需要存储滚动offset, 则需要需要指定明确的PageStorageKey

class PageStorageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView(
          key: PageStorageKey(1),
        ),
        ListView(
          key: PageStorageKey(2),
        )
      ],
    );
  }
}

//ScrollPosition
//ScrollPosition: 每个ScrollControll可同时管理多个Scroll Widget, 而其中的每个widget
//都对应一个position。 ScrollControll中的offset属性也是对position的便捷访问。（double get offset => position.pixels; ）
//ScrollControll中的属性 positions列表



//2.ScrollNotification
class ScrollNotificationTestRoute extends StatefulWidget {
  @override
  _ScrollNotificationTestRouteState createState() => _ScrollNotificationTestRouteState();
}

class _ScrollNotificationTestRouteState extends State<ScrollNotificationTestRoute> {
  String _progress = "0%";//进度百分比

  @override
  Widget build(BuildContext context) {
    return Scrollbar( //进度条
      //监听滚动通知
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          double progress = notification.metrics.pixels / notification.metrics.maxScrollExtent;
          //重新构建
          setState(() {
            _progress = "${(progress * 100).toInt()} %";
          });

          debugPrint("是否到底部：${notification.metrics.extentAfter == 0}");
          return false;
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            ListView.builder(itemBuilder: (BuildContext context, int index) {
              return ListTile(title: Text("title: $index"),);
            },
              itemExtent: 50,
              itemCount: 50,
            ),
            CircleAvatar(
              backgroundColor: Colors.blueGrey,
              radius: 30,
              child: Text(_progress),
            )
          ],
        ),
      ),
    );
  }
}



