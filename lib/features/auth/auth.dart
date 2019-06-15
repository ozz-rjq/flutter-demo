import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key key, this.title}) : super(key: key);

  final String title;

  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String _email;
  String _pass;
  bool _isSubmitDisabled;

  @override
  void initState() {
    _email = '';
    _pass = '';
    _isSubmitDisabled = true;

    super.initState();
  }

  Widget _buildEmail() {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
              decoration:
                  InputDecoration(labelText: 'Email', icon: Icon(Icons.email)),
              onChanged: _onEmailChange,
              keyboardType: TextInputType.emailAddress),
        )
      ],
    );
  }

  Widget _buildPassword() {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            decoration: InputDecoration(
                labelText: 'Password', icon: Icon(Icons.security)),
            onChanged: _onPassChange,
            keyboardType: TextInputType.text,
            obscureText: true,
          ),
        )
      ],
    );
  }

  Widget _buildSubmitButton() {
    return new RaisedButton(
      child: new Text(_isSubmitDisabled ? "Enter your credentials" : "Sign In"),
      onPressed: _isSubmitDisabled ? null : _navigateToHomePage,
      color: Colors.green,
      textColor: Colors.white,
      disabledColor: Colors.grey,
    );
  }

  void _navigateToHomePage() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  void _navigateToRegistrationPage() {
    Navigator.pushReplacementNamed(context, '/registration');
  }

  void _onEmailChange(value) {
    setState(() {
      _email = value;
    });

    _modifySubmitState();
  }

  void _onPassChange(value) {
    setState(() {
      _pass = value;
    });

    _modifySubmitState();
  }

  void _modifySubmitState() {
    if (_email != '' && _pass != '') {
      _isSubmitDisabled = false;
    } else {
      _isSubmitDisabled = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Container(
            padding: EdgeInsets.only(top: 32.0),
            child: ListView(
              children: <Widget>[
                _buildEmail(),
                _buildPassword(),
                Container(
                  padding: EdgeInsets.all(32.0),
                  child: _buildSubmitButton(),
                )
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToRegistrationPage,
        tooltip: 'Registration',
        child: Icon(Icons.add, size: 50.0),
      ),
    );
  }
}
