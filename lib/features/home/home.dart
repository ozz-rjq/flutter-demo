import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

import './home.my_news.tab.dart';
import './home.seek_for.tab.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isDarkMode = false;

  final List<Map<String, String>> _news = [
    {
      'title': 'Some news title here',
      'description': 'News description goes here ...',
      'image_url': 'https://picsum.photos/100'
    },
    {
      'title': 'Here goes very long title for application',
      'description':
          'Very long description. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'image_url': 'https://picsum.photos/100'
    },
    {
      'title': 'Title 3',
      'description': 'Lorem ipsum',
      'image_url': 'https://picsum.photos/100'
    },
    {
      'title': 'Last title',
      'description': 'Last news',
      'image_url': 'https://picsum.photos/100'
    }
  ];

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

  _removeNews(Map<String, String> item) {
    setState(() {
      int itemIndex = _news.indexOf(item);
      _news.removeAt(itemIndex);
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
            children: <Widget>[
              HomeMyNewsTab(data: _news, removeNews: _removeNews),
              HomeSeekForTab()
            ],
          ),
        ));
  }
}
