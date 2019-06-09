import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

import './../auth/auth.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isDarkMode = false;

  final List<int> myArr = [1, 2, 3, 4];

  void _changeBrightness(bool value) {
    setState(() {
      _isDarkMode = value;
    });

    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
  }

  void _navigateToAuthPage() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>
                AuthPage(title: 'Authorization')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Switch(value: _isDarkMode, onChanged: _changeBrightness)
        ],
      ),
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.only(top: 128.0),
          child: Column(
            children: <Widget>[
              Text('Navigation'),
              RaisedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Close it!'),
              ),
              RaisedButton(
                onPressed: _navigateToAuthPage,
                child: Text('Log out'),
                color: Colors.redAccent,
                textColor: Colors.white,
                textTheme: ButtonTextTheme.accent,
              )
            ],
          ),
        ),
      ),
      body: Container(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              for (var item in myArr)
                Container(
                    padding: EdgeInsets.all(6.0),
                    child: Text(
                      'Please, sign up $item',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22.0),
                    )),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
