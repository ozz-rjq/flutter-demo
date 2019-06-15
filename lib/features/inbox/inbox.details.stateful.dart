import 'package:dating_demo/features/inbox/inbox.full_screen_image.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class InboxDetailsPage extends StatefulWidget {
  final String title;
  final List<Map<String, dynamic>> messages;

  InboxDetailsPage({Key key, this.title, this.messages}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<InboxDetailsPage> {
  String _myMsgValue = '';
  TextEditingController _myMsgController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  FocusNode _messageFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _messageFocusNode.addListener(_focusListener);
  }

  _focusListener() {
    _scrollToBottom('text');
  }

  Future _getImage() async {
    File image;

    image = await ImagePicker.pickImage(source: ImageSource.camera);

    final String time = DateTime.now().toString().substring(11, 16);

    if (image != null) {
      setState(() {
        widget.messages.add({
          'text': '',
          'time': time,
          'in': false,
          'isImage': true,
          'imageFile': image
        });

        if (_myMsgValue != '') {
          widget.messages.add({
            'text': _myMsgValue,
            'time': time,
            'in': false,
            'isImage': false
          });
        }

        _myMsgValue = '';
        _myMsgController.value = TextEditingValue.empty;
        _scrollToBottom('image');
      });
    }
  }

  Widget _buildIn(Map<String, dynamic> message) {
    return Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.all(6.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            )),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    message['text'],
                    style: TextStyle(color: Colors.black, fontSize: 15.0),
                  ),
                ),
                Text(message['time'],
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 10.0,
                        color: Theme.of(context).primaryColor))
              ],
            ),
          ],
        ));
  }

  Widget _buildOut(Map<String, dynamic> message) {
    return Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.all(6.0),
        decoration: BoxDecoration(
            color: Color.fromRGBO(211, 255, 194, 1),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            )),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Text(message['time'],
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 10.0,
                          color: Theme.of(context).primaryColor)),
                ),
                Expanded(
                  child: !message['isImage']
                      ? Text(
                          message['text'],
                          style: TextStyle(color: Colors.black, fontSize: 15.0),
                          textAlign: TextAlign.right,
                        )
                      : _buildOutImage(message['imageFile']),
                ),
              ],
            ),
          ],
        ));
  }

  Widget _buildOutImage(File imageFile) {
    return GestureDetector(
      child: Image.file(imageFile, height: 300.0, width: 300.0),
      onTap: () {
        Navigator.push<bool>(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return InboxFullScreenImage(
            image: imageFile,
          );
        }));
      },
    );
  }

  Widget _buildMessage(message) {
    if (message['in'] == true) {
      return _buildIn(message);
    }

    return _buildOut(message);
  }

  _changeMessage(value) {
    setState(() {
      _myMsgValue = value;
    });
  }

  void _addNewMessage() {
    final String time = DateTime.now().toString().substring(11, 16);

    setState(() {
      widget.messages.add(
          {'text': _myMsgValue, 'time': time, 'in': false, 'isImage': false});
      _myMsgValue = '';
      _myMsgController.value = TextEditingValue.empty;
      _scrollToBottom('text');
    });
  }

  void _scrollToBottom(String type) {
    int offset;

    if (type == 'text') {
      offset = 100;
    } else {
      offset = 500;
    }

    _scrollController.animateTo(
        _scrollController.position.maxScrollExtent + offset,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Material(
              color: Color.fromRGBO(202, 228, 212, 1),
              child: ListView(
                controller: _scrollController,
                children: <Widget>[
                  for (var m in widget.messages) _buildMessage(m),
                ],
              ),
            ),
          ),
          Container(
              color: Colors.white,
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.camera_alt,
                      color: Colors.blue,
                    ),
                    onPressed: _getImage,
                  ),
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Theme.of(context).primaryColor),
                      decoration: InputDecoration(
                        hintText: 'Chat message',
                      ),
                      onChanged: _changeMessage,
                      controller: _myMsgController,
                      focusNode: _messageFocusNode,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.send,
                      color: Colors.blue,
                    ),
                    onPressed: _addNewMessage,
                  )
                ],
              )),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    _messageFocusNode.dispose();

    super.dispose();
  }
}
