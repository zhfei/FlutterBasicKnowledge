import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main(){
  debugPaintSizeEnabled = true;
  runApp(ButtonsApp());
}

//material风格按钮
/*
  RaisedButton: 一个凸起的按钮
  FloatingActionButton： 一个悬浮在内容之上的按钮，通常在Scaffold.floatingActionButton属性上面设置使用
  FlatButton：一个简单的扁平按钮
  IconButton: 图标按钮
  PopupMenuButton: 菜单隐藏式按钮，点击按钮时会弹出一个menu菜单。PopupMenuButton内部需要保存menu菜单的选中状态，所以它的外层需要是StatefulWidget。
  注意：PopupMenuButton的使用方式通常在AppBar.actions数组中进行设置。
  ButtonBar: 水平排列的按钮数组
 */

class ButtonsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Text('Scaffold 脚手架上'),
          onPressed: (){},
        ),
        appBar: AppBar(
          title: Text(" Material 风格下的 buttons"),
          actions: [
            PopupMenuButtonDemo()
          ],
        ),
        body: Center(
          child: Column(
            children: [
              RaisedButton(
                color: Colors.blue,
                child: Text('凸起 的按钮',style: TextStyle(color: Colors.white),),
                onPressed: (){},
              ),
              FloatingActionButton(
                child: Text('FloatingActionButton 悬停在内容之上的按钮'),
                onPressed: (){},
                tooltip: "提示",
              ),
              FlatButton(
                onPressed: (){},
                child: Text('Flat 扁平按钮'),
              ),
              IconButton(
                color: Colors.red,
                icon: Icon(Icons.headset_mic),
                onPressed: (){},
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  Text('button 0'),
                  Text('button 1'),
                  Text('button 2'),
                  RaisedButton(
                    child: Text('RaisedButton'),
                    onPressed: (){},
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}


class PopupMenuButtonDemo extends StatefulWidget {
  @override
  _PopupMenuButtonDemoState createState() => _PopupMenuButtonDemoState();
}

class _PopupMenuButtonDemoState extends State<PopupMenuButtonDemo> {
  Choice _slectedChoice = choices[3];

  void _select(Choice choice) {
    setState(() {
      _slectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Choice>(
      onSelected: _select,
      itemBuilder: (BuildContext context){
        return choices.skip(2).map((Choice choic) {
          return PopupMenuItem <Choice>(
            value: choic,
            child: Text(choic.title),
          );
        }).toList();
      },
      child: ChoiceCard(choice: _slectedChoice,),
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