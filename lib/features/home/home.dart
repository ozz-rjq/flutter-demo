import 'package:dating_demo/features/about/about.dart';
import 'package:dating_demo/features/inbox/inbox.dart';
import 'package:dating_demo/features/my_profile/my_profile.dart';
import 'package:dating_demo/features/search/search.dart';
import 'package:dating_demo/features/settings/settings.dart';
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
    Navigator.pushReplacementNamed(context, '/auth');
  }

  void _navigateToMyProfilePage() {
    Navigator.pop(context);

    Navigator.pushNamed(context, '/my-profile');
  }

  void _navigateToInboxPage() {
    Navigator.pop(context);

    Navigator.pushNamed(context, '/inbox');
  }

  void _navigateToSearchPage() {
    Navigator.pop(context);

    Navigator.pushNamed(context, '/search');
  }

  void _navigateToSettingsPage() {
    Navigator.pop(context);

    Navigator.pushNamed(context, '/settings');
  }

  void _navigateToAboutPage() {
    Navigator.pop(context);

    Navigator.pushNamed(context, '/about');
  }

  _showLogoutWarning(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            actions: <Widget>[
              FlatButton(
                child: Text('DISCARD'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text('CONTINUE'),
                onPressed: () {
                  Navigator.pop(context);
                  _navigateToAuthPage();
                },
              )
            ],
          );
        });
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
                    onTap: _navigateToMyProfilePage),
                ListTile(
                    leading: Icon(Icons.inbox),
                    title: Text('Inbox'),
                    onTap: _navigateToInboxPage),
                ListTile(
                    leading: Icon(Icons.search),
                    title: Text('Search'),
                    onTap: _navigateToSearchPage),
                ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    onTap: _navigateToSettingsPage),
                ListTile(
                    leading: Icon(Icons.info),
                    title: Text('About'),
                    onTap: _navigateToAboutPage),
                new Container(
                    padding: EdgeInsets.only(top: 32.0),
                    child: RaisedButton(
                      onPressed: () {
                        _showLogoutWarning(context);
                      },
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
