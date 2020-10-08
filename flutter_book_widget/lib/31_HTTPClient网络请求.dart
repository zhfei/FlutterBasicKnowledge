import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: HttpClientTestRoute(),
      ),
    );
  }
}

class HttpClientTestRoute extends StatefulWidget {
  @override
  _HttpClientTestRouteState createState() => _HttpClientTestRouteState();
}

class _HttpClientTestRouteState extends State<HttpClientTestRoute> {
  bool _loading = false;
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100,),
              RaisedButton(
                child: Text("获取百度首页"),
                onPressed: _loading? null: () async {
                  setState(() {
                    _loading = true;
                    _text = "正在请求...";
                  });

                  try {
                    //1.创建一个HttpClient
                    HttpClient httpClient = HttpClient();

                    //2.打开http链接
                    HttpClientRequest request = await httpClient.getUrl(Uri.parse("https://www.baidu.com"));

//                //请求参数
//                Uri url = Uri(scheme: "https",host: "flutterchain.club",queryParameters: {
//                  "xx":"xx_res",
//                });
//                //添加请求体
//                request.add(utf8.encode("params"));

                    //3.设置请求头，使用iPhone的UA
                    request.headers.add("user-agent", "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1");
                    //4.等待连接服务器（将请求信息发送给服务器）
                    HttpClientResponse response = await request.close();
                    //读取响应内容
                    _text = await response.transform(utf8.decoder).join();
                    print(response.headers);

                    //5.关闭client, 通过client发起的所有请求都会中断
                    httpClient.close();
                  } catch (e) {
                    _text = "请求失败： $e";
                  } finally {
                    setState(() {
                      _loading = false;
                    });
                  }
                },

              ),
              Container(
                width: MediaQuery.of(context).size.width-50,
                child: Text(_text.replaceAll(RegExp(r"\s"), "")),
              )
            ],
          ),
        ),
      ),
    );
  }
}

