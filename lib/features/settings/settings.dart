import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _checkbox1 = false;
  bool _checkbox2 = true;

  bool _switch1 = true;
  bool _switch2 = false;

  void _onClick(String value) {
    if (value == 'Cancel') {
      Navigator.pop(context);
      return;
    }
    ;

    if (value == 'Save') {
      Navigator.pop(context);

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Your preferences were saved!',
                textAlign: TextAlign.center,
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          });
    }
  }

  void _checkbox1Changed(bool value) => setState(() => _checkbox1 = value);
  void _checkbox2Changed(bool value) => setState(() => _checkbox2 = value);

  void _switch1Changed(bool value) => setState(() => _switch1 = value);
  void _switch2Changed(bool value) => setState(() => _switch2 = value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Basic'.toUpperCase(),
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 12.0),
                  ))),
          CheckboxListTile(
            value: _checkbox1,
            onChanged: _checkbox1Changed,
            title: Text('Set Dark Theme as Primary'),
            controlAffinity: ListTileControlAffinity.leading,
            secondary: Icon(Icons.add_to_home_screen),
            activeColor: Colors.red,
          ),
          CheckboxListTile(
            value: _checkbox2,
            onChanged: _checkbox2Changed,
            title: Text('Show new members after authorization'),
            controlAffinity: ListTileControlAffinity.leading,
            secondary: Icon(Icons.accessibility_new),
            activeColor: Colors.red,
          ),
          SwitchListTile(
            value: _switch1,
            onChanged: _switch1Changed,
            title: new Text(
              'Display Search Bar',
              style: new TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Advanced'.toUpperCase(),
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 12.0),
                  ))),
          ListTile(
            title: Text('Search Engine',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
            onTap: () {},
            isThreeLine: true,
            subtitle: Text('Google'),
          ),
          ListTile(
            title: Text('Interface language',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
            onTap: () {},
            isThreeLine: true,
            subtitle: Text('English (US)'),
          ),
          SwitchListTile(
            value: _switch2,
            onChanged: _switch2Changed,
            title: new Text(
              'Make passwords visible',
              style: new TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            title: Text('Privacy'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Encryption'),
            onTap: () {},
          ),
        ],
      ),
      persistentFooterButtons: <Widget>[
        IconButton(
            icon: Icon(
              Icons.cancel,
              color: Colors.redAccent,
            ),
            onPressed: () => _onClick('Cancel')),
        IconButton(
            icon: Icon(
              Icons.save,
              color: Colors.green,
            ),
            onPressed: () => _onClick('Save')),
      ],
    );
  }
}
