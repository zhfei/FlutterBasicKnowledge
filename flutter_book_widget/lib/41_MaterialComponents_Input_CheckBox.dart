import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';


void main(){
//  debugPaintSizeEnabled = true;
  runApp(InputCheckBoxApp());
}

//Material风格 输入框和选择框
/*
  TextField：文本输入框。
  注意：1.通过传入TextField.controller属性，再添加textEditingController.addListener可以监听TextField的文本变化；另外可以通过TextField.onChanged进行文本变化监听。TextField.onSubmitted在点击键盘确定时调用
  注意：2.通过TextField.decoration属性 可以设置TextField的各种装饰器样式和辅助功能。给TextField.decoration的属性设置值InputDecoration
  InputDecoration 输入框装饰标识符
  InputDecoration文字图标的装饰： labelText:移动到上方的标识符， hintText:光标聚焦时出现的提示语，errorText：错误标识, counterText: 个数提示符,prefixIcon\prefixText: 前缀
  InputDecoration内容内边距的装饰：InputDecoration.contentPadding
  InputDecoration边框样式设置：将默认的下划线边框设置成苹果的 圆角边框，设置InputDecoration.border的值为OutlineInputBorder。
  注意：3.修改TextField的默认主题，在TextField的外部套一个Theme，可以实现TextField的整体风格变化。将Theme.child设置成TextField。

  Checkbox：复选框。
  注意：通过Checkbox.value设置选中状态，通过Checkbox.onChanged:设置点击事件。通过弹窗提示Fluttertoast.showToast(msg: '选中了：女',gravity: ToastGravity.CENTER);
  CheckboxListTile：文本列表输入框。
  注意：CheckboxListTile.value设置选中状态，通过CheckboxListTile.onChanged:设置点击事件。通过弹窗提示Fluttertoast.showToast(msg: '选中了：女',gravity: ToastGravity.CENTER);

  Radio：单选框
  注意：通过Radio.value属性设置单选框代表的值，通过Radio.groupValue属性设置单选框选中的值，如果value和groupValue相等代表当前Radio被选中。
  注意：通过RadioListTile.value属性设置单选框代表的值，通过RadioListTile.groupValue属性设置单选框选中的值，如果value和groupValue相等代表当前RadioListTile被选中。RadioListTile.subtitle和RadioListTile.title为单元提示语
 */


class InputCheckBoxApp extends StatefulWidget {
  @override
  _InputCheckBoxAppState createState() => _InputCheckBoxAppState();
}

class _InputCheckBoxAppState extends State<InputCheckBoxApp> {
  TextEditingController textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController = TextEditingController();
    textEditingController.addListener(() {
      print('input ${textEditingController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Input Check 输入框和选择框'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Theme(
                data: ThemeData(primaryColor: Colors.orange,hintColor: Colors.brown),
                child: TextField(
                  controller: textEditingController,
                  //InputDecoration 输入框装饰标识符
                  //labelText:移动到上方的标识符， hintText:光标聚焦时出现的提示语，errorText：错误标识
                  //counterText: 个数提示符,prefixIcon\prefixText: 前缀

                  decoration: InputDecoration(
                      fillColor: Colors.red,
                      labelText: 'Hello',
                      hintText: '提示符号',
                      errorText: '错误标识',
                      counterText: '个数提示符',
                      helperText: '帮助标识',
                      prefixText: '前缀标识',
                      prefixIcon: Icon(Icons.directions_bike),
                      suffixIcon: Icon(Icons.headset_mic),

                      contentPadding: EdgeInsets.all(20),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )

                  ),
                  onChanged: (text){
                    print('onChanged: $text');
                  },
                  onSubmitted: (text){
                    print('onSubmitted: $text');
                  },
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (state){},
                  ),
                  CheckboxDemo(),
                ],
              ),
              RadioDemo()
            ],
          ),
        ),
      ),
    );
  }
}

//Checkbox
class CheckboxDemo extends StatefulWidget {
  @override
  _CheckboxDemoState createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<CheckboxDemo> {
  bool _isCheck;
  bool _isMale;
  bool _isFemale;
  bool _checkListChecked;
  bool _checkList2Checked;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _isCheck = true;
    _isMale = false;
    _isFemale = true;
    _checkListChecked = false;
    _checkList2Checked = true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        Text("-: CheckBox"),
        Checkbox(
          value: _isCheck,
          activeColor: Colors.blueGrey,
          checkColor: Colors.red,
          onChanged: (checkState){
            if (checkState) {
              Fluttertoast.showToast(msg: '选中了: $checkState',gravity: ToastGravity.CENTER);
            }
            setState(() {
              _isCheck = checkState;
            });
          },
        ),
        Text('实现Checkbox的单项',style: TextStyle(fontWeight: FontWeight.bold),),
        Row(
          children: [
            Text('男'),
            Checkbox(
              value: _isMale,
              activeColor: Colors.green,
              checkColor: Colors.red,
              onChanged: (checkState){
                if (checkState) {
                  Fluttertoast.showToast(msg: '选中了：男',gravity: ToastGravity.CENTER);
                }
                setState(() {
                  _isMale = checkState;
                  _isFemale = !checkState;
                });
              },
            )
          ],
        ),
        Row(
          children: [
            Text('女'),
            Checkbox(
              value: _isFemale,
              activeColor: Colors.green,
              checkColor: Colors.red,
              onChanged: (checkState){
                if (checkState) {
                  Fluttertoast.showToast(msg: '选中了：女',gravity: ToastGravity.CENTER);
                }
                setState(() {
                  _isFemale = checkState;
                  _isMale = !checkState;
                });
              },
            )
          ],
        ),
        Text('二，CheckBoxListTile',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
        SizedBox(
          width: 200,
          child: Column(
            children: [
              CheckboxListTile(
                selected: false,
                value: _checkListChecked,
                activeColor: Colors.green,
                checkColor: Colors.red,
                onChanged: (checkState){
                  Fluttertoast.showToast(msg: '选中:$_checkListChecked');
                  setState(() {
                    _checkListChecked = checkState;
                  });
                },
                title: Text('标题'),
                subtitle: Text('副标题'),
              )
            ],
          ),
        )

      ],
    );
  }
}

//Radio
class RadioDemo extends StatefulWidget {
  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  String groupValue;
  String valueLiu;
  String valueZhang;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    groupValue = "刘德华";
    valueLiu = "刘德华";
    valueZhang = "张学友";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Radio(
          value: valueLiu,
          groupValue: groupValue,
          onChanged: (selectedString){
            setState(() {
              groupValue = selectedString;
            });
          },
        ),
        Radio(
          value: valueZhang,
          groupValue: groupValue,
          onChanged: (selectedString){
            setState(() {
              groupValue = selectedString;
            });
          },
        ),
        Text('RadioListTile',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        RadioListTile(
          title: Text(valueLiu),
          subtitle: Text("子标题"),
          value: valueLiu,
          groupValue: groupValue,
          onChanged: (selectString){
            setState(() {
              groupValue = selectString;
            });
          },
        ),
        RadioListTile(
          title: Text(valueZhang),
          subtitle: Text("子标题"),
          value: valueZhang,
          groupValue: groupValue,
          onChanged: (selectString){
            Fluttertoast.showToast(msg: '弹框：${selectString}');
            setState(() {
              groupValue = selectString;
            });
          },
        ),

      ],
    );
  }
}
