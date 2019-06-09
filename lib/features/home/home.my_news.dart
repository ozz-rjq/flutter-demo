import 'package:flutter/material.dart';

class HomeMyNewsTab extends StatefulWidget {
  List<int> data;
  HomeMyNewsTab({Key key, this.data}) : super(key: key);

  _HomeMyNewsTabState createState() => _HomeMyNewsTabState();
}

class _HomeMyNewsTabState extends State<HomeMyNewsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            for (var item in widget.data)
              Container(
                  padding: EdgeInsets.all(6.0),
                  child: Text(
                    'Please, sign up $item',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22.0),
                  )),
          ],
        ));
  }
}
