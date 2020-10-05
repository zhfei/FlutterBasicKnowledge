import 'package:flutter/material.dart';
import 'package:random_words/random_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("ListView"),),
//        body: ListViewDemo(),
//        body: ListViewDemo2(),
//        body: ListViewDemo3(),
        body: InfiniteListView(),
      ),
    );
  }
}

//当子widget较少时，通过children的方式实现ListView
class ListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.all(20),
      children: [
        Text('I\'m dedicating every day to you'),
        Text('Domestic life was never quite my style'),
        Text('When you smile, you knock me out, I fall apart'),
        Text('And I thought I was so smart'),
        Text('I\'m dedicating every day to you'),
        Text('Domestic life was never quite my style'),
        Text('When you smile, you knock me out, I fall apart'),
        Text('And I thought I was so smart'),
        Text('I\'m dedicating every day to you'),
        Text('Domestic life was never quite my style'),
        Text('When you smile, you knock me out, I fall apart'),
        Text('And I thought I was so smart'),
    ],
    );
  }
}

//无限列表项、不确定列表项
//itemBuilder: item构建者
class ListViewDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Scrollbar(
        child: ListView.builder(
          itemCount: 100,
          itemExtent: 80,//item行高
          itemBuilder: (ctx, index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black12,
                border: Border.all(color: Colors.blue)
              ),
              child: ListTile(title: Text("$index"),),
            );
          },
    ),
      );
  }
}


//separatorBuilder: item分割器构建者
class ListViewDemo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget divider1 = Divider(color: Colors.blue,);
    Widget divider2 = Divider(color: Colors.pink,);

    return ListView.separated(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index){
          return ListTile(title: Text("$index"),);
        },
        separatorBuilder: (BuildContext context, int index) {
          return index%2 == 0 ? divider1 : divider2;
        }
        );
  }
}


//无限循环列表
//模拟网络加载数据
class InfiniteListView extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = "loading";
  var _words = <String>[loadingTag];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _retrieveData();

  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: _words.length,
        itemBuilder: (BuildContext context, int index) {
          //数据到最后一行时
          if (_words[index] == loadingTag) {
            //如果总个数小于100，就上拉加载20个
            if (_words.length < 100) {
              _retrieveData();
              return Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(strokeWidth: 2,),
                ),
              );
            } else {
              //到100个了就提示没了
              return Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                child: Text("没有更多了",style: TextStyle(color: Colors.blueGrey, fontSize: 30),),
              );
            }
          }
          
          return ListTile(title: Text(_words[index]),);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(color: Colors.black, height: 1,);
        },
    );
  }

  //模拟网络请求获取数据
  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      _words.insertAll(_words.length-1, generateWordPairs().take(20).map((e) {
        return e.asPascalCase;
      }).toList());

      setState(() {
        //重新构建列表
      });
    });
  }
}






