import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
//        body: PointerDemo(),
//        body: GestureDetectorTestRoute(),
//        body: _Drag(),
//        body: _ScaleTestRoute(),
//        body: _GestureRecognizerTestRoute(),
//        body: NotificationDemo(),
        body: NotificationTestRoute(),
      ),
    );
  }
}

//1.Flutter手势系统分两层，第一层：原始指针，坐标点（pointer），第二层：手势
//AbsorbPointer和IgnorePointer都可以阻止点击事件：区别是AbsorbPointer是吸收事件，本身的监听可以接收，子Listener无法接听
//IgnorePointer都不可以接收点击
class PointerDemo extends StatefulWidget {
  @override
  _PointerDemoState createState() => _PointerDemoState();
}

class _PointerDemoState extends State<PointerDemo> {
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Listener(
          onPointerDown: (PointerDownEvent event) {
            setState(() {
              _event = event;
            });
          },
          onPointerUp: (event) {
            setState(() {
              _event = event;
            });
          },
          onPointerCancel: (event) {
            setState(() {
              _event = event;
            });
          },
          onPointerMove: (event) {
            setState(() {
              _event = event;
            });
          },
          child: Center(
            child: Container(
              width: 300,
              height: 150,
              alignment: Alignment.center,
              color: Colors.blue,
              child: Text(_event.toString(),style: TextStyle(color: Colors.white),),
            ),
          ),
        ),
        
        Listener(
          child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(300, 200)),
            child: Center(
              child: Text("Box A"),
            ),

          ),
          behavior: HitTestBehavior.opaque,//将当前widget当成不透明处理（即使是透明的）
//          behavior: HitTestBehavior.translucent,//当点击透明区域时，下面的widget可以进行命中测试，（Stack可以实现"点透"效果）
          onPointerDown: (event) => debugPrint("down A"),
        ),

        //模拟点击透明widget效果
        Stack(
          children: [
            Listener(
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(Size(300, 200)),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.teal),
                ),
              ),
              onPointerDown: (event) => debugPrint("down 0"),
            ),
            Listener(
              child: ConstrainedBox(
                  constraints: BoxConstraints.tight(Size(200, 100),),
                child: Text("左上角200*100范围内，非文本区域点击"),
              ),
              onPointerDown: (event) => debugPrint("down 1"),
//              behavior: HitTestBehavior.translucent, //测试无法进行透明穿透
            ),

          ],
        ),

        //AbsorbPointer和IgnorePointer都可以阻止点击事件：区别是AbsorbPointer是吸收事件，本身的监听可以接收，子Listener无法接听
        //IgnorePointer都不可以接收点击
        Listener(
          child: AbsorbPointer(
            child: Listener(
              child: Container(
                width: 200,
                height: 100,
                color: Colors.red,
              ),
              onPointerDown: (event) => debugPrint("AbsorbPointer吸收点击事件后 子Listener 点击"),
            ),
          ),
          onPointerDown: (event) => debugPrint("AbsorbPointer吸收点击事件外一层的 父Listener 点击"),
        ),
        Listener(
          child: IgnorePointer(
            child: Listener(
              child: Container(
                width: 200,
                height: 100,
                color: Colors.blue,
              ),
              onPointerDown: (event) => debugPrint("IgnorePointer吸收点击事件后 子Listener 点击"),
            ),
          ),
          onPointerDown: (event) => debugPrint("IgnorePointer吸收点击事件外一层的 父Listener 点击"),
        ),
      ],
    );
  }
}


//2.GestureDetector: 手势识别
class GestureDetectorTestRoute extends StatefulWidget {
  @override
  _GestureDetectorTestRouteState createState() => _GestureDetectorTestRouteState();
}

class _GestureDetectorTestRouteState extends State<GestureDetectorTestRoute> {
  String _operation = "NO Gesture detected!";//保存事件名

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          width: 200,
          height: 100,
          child: Text(_operation, style: TextStyle(color: Colors.white),),
        ),
        onTap: () => _updateText("Tap"),
        onDoubleTap: () => _updateText("DoubleTap"),
        onLongPress: () => _updateText("LongPress"),
      ),
    );
  }

  void _updateText(String value) {
    setState(() {
      _operation = value;
    });
  }
}


//3.手势拖动，滑动
class _Drag extends StatefulWidget {
  @override
  __DragState createState() => __DragState();
}

class __DragState extends State<_Drag> with SingleTickerProviderStateMixin {
  double _top = 100; //距离顶部的偏移
  double _left = 100;

  double _top2 = 200; //距离顶部的偏移
  double _left2 = 100;

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(child: Text("任意方向拖动监听"),radius: 40,),
            onPanDown: (DragDownDetails e) {
              debugPrint("手指按下时：${e.globalPosition}");
            },
            onPanUpdate: (DragUpdateDetails e) {
              //手指滑动时
              setState(() {
                _left += e.delta.dx;
                _top += e.delta.dx;
              });
            },
            onPanEnd: (DragEndDetails e){
              debugPrint("手指抬起时,X Y 轴上的速度：${e.velocity}");
            },
          ),
        ),

        Positioned(
          top: _top2,
          left: _left2,
          child: GestureDetector(
            child: CircleAvatar(child: Text("垂直拖动监听"),backgroundColor: Colors.red, radius: 40,),
            onVerticalDragUpdate: (DragUpdateDetails e) {
              setState(() {
                _top2 += e.delta.dy;
              });
            },
          ),
        )
      ],
    );
  }
}

//4.缩放
class _ScaleTestRoute extends StatefulWidget {
  @override
  __ScaleTestRouteState createState() => __ScaleTestRouteState();
}

