import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FormTestRoute(),
          ],
        ),
      ),
    );
  }
}


class FormTestRoute extends StatefulWidget {
  @override
  _FormTestRouteState createState() => _FormTestRouteState();
}

class _FormTestRouteState extends State<FormTestRoute> {
  TextEditingController _pwdController = TextEditingController();
  TextEditingController _unameController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  autofocus: true,
                  controller: _unameController,
                  decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "邮箱或电话",
                    icon: Icon(Icons.people)
                  ),
                  validator: (value){
                    return value.trim()
                        .length > 0 ? null : '用户名不能为空';
                  },
                ),

                TextFormField(
                  controller: _pwdController,
                  decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "数字或者字母",
                    icon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                  validator: (value){
                    return value.trim().length >= 6 ? null : '密码不能少于6位';
                  },
                ),

                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                          child: RaisedButton(onPressed: (){
                            //1.此处不能使用Form.of(context) 来获取FormState,
                            //因为Form.of(context)是根据context对应的节点往根节点找，
                            //而Form节点是context对应节点的子节点。
                            //debugPrint(Form.of(context).toString());

                            //2.通过_formKey获取FormState
                            if((_formKey.currentState as FormState).validate()){
                              //验证通过，提交数据
                            }

                            },
                            child: Text("登录"),
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,

                          ),
                      ),

                      SizedBox(width: 50,),

                      Expanded(
                        //Builder会返回对应节点的context
                          child: Builder(builder: (context){
                            return RaisedButton(onPressed: (){

                              //此处拿到的Form.of(context) 对应的context可以沿着根节点的方向找到
                              //FormState
                                if (Form.of(context).validate()) {
                                  //验证通过
                                }
                              },
                              child: Text("提交"),
                              color: Theme.of(context).primaryColor,
                              textColor: Colors.white,
                            );

                          })),
                    ],
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}








