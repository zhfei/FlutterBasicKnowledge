import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("GridView"),),
//        body: GridViewDemo(),
//        body: GridViewDemo2(),
//        body: GridViewDemo3(),
//        body: InfiniteGridView(),
        body: flutter_staggered_grid_viewDemo(),
      ),
    );
  }
}

//1.SliverGridDelegateWithFixedCrossAxisCount 交叉轴个数: 提供GridView的layout
class GridViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, //交叉轴有子widget的个数
          childAspectRatio: 1 //子widget的宽高比为1
      ),
      children: [
        Icon(Icons.fingerprint),
        Icon(Icons.map),
        Icon(Icons.transform),
        Icon(Icons.accessibility),
        Icon(Icons.print),
        Icon(Icons.play_circle_outline),
      ],
    );
  }
}

//SliverGridDelegateWithFixedCrossAxisCount 交叉轴个数: 提供GridView的layout
class GridViewDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 1,
      children: [
        Icon(Icons.fingerprint_outlined),
        Icon(Icons.mail),
        Icon(Icons.translate),
        Icon(Icons.category),
        Icon(Icons.dashboard),
        Icon(Icons.extension),
      ],
    );
  }
}


//3.SliverGridDelegateWithMaxCrossAxisExtent 最大交叉轴长度代理: 提供GridView的layout
class GridViewDemo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 120,//最大交叉轴的长度
        childAspectRatio: 2,//宽高比
      ),
      children: [
        Icon(Icons.fingerprint_outlined),
        Icon(Icons.mail),
        Icon(Icons.translate),
        Icon(Icons.category),
        Icon(Icons.dashboard),
        Icon(Icons.extension),
      ],
    );
  }
}

//4.SliverGridDelegateWithMaxCrossAxisExtent 最大交叉轴长度代理： 提供GridView的layout
class GridViewDemo4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 120,
      childAspectRatio: 2,
      children: [
        Icon(Icons.flag),
        Icon(Icons.g_translate),
        Icon(Icons.translate),
        Icon(Icons.category),
        Icon(Icons.dashboard),
        Icon(Icons.extension),
      ],
    );
  }
}


//无限循环GridView
class InfiniteGridView extends StatefulWidget {
  @override
  _InfiniteGridViewState createState() => _InfiniteGridViewState();
}

class _InfiniteGridViewState extends State<InfiniteGridView> {
  List<IconData> _icons = [];//数据源

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _retrieveIcons();
  }


  void _retrieveIcons() {
    Future.delayed(Duration(seconds: 1)).then((value) {
      setState(() {
        _icons.addAll(
          [
            Icons.g_translate,
            Icons.flag,
            Icons.map,
            Icons.nature,
            Icons.home,
            Icons.format_align_justify,
            Icons.keyboard,
            Icons.list,
            Icons.accessibility,
            Icons.business_center,
          ]
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 1
        ),
        itemCount: _icons.length,
        itemBuilder: (BuildContext context, int index) {

          //到达最后一个cell，且总数小于200
          if (index == _icons.length - 1 && _icons.length < 200) {
            _retrieveIcons();
          }
          return Icon(_icons[index]);
        });
  }
}

//使用第三方框架布局
class flutter_staggered_grid_viewDemo extends StatefulWidget {
  @override
  _flutter_staggered_grid_viewDemoState createState() => _flutter_staggered_grid_viewDemoState();
}

class _flutter_staggered_grid_viewDemoState extends State<flutter_staggered_grid_viewDemo> {
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.green,
            child: Center(
              child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Text("$index",style: TextStyle(color: Colors.black, fontSize: 30),)
              ),
            )
          );
        },
        staggeredTileBuilder: (int index) {
          return StaggeredTile.count(2, index.isEven ? 2 : 1);
        },
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        );
  }
}


