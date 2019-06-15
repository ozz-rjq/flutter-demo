import 'package:flutter/material.dart';

import './../../static_data/countries.dart' as countriesData;

class RegistrationPage extends StatefulWidget {
  RegistrationPage({Key key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  // some text fields for registration
  String _userBirthday = '';
  DateTime _selectedBirthday;

  String _userCountry;
  List<String> _countriesList = countriesData.countries;
  List<DropdownMenuItem<String>> _countriesDropdown = [];

  bool _acceptTerms = false;

  @override
  void initState() {
    _countriesDropdown = getDropDownMenuItems();
    super.initState();
  }

  void _acceptTermsChanged(bool value) => setState(() => _acceptTerms = value);

  void _navigateToAuthPage() {
    Navigator.pushReplacementNamed(context, '/auth');
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = List();
    for (var country in _countriesList) {
      items.add(DropdownMenuItem(
          value: country,
          child: Row(
            children: <Widget>[Text(country)],
          )));
    }
    return items.toList();
  }

  void _setUserCountry(country) {
    setState(() {
      _userCountry = country;
    });
  }

  Future _selectDate() async {
    DateTime initial;

    if (_selectedBirthday != null) {
      initial = _selectedBirthday;
    } else {
      initial = DateTime(2000);
    }

    DateTime picked = await showDatePicker(
        context: context,
        initialDate: initial,
        firstDate: DateTime(1960),
        lastDate: DateTime(2002));

    _selectedBirthday = picked;

    if (picked != null)
      setState(() => _userBirthday = _formatDate(picked.toString()));
  }

  String _formatDate(String date) {
    String dateYear = date.substring(0, 4);
    String dateMonth = date.substring(5, 7);
    String dateDay = date.substring(8, 10);

    return '$dateDay/$dateMonth/$dateYear';
  }

  bool _isSubmitDisabled() {
    if (_acceptTerms) {
      return false;
    }

    return true;
  }

  void _navigateToHomePage() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  Widget _buildSubmitButton() {
    return Row(
      children: <Widget>[
        Expanded(
            child: RaisedButton(
                child: Text('SUBMIT',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onPressed: _isSubmitDisabled() ? null : _navigateToHomePage,
                color: Colors.green))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(6.0),
                  child: AppBar(
                    automaticallyImplyLeading: false,
                    title: Text(
                      'Registration',
                      style: TextStyle(color: Colors.black),
                    ),
                    backgroundColor: Colors.white70,
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
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(Icons.place, color: Colors.grey),
                  ),
                  Expanded(
                      child: DropdownButton(
                    hint: Text('Select your country'),
                    value: _userCountry,
                    items: _countriesDropdown,
                    onChanged: _setUserCountry,
                  )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: RaisedButton(
                      onPressed: _selectDate,
                      child: Text('Birthday'),
                    ),
                  ),
                  Text(
                    _userBirthday != ''
                        ? _userBirthday
                        : 'Nothing selected yet!',
                    style: TextStyle(fontStyle: FontStyle.italic),
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
              Row(
                children: <Widget>[
                  Expanded(
                    child: SwitchListTile(
                      value: _acceptTerms,
                      onChanged: _acceptTermsChanged,
                      title: Text(
                        'Accept Terms',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              _buildSubmitButton()
            ],
          )),
      endDrawer: Drawer(
        child: RaisedButton(
          child: Text('Back To login'.toUpperCase(),
              style: TextStyle(color: Colors.white)),
          onPressed: _navigateToAuthPage,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
