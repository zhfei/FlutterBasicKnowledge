import 'package:flutter/material.dart';

//滚动视图折叠工具栏

void main(){
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "title",
      home: MyNestedScrollViewBodyList(),
    );
  }
}

//1
class MyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            title: Text("标题：$index"),
          );
        },
      ),
    );
  }
}

//2
class MyNestedScrollViewBodyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return [
            SliverAppBar(
              floating: true,
              pinned: false,
              snap: false,
              title: Text("Sliver appBar title"),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text("FlexibleSpaceBar"),
                background: Image.asset("asset/images/cat.jpeg", fit: BoxFit.fill,),
              ),
              expandedHeight: 200,
            )
          ];
        },
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index){
            return ListTile(title: Text("标题：$index"),);
          },
          itemCount: 50,
        ),
      ),
    );
  }
}


//3
class MyNestedScrollViewBody extends StatefulWidget {
  @override
  _MyNestedScrollViewBodyState createState() => _MyNestedScrollViewBodyState();
}

class _MyNestedScrollViewBodyState extends State<MyNestedScrollViewBody> with TickerProviderStateMixin {
  ScrollController _scrollController;

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: Text("Sliver appBar 的标题"),
              floating: false,
              snap: false,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text("弹性区域标题", style: TextStyle(color: Colors.red, fontSize: 20),),
                background: Image.asset("asset/images/cat.jpeg", fit: BoxFit.fill,),
                collapseMode: CollapseMode.pin, //视觉效果
              ),
              expandedHeight: 200,

              bottom: TabBar(
                controller: _tabController, tabs: [
                  Tab(text: "首页",),
                  Tab(text: "消息",),
                  Tab(text: "购物",),
                  Tab(text: "我的",),
              ],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            Center(child: Text("首页"),),
            Center(child: Text("消息"),),
            Center(child: Text("购物"),),
            Center(child: Text("我的"),),
          ],
        )
      ),
    );
  }
}


