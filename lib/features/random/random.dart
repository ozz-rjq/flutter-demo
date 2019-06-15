import 'package:dating_demo/features/inbox/inbox.details.stateful.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RandomPage extends StatefulWidget {
  RandomPage({Key key}) : super(key: key);

  _RandomPageState createState() => _RandomPageState();
}

class _RandomPageState extends State<RandomPage> {
  User user = User("Connection ...",
      "https://www.bsn.eu/wp-content/uploads/2016/12/user-icon-image-placeholder-300-grey.jpg");

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _refreshIndicatorKey.currentState.show());
  }

  String _formatUserName(String username) {
    List<String> userData = username.split(' ');

    String correctName =
        userData[0][0].toUpperCase() + userData[0].substring(1);
    String correctSurname =
        userData[1][0].toUpperCase() + userData[1].substring(1);

    String correctFullname = '$correctName $correctSurname';

    return correctFullname;
  }

  Widget _buildChattingButton(context) {
    return OutlineButton(
      child: Text('Start chatting with this user'),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return InboxDetailsPage(
              title: 'Chat with ${_formatUserName(user.name)}', messages: []);
        }));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Swipe Down to Refresh",
            style: TextStyle(fontSize: 16.0),
          ),
          actions: <Widget>[
            new IconButton(
                icon: const Icon(Icons.refresh),
                tooltip: 'Refresh',
                onPressed: () {
                  _refreshIndicatorKey.currentState.show();
                }),
          ],
        ),
        body: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: _refresh,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(user.image),
                        radius: 72.0,
                      ),
                      SizedBox(height: 24.0),
                      Text(_formatUserName(user.name)),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildChattingButton(context)
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Future<Null> _refresh() {
    return getUser().then((_user) {
      setState(() => user = _user);
    });
  }
}

class User {
  final String name, image;

  User(this.name, this.image);

  factory User.fromJson(Map<String, dynamic> json) {
    json = json['results'][0];
    String name = json['name']['first'] + " " + json['name']['last'];
    String image = json['picture']['large'];
    return User(name, image);
  }
}

Future<User> getUser() async {
  final response = await http.get("https://randomuser.me/api/");
  final responseJson = json.decode(response.body);
  return User.fromJson(responseJson);
}
