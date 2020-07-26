import 'package:flutter/material.dart';
import 'pages/airplay_page.dart';
import 'pages/home_page.dart';
import 'pages/center_page.dart';
import 'pages/email_page.dart';


class BottomNavigationBarWidget extends StatefulWidget {
  @override
  _BottomNavigationBarWidgetState createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  final _BottomNavigationBarColor = Colors.blue;
  List<Widget> vlist = List();
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    vlist
    ..add(HomePage())
    ..add(EmailPage())
    ..add(AirplayPage())
    ..add(CenterPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: _BottomNavigationBarColor,),
          title: Text("Home", style: TextStyle(color: _BottomNavigationBarColor),)
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.email, color: _BottomNavigationBarColor,),
            title: Text("Email", style: TextStyle(color: _BottomNavigationBarColor),)
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.airplay, color: _BottomNavigationBarColor,),
            title: Text("Airplay", style: TextStyle(color: _BottomNavigationBarColor),)
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.business_center, color: _BottomNavigationBarColor,),
            title: Text("Center", style: TextStyle(color: _BottomNavigationBarColor),)
        ),
      ],
        currentIndex: _currentIndex,
      onTap: (int index){
        setState(() {
          _currentIndex = index;
        });
      },
      ),
      body: vlist[_currentIndex],
    );
  }
}

