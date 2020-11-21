import 'package:flutter/material.dart';

void main() => runApp(MaterialComponentApp());

//MaterialComponentWidgets

//App结构和导航
/*
  Scaffold: 脚手架
  AppBar: 工具栏和其他widget(TabBar,FlexibleSpaceBar等)组成
  BottomNavigationBar: 底部导航条，通过它可以在tab之间切换，浏览顶级视图，它切换的是Scaffold的body属性值
  TabBar: 显示水平选项卡的widget, 1.TabBar的tabs列表存放Tab，2.TabBar被设置在AppBar的bottom属性上，3.TabBar的外层要有DefaultTabController
  如：DefaultTabController的child为Scaffold，Scaffold的appBar为AppBar，AppBar的bottom为TabBar，TabBar的tabs为Tab; 另外可以设置tabs滚动显示，设置属性isScrollable为true
  TabBarView: 显示与当前TabBar选中的选项卡相对于的视图，与TabBar一起使用，TabBarView下的children属性与TabBar下的tabs属性相对于。TabBarView是Scaffold的body属性值
  MaterialApp: 一个widget,封装了APP实现Material Design所需要的一些widget, 如：APP风格.
  WidgetsApp: 和MaterialApp相对应，也是封装了app通常所需要的一些widget，如: APP风格。
  Drawer: Material风格提供了2种导航的方式，TabBar和Drawer。当没有多余的空间放下TabBar时，可以考虑使用Drawer。它的位置在Scaffold的drawer上设置。
  注意：1.虽然Scaffold的drawer要设置的类型是Widget，但是还是建议使用Drawer，这样可以保持Material风格。2.Drawer的child属性设置为ListView，ListView的children属性设置为DrawerHeader，ListTile。
  3.要点击Drawer中的ListTile推出Drawer时，可以使用Navigator.pop(context)，但是条件是Drawer的外层要被StatefulWidget包裹。
 */

class MaterialComponentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Material Components Material类型的组件'),
            bottom: TabBar(
              isScrollable: true,
              tabs: choices.map((Choice choice) {
                return Tab(text: choice.title,icon: Icon(choice.icon),);
              }).toList(),
            ),
          ),
          drawer: DrawerInStatefulWidget(),

          body: TabBarView(
            children: choices.map((Choice choice) {
              return Padding(
                padding: EdgeInsets.all(16),
                child: ChoiceCard(choice: choice,),
              );
            }).toList(),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: 1,
            items: [
              BottomNavigationBarItem(
                  label: "itme0",
                  icon: Icon(Icons.send),
                  activeIcon: Icon(Icons.send, color: Colors.red,)

              ),
              BottomNavigationBarItem(
                  label: "itme1",
                  icon: Icon(Icons.arrow_upward)
              ),
              BottomNavigationBarItem(
                  label: "itme2",
                  icon: Icon(Icons.business_center)
              ),
            ],
          ),
        ),
      ),
    );
  }

}

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'CAR', icon: Icons.directions_car),
  const Choice(title: 'BICYCLE', icon: Icons.directions_bike),
  const Choice(title: 'BOAT', icon: Icons.directions_boat),
  const Choice(title: 'BUS', icon: Icons.directions_bus),
  const Choice(title: 'TRAIN', icon: Icons.directions_railway),
  const Choice(title: 'WALK', icon: Icons.directions_walk),
];


class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}): super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          children: [
            Icon(choice.icon, size: 128, color: textStyle.color,),
            Text(choice.title, style: textStyle,),
          ],
        ),
      ),
    );
  }
}


class DrawerInStatefulWidget extends StatefulWidget {
  @override
  _DrawerInStatefulWidgetState createState() => _DrawerInStatefulWidgetState();
}

class _DrawerInStatefulWidgetState extends State<DrawerInStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text('Drawer Header,和TabBar相对应的另一种导航方式'),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            title: Text('item 1'),
            onTap: (){
              print("item 1 taped");
            },
          ),
          ListTile(
            title: Text('item 2'),
            onTap: (){
              print("item 2 taped");
            },
          ),
          ListTile(
            title: Text('点击 pop栈，退出Drawer'),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}