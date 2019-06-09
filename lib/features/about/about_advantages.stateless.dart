import 'package:flutter/material.dart';

class AboutAdvantages extends StatelessWidget {
  const AboutAdvantages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            child: Center(
                child: Text('Popular Community for Singles:',
                    style: TextStyle(fontSize: 24.0))),
            padding: EdgeInsets.only(bottom: 16.0)),
        Center(
            child: ListTile(
                title: Text('Chat and Flirt', style: TextStyle(fontSize: 18.0)),
                leading: Icon(Icons.chat))),
        Center(
            child: ListTile(
                title:
                    Text('Make new Friends', style: TextStyle(fontSize: 18.0)),
                leading: Icon(Icons.people))),
        Center(
            child: ListTile(
                title: Text('Find new Love', style: TextStyle(fontSize: 18.0)),
                leading: Icon(Icons.nature_people))),
        Center(
            child: ListTile(
                title: Text('Safe Dating Environment',
                    style: TextStyle(fontSize: 18.0)),
                leading: Icon(Icons.data_usage))),
      ],
    );
  }
}
