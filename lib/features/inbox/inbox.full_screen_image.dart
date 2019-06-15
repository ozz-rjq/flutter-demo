import 'package:flutter/material.dart';
import 'dart:io';

class InboxFullScreenImage extends StatelessWidget {
  final File image;

  const InboxFullScreenImage({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Image.file(
        image,
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
