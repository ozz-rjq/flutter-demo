import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import './custom_search_delegate.dart';
import './../user_profile/user_profile.dart';

import './../../static_data/people.dart' as staticData;

class SearchPage extends StatefulWidget {
  final String gender;

  SearchPage({Key key, this.gender}) : super(key: key);

  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Map<String, dynamic>> _people = staticData.people;
  List<Map<String, dynamic>> _initialData = staticData.people;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _initialFilter() {
    if (widget.gender == 'F' || widget.gender == 'M') {
      _people = _initialData
          .where((person) => person['gender'] == widget.gender)
          .toList();
    }
  }

  @override
  void initState() {
    super.initState();
    _initialFilter();
  }

  Widget _buildLeading(item) {
    return CircleAvatar(
      backgroundImage: AssetImage(item['photo']),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(bottom: 8.0),
      color: Colors.blueGrey,
      child: Text(
          '${_people != null ? _people.length : 0} members are active now:',
          style: TextStyle(fontSize: 14.0, color: Colors.white)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Search'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(_people),
                );
              },
            )
          ],
        ),
        body: ListView(
          key: _scaffoldKey,
          children: <Widget>[
            _buildHeader(),
            for (var person in _people)
              ListTile(
                leading: _buildLeading(person),
                trailing: Text('${person['age']} y.o.'),
                title: Text('${person['fullname']}'),
                onTap: () {
                  Navigator.push<bool>(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return UserProfilePage(
                      personDetails: person,
                    );
                  }));
                },
                isThreeLine: true,
                subtitle: Text('${person['country']}'),
              ),
          ],
        ));
  }
}
