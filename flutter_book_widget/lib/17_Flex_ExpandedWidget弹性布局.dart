import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("线性布局"),),
        body: FlexLayoutTestRoute(),
//        body: ColumnInColumnDemo2(),
      ),
    );
  }
}


//Row Column 都是 Flex的子类
//Expanded 按照比例扩展Flex及其子类所占用的空间

class FlexLayoutTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              //flex：空闲空间占用比例
              flex: 1,
              child: Container(
                color: Colors.green,
                height: 30,
              )
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.pink,
                height: 30,
              )
            )

          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: SizedBox(
            height: 100,
            child: Flex(
              //Flex的三个子widget按照2:1:1占据空间
              direction: Axis.vertical,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 30,
                    color: Colors.green,
                )),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                  height: 30,
                  color: Colors.indigoAccent,
                ))
              ],

            ),
          ),
        )
      ],
    );
  }
}

