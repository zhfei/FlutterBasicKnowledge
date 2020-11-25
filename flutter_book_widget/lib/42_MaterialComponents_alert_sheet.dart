import 'package:flutter/material.dart';

/*
  Dialog:
  SimpleDialog: 简单对话框，可以显示附加的提示和操作。通过SimpleDialog.children设置title和按钮, 点击按钮调用Navigator.of(context).pop();退出弹窗
  AlertDialog: alert对话框，一个会中断用户操作的对话框，需要确认。通过AlertDialog.actions设置'确认'，'取消'按钮；AlertDialog.title和AlertDialog.content用来设置标题和内容
  BottomSheet:
  ModalBottomSheet: 带一个半透明背景的BottomSheet，可以在这个BottomSheet上添加自定义的widget。ModalBottomSheet构造函数不是一定要有context,所以它不一定写在build方法内。通过调用方法showModalBottomSheet(出现。
  PersistentBottomSheet: 带一个半透明背景的BottomSheet，可以在这个BottomSheet上添加自定义的widget。PersistentBottomSheet构造函数是一定要有context的,所以它一定写在build方法内。通过调用方法showBottomSheet(出现。
  另外它的左上角会有一个返回按钮。
  ExpansionPanel
  ExpansionPanel: 非常实用的展开控件，如：打开关闭二级菜单,用在列表中点击展开；
  扩展面板ExpansionPanel有3个属性，headerBuilder表示未展开时的视图，body表示展开后的视图，isExpanded表示当前是否处于展开状态。
  ExpansionPanel需要存在于ExpansionPanelList列表中，在ExpansionPanelList列表中可以设置expansionCallback点击回调事件，通过ExpansionPanelList.children它来设置列表中的内容,ExpansionPanelList需要传入content上下文环境
  ExpansionPanelList需要放在滚动视图SingleChildScrollView中，或者ListView中，因为它需要一个可以自动变动高度的父widget,SingleChildScrollView通过physics设置是否可以滚动。
  SnackBar:
  SnackBar: 从底部弹出的小提示，如果"删除成功"等。弹出SnackBar时，需要先创建SnackBar对象，然后调用Scaffold.of(context).showSnackBar(snackBar);才能弹出

 */

void main(){
//  debugPaintSizeEnabled = true;
  runApp(MyAlertApp());
}


class MyAlertApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('弹框 appBar'),
          actions: [
            SimpleDialogDemo(),
            AlertDialogDemo(),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Text('Alert 弹框'),
              BottomSheetDemo(),
              ExpansionPanelDemo(),
              SnackBarDemo()
            ],
          ),


        ),
      ),
    );
  }
}

//SimpleDialog
class SimpleDialogDemo extends StatefulWidget {
  @override
  _DialogDemoState createState() => _DialogDemoState();
}

class _DialogDemoState extends State<SimpleDialogDemo> {
  @override
  Widget build(BuildContext context) {
    Future<void> _showDeleteConfirmDialog() async {
      final bool delete = await showDialog(
        context: context,
        builder: (context){
          return SimpleDialog(
            title: Text('提示'),
            children: [
              Text("内容1"),
              Text('内容2'),
              RaisedButton(
                child: Text('按钮内容1'),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }
      );
      if (delete == true) {
        print('确定删除');
      } else {
        print('取消删除');
      }
    }
    return RaisedButton(
      child: Text('Simple 对话框'),
      onPressed: () {
        _showDeleteConfirmDialog();
      },
    );
  }
}


//AlertDialog 对话框
class AlertDialogDemo extends StatefulWidget {
  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  Future<Null> _showAlertDialog() async {
    final bool alert = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('标题'),
          content: Text('内容'),
          actions: [
            RaisedButton(
              child: Text('取消'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            RaisedButton(
              child: Text('确定'),
              onPressed: (){
                Navigator.of(context).pop(true);
              },
            )
          ],
        );
      }
    );

    if (alert == true) {
      print('确定');
    } else {
      print('取消');
    }
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Alert 对话框'),
      onPressed: (){
        _showAlertDialog();
      },
    );
  }
}


class BottomSheetDemo extends StatefulWidget {
  @override
  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {

  Future<Null> _modalBottomSheet() async {
    final bool bottom = await showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Colors.lightGreen,
          height: 300,
          child: Center(
            child: Text('Modal BottomSheet, 自定义内容区域'),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    void _persistentBottomSheet() {
       showBottomSheet(
      context: context,
      builder: (context){
        return Container(
          height: 400,
          color: Colors.orange,
          child: Center(
            child: Text('Persistent 持久的 BottomSheet，可以自定义内容的区域'),
          ),
        );
      }
      );
    }


    return Column(
      children: [
        RaisedButton(
          child: Text('Modal类型 BottomSheet'),
          onPressed: (){
            _modalBottomSheet();
          },
        ),
        RaisedButton(
          child: Text('Persistent 持久的 BottomSheet'),
          onPressed: (){
            _persistentBottomSheet();
          },
        )
      ],
    );
  }
}


//ExpansionPanel: 非常实用的展开控件，如：打开关闭二级菜单
class ExpansionPanelItem {
  ExpansionPanelItem({this.expandeValue, this.headerValue, this.isExpanded = false});

  String expandeValue;
  String headerValue;
  bool isExpanded;
}

List<ExpansionPanelItem> expansionList(int counter){
  return List.generate(counter, (index) {
    return ExpansionPanelItem(
      headerValue: 'Panel $index',
      expandeValue: 'This is expanded Context $index',
    );
  });
}

//ExpansionPanel: 非常实用的展开控件，如：打开关闭二级菜单,用在列表中点击展开；
//扩展面板ExpansionPanel有3个属性，headerBuilder表示未展开时的视图，body表示展开后的视图，isExpanded表示当前是否处于展开状态。
//ExpansionPanel需要存在于ExpansionPanelList列表中，在ExpansionPanelList列表中可以设置expansionCallback点击回调事件，通过ExpansionPanelList.children它来设置列表中的内容
//ExpansionPanelList需要放在滚动视图SingleChildScrollView中，或者ListView中，因为它需要一个可以自动变动高度的父widget

class ExpansionPanelDemo extends StatefulWidget {
  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  List<ExpansionPanelItem> _data = expansionList(5);

  @override
  Widget build(BuildContext context) {

    Widget _buildPanel(){
      return ExpansionPanelList(
        children: _data.map((item) {
          return ExpansionPanel(
              headerBuilder: (BuildContext context, bool expaned){
                return ListTile(
                  title: Text(item.headerValue),

                );
              },
              body: ListTile(
                title: Text(item.expandeValue),
                subtitle: Text(item.expandeValue),
                trailing: Icon(Icons.delete,color: Colors.red,),
                onTap: (){
                  setState(() {
                    _data.removeWhere((element) => element == item);
                  });
                },
              ),
              isExpanded: item.isExpanded,
            canTapOnHeader: true,
          );
        }).toList(),
        expansionCallback: (int panelIndex, bool ied){
          setState(() {
            _data[panelIndex].isExpanded = !ied;
          });
        },
      );
    }

    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: _buildPanel(),
    );
  }
}

//SnackBar: 从底部弹出的小提示，如果"删除成功"等。弹出SnackBar时，需要先创建SnackBar对象，然后调用Scaffold.of(context).showSnackBar(snackBar);才能弹出
class SnackBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('从底部弹出的 小提示'),
      onPressed: (){
        final snackBar = SnackBar(
          content: Text('这是一个 小提示'),
          action: SnackBarAction(
            label: "确定！",
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
        );

        Scaffold.of(context).showSnackBar(snackBar);
      },
    );
  }
}

