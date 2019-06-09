import 'package:flutter/material.dart';

import './../auth/auth.dart';

class RegistrationPage extends StatefulWidget {
  RegistrationPage({Key key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  // text fields for registration
  TextEditingController _userFirstName = TextEditingController(
    text: 'Hint',
  );
  TextEditingController _userLastName = TextEditingController();
  TextEditingController _userEmail = TextEditingController();
  TextEditingController _userCountry = TextEditingController();
  TextEditingController _userBirthday = TextEditingController();
  TextEditingController _userGender = TextEditingController();
  TextEditingController _userPassword = TextEditingController();

  void _navigateToAuthPage() {
    Navigator.pushReplacementNamed(context, '/auth');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(6.0),
                  child: AppBar(
                    automaticallyImplyLeading: false,
                    title: Text(
                      'Registration',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                    backgroundColor: Colors.white54,
                    iconTheme: IconThemeData(color: Colors.blue),
                  )),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                        decoration: InputDecoration(
                            labelText: 'First Name',
                            icon: Icon(Icons.person_outline)),
                        keyboardType: TextInputType.text),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                        decoration: InputDecoration(
                            labelText: 'Last Name',
                            icon: Icon(Icons.person_pin)),
                        keyboardType: TextInputType.text),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                        decoration: InputDecoration(
                            labelText: 'Email', icon: Icon(Icons.email)),
                        keyboardType: TextInputType.emailAddress),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                        decoration: InputDecoration(
                            labelText: 'Country', icon: Icon(Icons.place)),
                        keyboardType: TextInputType.text),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                        decoration: InputDecoration(
                            labelText: 'Birthday',
                            icon: Icon(Icons.settings_system_daydream)),
                        keyboardType: TextInputType.datetime),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Password', icon: Icon(Icons.web)),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                  )
                ],
              ),
            ],
          )),
      endDrawer: Drawer(
        child: RaisedButton(
          child: Text('Back To login'),
          onPressed: _navigateToAuthPage,
        ),
      ),
    );
  }
}