class __ScaleTestRouteState extends State<_ScaleTestRoute> {
  double _width = 300.0;//修改图片宽度达到缩放效果
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onScaleUpdate: (ScaleUpdateDetails details){
          //缩放倍数在0.8和10倍之间
          setState(() {
            _width = 300.0*details.scale.clamp(0.8, 10);
          });
          debugPrint("缩放比例：${details.scale}");
        },
        child: Image.asset("asset/images/cat.jpeg", width: _width,),
      ),
    );
  }
}

//5.GestureRecognizer: 手势识别器
//手势事件的封装层级是：Listener -> GestureRecognizer -> GestureDetector;
//从基本点击指针事件 -> （封装处理）手势识别者 -> （封装处理）手势探测器
class _GestureRecognizerTestRoute extends StatefulWidget {
  @override
  __GestureRecognizerTestRouteState createState() => __GestureRecognizerTestRouteState();
}

class __GestureRecognizerTestRouteState extends State<_GestureRecognizerTestRoute> {
  TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  bool _toggle = false; //变色开关

  @override
  void dispose() {
    // TODO: implement dispose

    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(TextSpan(
        children: [
          TextSpan(text: "你好世界"),
          TextSpan(text: "点我变色",
              recognizer: _tapGestureRecognizer..onTap = (){
                setState(() {
                  _toggle = !_toggle;
                });
              },
              style: TextStyle(color: _toggle?Colors.red:Colors.blue, fontSize: 30),
          ),
          TextSpan(text: "Hello world"),
        ],
      )),
    );
  }
}



//6.解决手势冲突：手势冲突是语义级别的，如果在复杂场景出现冲突，可以直接使用Listener进行监听原始指针事件
class _GestureConflictTestRoute extends StatefulWidget {
  @override
  __GestureConflictTestRouteState createState() => __GestureConflictTestRouteState();
}

class __GestureConflictTestRouteState extends State<_GestureConflictTestRoute> {

  double _top2 = 200; //距离顶部的偏移
  double _left2 = 100;

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        Positioned(
          top: _top2,
          left: _left2,
          child: Listener(
            onPointerDown: (PointerDownEvent event){
              debugPrint("down: ${event.position}");
            },
            onPointerUp: (PointerUpEvent event){
              debugPrint("up: ${event.position}");
            },

            child: GestureDetector(
              child: CircleAvatar(child: Text("垂直拖动监听"),backgroundColor: Colors.red, radius: 40,),
              onVerticalDragUpdate: (DragUpdateDetails e) {
                setState(() {
                  _top2 += e.delta.dy;
                });
              },
            ),
          ),
        )
      ],
    );
  }
}


//7.事件总线

//订阅者回调签名
typedef void EventCallback(arg);

class EventBus {
  //私有构造函数
  EventBus._initernal();

  //dart中的单例实现：static + factory
  //保存单例
  static EventBus _singleton = EventBus._initernal();
  //工厂构造方法
  factory EventBus() => _singleton;

  //保存事件订阅者队列，key:事件名id, value:对应事件的订阅者队列
  var _emap = Map<Object, List<EventCallback>>();
  //添加订阅者
  void on(eventName, EventCallback f) {
    if (eventName == null || f == null) return;
    _emap[eventName] ??= List<EventCallback>();
    _emap[eventName].add(f);
  }
  //移除订阅者
  void off(eventName, EventCallback f) {
    var list = _emap[eventName];
    if (eventName == null || list == null) return;
    if (f == null) {
      _emap[eventName] = null;
    } else {
      _emap[eventName].remove(f);
    }
  }
  //触发事件，事件触发后该事件的所有订阅者都会被调用
  void emit(eventName, [arg]) {
    var list = _emap[eventName];
    if (eventName == null || list == null) return;

    int len = list.length - 1;
    for (int i = len; i > -1; i--) {
      list[i](arg);
    }
  }
}
//使用时，定义一个全局变量，页面引入该文件后可以直接使用
var bus = EventBus();


//8.Notification: 每个子widget都可以发出一个通知，使用通知冒泡的方式，让父widget监听并处理
//通知冒泡和用户触摸事件冒泡的区别：通知冒泡可以终止，用户触摸事件冒泡不可终止
class NotificationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (notification){
        switch(notification.runtimeType){
          case ScrollStartNotification: debugPrint("开始滚动"); break;
          case ScrollUpdateNotification: debugPrint("正在滚动"); break;
          case ScrollEndNotification: debugPrint("结束滚动"); break;
          case OverscrollNotification: debugPrint("滚动到边界"); break;
        }
        return true;
      },
      child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(title: Text("标题： $index"),);
          },
        itemCount: 20,
        itemExtent: 50,
      ),
    );
  }
}


//9.自定义通知
class MyNotification extends Notification {
  final String msg;
  MyNotification(this.msg);
}

//context是操作Element树中对应Element的入口
//context和Element一一对应。
//所以使用Builder创建RaisedButton,然后使用RaisedButton对应的context发送通知
class NotificationTestRoute extends StatefulWidget {
  @override
  _NotificationTestRouteState createState() => _NotificationTestRouteState();
}

class _NotificationTestRouteState extends State<NotificationTestRoute> {
  String _msg = "";

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
        onNotification: (MyNotification notification){
          setState(() {
            _msg += notification.msg;
          });
          return true;
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //所以使用Builder创建RaisedButton,然后使用RaisedButton对应的context发送通知
              Builder(builder: (BuildContext context) {
                return RaisedButton(
                    onPressed: (){
                      MyNotification("Hi, ").dispatch(context);
                    },
                  child: Text("点击发送通知"),
                );
              }),
              Text(_msg),
            ],
          ),
        ),
    );
  }
}












