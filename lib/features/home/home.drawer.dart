import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

import './../search/search.dart';
import './../user_profile/user_profile.dart';

class HomeDrawer extends StatelessWidget {
  final Map<String, dynamic> iam;

  const HomeDrawer({Key key, this.iam}) : super(key: key);

  void _navigateToAuthPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/auth');
  }

  void _navigateToMyProfilePage(BuildContext context) {
    Navigator.pop(context);

    Navigator.push<bool>(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return UserProfilePage(personDetails: iam);
    }));
  }

  void _navigateToNewsPage(BuildContext context) {
    Navigator.pop(context);

    Navigator.pushNamed(context, '/news');
  }

  void _navigateToInboxPage(BuildContext context) {
    Navigator.pop(context);

    Navigator.pushNamed(context, '/inbox');
  }

  void _navigateToSearchPage(BuildContext context) {
    Navigator.pop(context);

    Navigator.push<bool>(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return SearchPage(gender: '');
    }));
  }

  void _navigateToRandomPage(BuildContext context) {
    Navigator.pop(context);
    Navigator.pushNamed(context, '/random');
  }

  void _navigateToSettingsPage(BuildContext context) {
    Navigator.pop(context);

    Navigator.pushNamed(context, '/settings');
  }

  void _navigateToAboutPage(BuildContext context) {
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
                  _navigateToAuthPage(context);
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              'DatingWalk',
              style: TextStyle(
                  color: Theme.of(context).indicatorColor,
                  fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            centerTitle: true,
            titleSpacing: 2.0,
            backgroundColor: Theme.of(context).bottomAppBarColor,
          ),
          ListTile(
              leading: Icon(Icons.person),
              title: Text('My Profile'),
              onTap: () => _navigateToMyProfilePage(context)),
          ListTile(
              leading: Icon(Icons.new_releases),
              title: Text('News'),
              onTap: () => _navigateToNewsPage(context)),
          ListTile(
            leading: Icon(Icons.inbox),
            title: Container(
              child: Row(
                children: <Widget>[
                  Badge(
                    badgeContent:
                        Text('4', style: TextStyle(color: Colors.white)),
                    badgeColor: Colors.deepPurple,
                    child: Text('Inbox'),
                    position: BadgePosition(top: -15, right: -30),
                  ),
                ],
              ),
            ),
            onTap: () => _navigateToInboxPage(context),
          ),
          ListTile(
              leading: Icon(Icons.search),
              title: Text('Search'),
              onTap: () => _navigateToSearchPage(context)),
          ListTile(
            leading: Icon(Icons.gamepad),
            title: Container(
              child: Row(
                children: <Widget>[
                  Badge(
                    badgeContent: Text('new',
                        style: TextStyle(color: Colors.white, fontSize: 10.0)),
                    shape: BadgeShape.square,
                    borderRadius: 20,
                    badgeColor: Colors.deepOrange,
                    child: Text('Random Aquaintance'),
                    position: BadgePosition(top: -15, right: -30),
                  ),
                ],
              ),
            ),
            onTap: () {
              _navigateToRandomPage(context);
            },
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () => _navigateToSettingsPage(context)),
          ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () => _navigateToAboutPage(context)),
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
    );
  }
}
