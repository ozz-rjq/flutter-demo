import 'package:dating_demo/features/people/people.dart';
import 'package:flutter/material.dart';

class HomeSeekForTab extends StatefulWidget {
  HomeSeekForTab({Key key}) : super(key: key);

  _HomeSeekForTabState createState() => _HomeSeekForTabState();
}

class _HomeSeekForTabState extends State<HomeSeekForTab> {
  String _radioValue = '';

  void _setRadioValue(String value) => setState(() => _radioValue = value);

  Widget _buildSubmit() {
    Widget result;

    if (_radioValue == 0) {
      result =
          FlatButton(padding: EdgeInsets.all(16.0), child: Text('CONTINUE'));
    } else {
      result = FlatButton(
        padding: EdgeInsets.all(16.0),
        child: Text('CONTINUE'),
        onPressed: () {
          _showModal();
        },
      );
    }

    return result;
  }

  void _showModal() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return new Container(
            padding: new EdgeInsets.all(15.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Now Go Ahead and find your Love!',
                    style: new TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ),
                new RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);

                    Navigator.push<bool>(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return PeoplePage(gender: _radioValue);
                    }));
                  },
                  child: new Text('OK!'),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
            child: Text('Who are you seeking for?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600)),
            padding: EdgeInsets.all(24.0)),
        RadioListTile(
          value: 'M',
          groupValue: _radioValue,
          onChanged: _setRadioValue,
          activeColor: Colors.green,
          controlAffinity: ListTileControlAffinity.trailing,
          title: new Text('Man'),
          subtitle: new Text('Make your choise'),
        ),
        RadioListTile(
          value: 'F',
          groupValue: _radioValue,
          onChanged: _setRadioValue,
          activeColor: Colors.green,
          controlAffinity: ListTileControlAffinity.trailing,
          title: new Text('Woman'),
          subtitle: new Text('Make your choise'),
        ),
        _buildSubmit()
      ],
    );
  }
}
