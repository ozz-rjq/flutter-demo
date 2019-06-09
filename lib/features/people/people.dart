import 'package:flutter/material.dart';

import './../../static_data/people.dart' as staticData;

class PeoplePage extends StatefulWidget {
  final String gender;

  PeoplePage({Key key, this.gender}) : super(key: key);

  _PeoplePageState createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  List<Map<String, String>> _people = staticData.people;

  _filterPeople() {
    if (widget.gender == 'F' || widget.gender == 'M') {
      _people =
          _people.where((person) => person['gender'] == widget.gender).toList();
    }
  }

  @override
  void initState() {
    super.initState();
    _filterPeople();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('People')),
        body: Center(
          child: Text('gender ${widget.gender}'),
        ));
  }
}
