import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
//        body: ScaleAnimationTestRoute(),
//        body: CurvedScaleAnimationTestRoute(),
//        body: ScaleAnimationStateTestRoute(),
//        body: PageA(),
//        body: HeroAnimationRoute(),
        body: StaggerDemo(),
      ),
    );
  }
}

//1.缩放动画
class ScaleAnimationTestRoute extends StatefulWidget {
  @override
  _ScaleAnimationTestRouteState createState() => _ScaleAnimationTestRouteState();
}

//需要继承TickerProvider,如果有多个AnimationController, 则应该使用TickerProviderStateMixin
//TickerProvider: 使用屏幕刷新时钟机制，驱动动画
class _ScaleAnimationTestRouteState extends State<ScaleAnimationTestRoute> with SingleTickerProviderStateMixin  {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(vsync: this, duration: Duration(seconds: 3));
    //图片宽高从0变300
    animation = Tween(begin: 0.0, end: 300.0).animate(controller)
                                          ..addListener(() {
                                            setState(() {});
                                          });
    //执行动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset("asset/images/cat.jpeg",width: animation.value, height: animation.value,),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
}

//2.曲线缩放动画
class CurvedScaleAnimationTestRoute extends StatefulWidget {
  @override
  _CurvedScaleAnimationTestRouteState createState() => _CurvedScaleAnimationTestRouteState();
}

class _CurvedScaleAnimationTestRouteState extends State<CurvedScaleAnimationTestRoute> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    //图片宽高从0变300
    animation = Tween(begin: 0.0, end: 300.0).animate(animation)
      ..addListener(() {
        setState(() {});
      });
    //执行动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset("asset/images/cat.jpeg",width: animation.value, height: animation.value,),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
}


//3.AnimatedWidget分离: 将动画的监听和重构操作封装到了widget中
//好处是: 不用显示的添加帧监听器
class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation}): super(key: key, listenable:animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Image.asset("asset/images/cat.jpeg",width: animation.value, height: animation.value,),
    );
  }
}

class ScaleAnimationRoute extends StatefulWidget {
  @override
  _ScaleAnimationRouteState createState() => _ScaleAnimationRouteState();
}

class _ScaleAnimationRouteState extends State<ScaleAnimationRoute> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation = Tween(begin: 0.0, end: 300.0).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedImage(animation: animation,);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
}

//3.1 AnimatedBuilder 重构
//相比3的好处是：1.动画构建范围缩小了，如果没有builder，setState就会重构父Widget;
//2.AnimatedBuilder可以封装常有的动画用于复用。
class AnimatedBuilderImage extends AnimatedWidget {
  AnimatedBuilderImage({Key key, Animation<double> animation}): super(key: key, listenable:animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return AnimatedBuilder(
        animation: animation, 
        child: Image.asset("asset/images/cat.jpeg"),
        builder: (BuildContext context, Widget child) {
          return Center(
            child: Container(
              height: animation.value,
              width: animation.value,
              child: child,
            ),
          );
        },
    );
  }
}

//3.2封装复用动画
//Flutter中就是通过这种方式，封装了很多动画
class GrowTransition extends StatelessWidget {
  final Widget anmationChild;
  final Animation<double> animation;

  GrowTransition({this.anmationChild, this.animation});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
          animation: animation,
          child: anmationChild,
          builder: (BuildContext context, Widget child) {
            return Container(
              width: animation.value,
              height: animation.value,
              child: child,
            );
          },
      ),
    );
  }
}

//4.动画状态监听
class ScaleAnimationStateTestRoute extends StatefulWidget {
  @override
  _ScaleAnimationStateTestRouteState createState() => _ScaleAnimationStateTestRouteState();
}

class _ScaleAnimationStateTestRouteState extends State<ScaleAnimationStateTestRoute> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
    //图片宽高从0变300
    animation = Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    //执行动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset("asset/images/cat.jpeg",width: animation.value, height: animation.value,),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
}


//5.自定义路由切换动画
class PageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("asset/images/cat.jpeg"),
          RaisedButton(onPressed: (){
//            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
//              return PageB();
//            }));

            //自定义转场动画
            Navigator.push(context, PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 1000), //转场动画时长
                //在路由切换时，pageBuilder在每个动画帧都会被调用
                pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation){
                  return FadeTransition(opacity: animation, child: PageB(),);
                }));
          },
            child: Text("点击切换到PageB"),
          ),
        ],
      ),
    );
  }
}

class PageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("asset/images/dog.png"),
          RaisedButton(onPressed: (){

          },
            child: Text("点击切换到PageA"),
          ),
        ],
      ),
    );
  }
}


//6.Hero动画(飞向动画)
//Hero: Hero Widget将要共享的Widget包裹起来， 在两个路由页面中tag要设置相同，在路由切换时，由于位置，大小的原因产生的动画。
//动画有Flutter Framework自动完成
class HeroAnimationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: InkWell(
        child: Hero(
            tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
            child: ClipOval(
              child: Image.asset("asset/images/cat.jpeg", width: 30,),
            )),
        onTap: (){
          //打开路由B
          Navigator.push(context, PageRouteBuilder(
              pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation){
                return FadeTransition(
                  opacity: animation,
                  child: HeroAnimationRouteB(),);
              }));
        },
      ),
    );
  }
}

//路由B
class HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Hero(tag: "avatar", child: Image.asset("asset/images/cat.jpeg")),
        ],
      )
    );
  }
}


//7.交错动画：对应复杂的场景，可能存在多个动画同时存在的场景，
// 如：柱状图，在高度增长的同时改变颜色。等高度增长到最大后，沿X轴平移一段距离。
//交错动画需要多个动画对象，一个AnimationController, 给每个动画对象指定间隔
class StaggerDemo extends StatefulWidget {
  @override
  _StaggerDemoState createState() => _StaggerDemoState();
}

class _StaggerDemoState extends State<StaggerDemo> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
  }

  Future<Null> _playAnimation() async {
    try {
      //先正向执行
      await _controller.forward().orCancel;
      //后反向执行
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      //动画取消
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        _playAnimation();
      },
      child: Center(
        child: Container(
          width: 300.0,
          height: 300.0,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
            border: Border.all(
              color: Colors.black.withOpacity(0.5),
            )
          ),
          child: StaggerAnimation(controller: _controller,),
        ),
      ),
    );
  }
}


class StaggerAnimation extends StatelessWidget {
  final Animation<double> controller;
  Animation<double> height;
  Animation<EdgeInsets> padding;
  Animation<Color> color;

  StaggerAnimation({Key key, this.controller}): super(key: key) {

    height = Tween<double>(
        begin: 0.0, 
        end: 300.0
    ).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.6, curve: Curves.ease)//间隔，前60%的动画时间
    ));

    color = ColorTween(
        begin: Colors.green,
        end: Colors.red
    ).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.6, curve: Curves.ease)//间隔，前60%的动画时间
    ));

    padding = Tween<EdgeInsets>(
        begin: EdgeInsets.only(left: .0),
        end: EdgeInsets.only(left: 100.0)
    ).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.6, 1.0,curve: Curves.ease)//间隔，后40%的动画时间
    ));
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: padding.value,
      child: Container(
        color: color.value,
        width: 50.0,
        height: height.value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedBuilder(animation: controller, builder: _buildAnimation);
  }
}














