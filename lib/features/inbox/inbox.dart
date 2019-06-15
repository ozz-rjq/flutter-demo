import 'package:flutter/material.dart';

import './inbox.details.stateful.dart';

import './../../static_data/messages.dart' as messages;

class InboxPage extends StatelessWidget {
  const InboxPage({Key key}) : super(key: key);

  Widget _buildLeading(imageUrl) {
    return CircleAvatar(
      backgroundImage: AssetImage(imageUrl),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> _messages = messages.messages;

    return Scaffold(
      appBar: AppBar(title: Text('Inbox')),
      body: ListView(
        children: <Widget>[
          for (var m in _messages)
            ListTile(
              leading: _buildLeading(m['author']['photo']),
              title: Text(m['author']['fullname'],
                  style: TextStyle(
                      color: Theme.of(context).indicatorColor,
                      fontWeight: FontWeight.w500)),
              onTap: () {
                Navigator.push<bool>(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return InboxDetailsPage(
                    title: 'Chat with ${m['author']['fullname']}',
                    messages: m['inbox'],
                  );
                }));
              },
              isThreeLine: true,
              subtitle: Text(m['inbox'].last['text']),
              trailing: Text(m['inbox'].last['time']),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/new-message');
        },
        tooltip: 'New message',
        child: Icon(Icons.add, size: 25.0),
      ),
    );
  }
}
