import 'package:flutter/material.dart';

class Paragraph extends StatelessWidget {
  final String title;
  final String description;
  const Paragraph({Key key, this.title, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(12.0),
          child: Text(title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500)),
        ),
        Container(
          padding: EdgeInsets.all(12.0),
          child: Text(
            description,
            style: TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
