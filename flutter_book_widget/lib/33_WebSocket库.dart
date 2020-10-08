import 'package:web_socket_channel/io.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: WebSocketRoute(),
      ),
    );
  }
}

//WebSocket使用步骤
//1.连接到WebSocket服务器
//2.监听来自服务器的消息
//3.将数据发送到服务器
//4.关闭WebSocket连接

//WebSocket是以帧的单位发送，接收数据。而帧的数据格式是固定的
//每一帧的数据类型可以通过Opcode字段判断

class WebSocketRoute extends StatefulWidget {
  @override
  _WebSocketRouteState createState() => _WebSocketRouteState();
}

class _WebSocketRouteState extends State<WebSocketRoute> {
  TextEditingController _controller = TextEditingController();
  IOWebSocketChannel channel;
  String _text = "";

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      //3.将数据发送到服务器
      channel.sink.add(_controller.text);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //1.连接到WebSocket服务器
    channel = IOWebSocketChannel.connect("ws://echo.websocket.org");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    //4.关闭WebSocket连接
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("WebSocket 内容回复"),),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
                child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: "发送一条消息"
                ),
              )
            ),
            StreamBuilder(
              stream: channel.stream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                //当snapshot为二进制时是List<int>; 文本时是String;

                //2.监听来自服务器的消息
                //网络不通会走到这里
                if (snapshot.hasError) {
                  _text = "网络不通..";
                } else if (snapshot.hasData) {
                  _text = "echo: " + snapshot.data;
                }

                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Text(_text),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "发送消息",
        child: Icon(Icons.send),
        onPressed: _sendMessage
      ),
    );
  }
}




