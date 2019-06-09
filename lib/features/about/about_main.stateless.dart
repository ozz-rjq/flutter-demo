import 'package:flutter/material.dart';

class AboutMain extends StatelessWidget {
  const AboutMain({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(12.0),
          child: Text('Online Dating Service for Singles Dating Service',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500)),
        ),
        Container(
          padding: EdgeInsets.all(12.0),
          child: Text(
            'Meet new friends and find love in your area and worldwide with DatingWalk!',
            style: TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
