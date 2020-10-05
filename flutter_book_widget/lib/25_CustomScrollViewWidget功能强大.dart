import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CustomScrollViewTestRoute()
    );
  }
}

//CustomScrollView可以自定义多种风格的ScrollView
//CustomScrollView 中的子widget 必须都是Sliver（可滚动widget中的 小细条）类型的
class CustomScrollViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: [
          //AppBar, 包含一个导航栏
          SliverAppBar(
            pinned: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Sliver AppBar 标题"),
              background: Image.asset("asset/images/cat.jpeg"),
            ),
          ),

          SliverPadding(
            padding: EdgeInsets.all(8),
            sliver: SliverGrid(
                //grid item生成器
                delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                  //创建子widget
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100*(index%9)],
                    child: Text('grid item $index'),
                  );
                },
                childCount: 20,
                ),
              //grid item 布局代理
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 4,
                ),

            ),
          ),

          SliverFixedExtentList(
              //list item 生成器
              delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                //创建列表项
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100*(index%9)],
                  child: Text("list item $index"),
                );
              },
              childCount: 50
              ),
              itemExtent: 50,

          )
        ],
      ),
    );
  }
}
