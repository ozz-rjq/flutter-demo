import 'package:flutter/material.dart';

import './../../static_data//people.dart' as staticData;

class InboxNewMessage extends StatefulWidget {
  InboxNewMessage({Key key}) : super(key: key);

  _InboxNewMessageState createState() => _InboxNewMessageState();
}

class _InboxNewMessageState extends State<InboxNewMessage> {
  List<Map<String, dynamic>> _friends = staticData.people;

  List<DropdownMenuItem<String>> _friendsDropdown;
  String _target;

  @override
  void initState() {
    _friendsDropdown = getFriendsDropdown();
    super.initState();
  }

  // here we are creating the list needed for the DropDownButton
  List<DropdownMenuItem<String>> getFriendsDropdown() {
    List<DropdownMenuItem<String>> items = List();
    for (var friend in _friends) {
      // here we are creating the drop down menu items, you can customize the item right here
      // but I'll just use a simple text for this
      items.add(DropdownMenuItem(
          value: friend['fullname'],
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(6.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage(friend['photo']),
                  maxRadius: 12.0,
                ),
              ),
              Text(friend['fullname'])
            ],
          )));
    }
    return items;
  }

  Widget _buildSendButton(context) {
    return IconButton(
        icon: Icon(Icons.send),
        disabledColor: Colors.black,
        color: Colors.blue,
        onPressed: _target == null
            ? null
            : () {
                Navigator.pop(context);
              });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('New Message')),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('To:', style: TextStyle(fontSize: 16.0)),
                      ),
                      Expanded(
                          child: DropdownButton(
                        hint: Text('Select addressee'),
                        value: _target,
                        items: _friendsDropdown,
                        onChanged: changedTarget,
                      )),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child:
                        Text('Message text:', style: TextStyle(fontSize: 16.0)),
                  ),
                  Container(
                      child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: 'Enter your message',
                              contentPadding: EdgeInsets.all(12.0)),
                          maxLines: 8,
                        ),
                      )
                    ],
                  ))
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    border: Border(
                        top:
                            BorderSide(color: Theme.of(context).dividerColor))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.cancel,
                          color: Colors.red,
                        ),
                        onPressed: () => Navigator.pop(context)),
                    _buildSendButton(context)
                  ],
                )),
          ],
        ));
  }

  void changedTarget(String selectedCity) {
    setState(() {
      _target = selectedCity;
    });
  }
}
