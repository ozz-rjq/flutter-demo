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

  Widget _buildLeading(item) {
    return CircleAvatar(
      backgroundImage: AssetImage(item['photo']),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('People')),
        endDrawer: Drawer(
          child: Column(
            children: <Widget>[Text('Filter')],
          ),
        ),
        body: ListView(
          children: <Widget>[
            for (var item in _people)
              ListTile(
                leading: _buildLeading(item),
                trailing: Text('${item['age']} y.o.'),
                title: Text('${item['fullname']}'),
                onTap: () {},
                isThreeLine: true,
                subtitle: Text('${item['country']}'),
              ),
          ],
        ));
  }
}
