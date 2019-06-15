import 'package:dating_demo/features/home/home.drawer.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

import './home.new_members.tab.dart';
import './home.seek.tab.dart';

import './../../static_data/iam.dart' as me;

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isDarkMode = false;

  final Map<String, dynamic> _iam = me.iam;

  void _changeBrightness(bool value) {
    setState(() {
      _isDarkMode = value;
    });

    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
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
                tabs: <Widget>[Tab(text: 'New members'), Tab(text: 'Seek ...')],
              )),
          drawer: HomeDrawer(
            iam: _iam,
          ),
          body: TabBarView(
            children: <Widget>[HomeNewMembersTab(), HomeSeekTab()],
          ),
        ));
  }
}
