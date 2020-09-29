
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "基础widget-textfield",
      home: Scaffold(
        appBar: AppBar(title: Text("AppBar 的标题"),),
        body: MyBody(),
      ),
    );
  }
}

class MyBody extends StatefulWidget {
  @override
  _MyBodyState createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  final _controller = TextEditingController();
  String username = 'jack';
  String password = '123456';

  void initState() {
    super.initState();
    _controller.addListener(() {
      final text = _controller.text.toLowerCase();
      _controller.value = _controller.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            icon: Icon(Icons.person),
            labelText: "用户名",
            hintText: "电话号码/邮箱账号"
          ),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.search,
          onSubmitted: (text){
            this.username = text;
            debugPrint("提交  $text");
          },
          onEditingComplete: (){
            debugPrint("编辑完成...");
          },
        ),
        TextField(
          decoration: InputDecoration(
            icon: Icon(Icons.lock),
            labelText: "密码"
          ),
          keyboardType: TextInputType.url,
          textInputAction: TextInputAction.search,
          onSubmitted: (text){
            this.password = text;
            debugPrint("提交  $text");
          },
          onEditingComplete: (){
            debugPrint("编辑完成...");
          },
          obscureText: true,
        ),
      ],
    );
  }
}











