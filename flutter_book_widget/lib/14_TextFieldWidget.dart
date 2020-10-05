

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 60,),
                TextFieldDemo(),
                LoginDemo(),
                LoginGetTextDemo(),
                FocusScopeDemo(),
                CustomThemeTextField(),
                CustomContainerTextFieldDemo(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.cyan),
      keyboardType: TextInputType.emailAddress,
      textAlign: TextAlign.center,
      decoration: InputDecoration(icon: Icon(Icons.phone)),
      textInputAction: TextInputAction.search,
      maxLength: 10,
      maxLengthEnforced: false,
      cursorColor: Colors.deepPurple,
    );
  }
}

class LoginDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: '用户名',
              hintText: "用户名或邮箱",
              prefixIcon: Icon(Icons.people),
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              labelText: "密码",
              hintText: "请输入密码",
            ),
              obscureText: true,
          ),
        ],
      ),
    );
  }
}




class LoginGetTextDemo extends StatefulWidget {
  @override
  _LoginGetTextDemoState createState() => _LoginGetTextDemoState();
}

class _LoginGetTextDemoState extends State<LoginGetTextDemo> {
  TextEditingController _unameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //设置默认值+选中偏移
    _unameController.text = 'hello world';
    _unameController.selection = TextSelection(baseOffset: 2, extentOffset: _unameController.text.length);
    //监听内容变化
    _unameController.addListener(() {
      debugPrint("监听_unameController：${_unameController.text}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _unameController,
      onChanged: (value){
        debugPrint('onChanged: $value');
      },
      autofocus: true,
      decoration: InputDecoration(
        labelText: '用户名',
        hintText: "用户名或邮箱",
        prefixIcon: Icon(Icons.people),
      ),
    );
  }
}

//焦点控制
class FocusScopeDemo extends StatefulWidget {
  @override
  _FocusScopeDemoState createState() => _FocusScopeDemoState();
}

class _FocusScopeDemoState extends State<FocusScopeDemo> {
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //监听焦点状态改变
    focusNode2.addListener(() {
      debugPrint("focusNode2焦点状态改变: ${focusNode2.hasFocus}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          autofocus: true,
          focusNode: focusNode1, //关联focusNode1
          decoration: InputDecoration(
            labelText: "Input1",
          ),
        ),
        TextField(
          focusNode: focusNode2,//关联focusNode2
          decoration: InputDecoration(
            labelText: "Input2",
          ),
        ),
        Builder(builder: (context){
          return Column(
            children: [
              RaisedButton(
                onPressed: (){
                  //将焦点从第一个tf移动到第二个tf
                  //1
//                  FocusScope.of(context).requestFocus(focusNode2);
                  //2.通常用这种方法
                  if (null == focusScopeNode) {
                    focusScopeNode = FocusScope.of(context);
                  }
                  focusScopeNode.requestFocus(focusNode2);
                },
                child: Text("移动焦点"),
              ),
              RaisedButton(
                onPressed: (){
                  //当所有的编辑框失去焦点时，键盘就会收起
                  focusNode1.unfocus();
                  focusNode2.unfocus();
                },
                child: Text("隐藏键盘"),
              )
            ],
          );
        })
      ],
    );
  }
}


class CustomThemeTextField extends StatefulWidget {
  @override
  _CustomThemeTextFieldState createState() => _CustomThemeTextFieldState();
}

class _CustomThemeTextFieldState extends State<CustomThemeTextField> {
  TextEditingController _pwdController;

  @override
  Widget build(BuildContext context) {
    return Theme(data: Theme.of(context).copyWith(
      hintColor: Colors.orange,//定义下划线颜色
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.red),//定义label字体样式
        hintStyle: TextStyle(color: Colors.deepPurple, fontSize: 14),//s设置提示文本样式
      )
    ), child: Column(
      children: [
        TextField(
          controller: _pwdController,
          decoration: InputDecoration(
            labelText: "密码：Theme+Field自定义",
            hintText: "您的输入密码",
            prefixIcon: Icon(Icons.lock),
          ),
          obscureText: true,
        ),
        TextField(
          decoration: InputDecoration(
            labelText: "密码",
            hintText: "输入关键字搜索", 
            prefixIcon: Icon(Icons.search),
            hintStyle: TextStyle(
              color: Colors.green,
              fontSize: 22
            ),
            labelStyle: TextStyle(
              color: Colors.indigoAccent
            )
          ),
        )

      ],
    )
    );
  }
}



class CustomContainerTextFieldDemo extends StatefulWidget {
  @override
  _CustomContainerTextFieldDemoState createState() => _CustomContainerTextFieldDemoState();
}

class _CustomContainerTextFieldDemoState extends State<CustomContainerTextFieldDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: "用户名:Container+Field自定义",
          hintText: "邮箱或用户名",
          prefixIcon: Icon(Icons.people),
          border: InputBorder.none,
        ),
      ),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1,color: Colors.pink))
      ),
    );
  }
}

