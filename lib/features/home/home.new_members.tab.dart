import 'package:flutter/material.dart';

import './../../static_data/people.dart' as staticData;
import './home.new_member_card.stateless.dart';

class HomeNewMembersTab extends StatefulWidget {
  HomeNewMembersTab({Key key}) : super(key: key);

  _HomeNewMembersTabState createState() => _HomeNewMembersTabState();
}

class _HomeNewMembersTabState extends State<HomeNewMembersTab> {
  List<Map<String, dynamic>> _newbies;

  @override
  void initState() {
    _newbies =
        staticData.people.where((person) => person['newbie'] == true).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Wrap(
              alignment: WrapAlignment.spaceAround,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                for (var person in _newbies)
                  NewMemberCard(
                    person: person,
                  )
              ],
            )
          ],
        ));
  }
}
