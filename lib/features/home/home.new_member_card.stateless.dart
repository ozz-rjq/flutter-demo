import 'package:flutter/material.dart';

import './../user_profile/user_profile.dart';

class NewMemberCard extends StatelessWidget {
  final Map<String, dynamic> person;
  const NewMemberCard({Key key, this.person}) : super(key: key);

  String _getFirstName(fullname) {
    return fullname.split(' ')[0];
  }

  _goToPersonDetails(context) {
    Navigator.push<bool>(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return UserProfilePage(personDetails: person,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: 
          Card(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: CircleAvatar(
                    maxRadius: 60.0,
                    backgroundImage: AssetImage(person['photo'])
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(_getFirstName(person['fullname']), style: TextStyle(fontSize: 14.0))
                )
              ],
            )
          ),
        onTap: () => _goToPersonDetails(context),
      ),
    );
  }
}