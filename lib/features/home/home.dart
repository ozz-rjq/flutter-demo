import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

import './../auth/auth.dart';

import './home.my_news.dart';
import './home.seek_for.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isDarkMode = false;

  final List<int> data = [1, 2, 3, 4];

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
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              title: Text(widget.title),
              actions: <Widget>[
                Switch(value: _isDarkMode, onChanged: _changeBrightness)
              ],
              bottom: TabBar(
                tabs: <Widget>[Tab(text: 'My News'), Tab(text: 'Seek for ...')],
              )),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                AppBar(
                    automaticallyImplyLeading: false,
                    title: Text('Dating Demo')),
                ListTile(
                    leading: Icon(Icons.person),
                    title: Text('My Profile'),
                    onTap: () {}),
                ListTile(
                    leading: Icon(Icons.inbox),
                    title: Text('Inbox'),
                    onTap: () {}),
                ListTile(
                    leading: Icon(Icons.search),
                    title: Text('Search'),
                    onTap: () {}),
                ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    onTap: () {}),
                ListTile(
                    leading: Icon(Icons.info),
                    title: Text('About'),
                    onTap: () {}),
                new Container(
                    padding: EdgeInsets.only(top: 32.0),
                    child: RaisedButton(
                      onPressed: _navigateToAuthPage,
                      child: Text('Log out'),
                      color: Colors.redAccent,
                      textColor: Colors.white,
                      textTheme: ButtonTextTheme.accent,
                    ))
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[HomeMyNewsTab(data: data), HomeSeekForTab()],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ));
  }
}
