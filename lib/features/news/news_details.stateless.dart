import 'package:flutter/material.dart';

class NewsDetails extends StatelessWidget {
  final Map<String, String> item;

  const NewsDetails({Key key, this.item}) : super(key: key);

  Widget _buildImage() {
    return Container(
      child: Image.asset(
        item['image_url'],
        scale: 1.0,
        height: 220,
      ),
      padding: EdgeInsets.all(16.0),
    );
  }

  Widget _buildTitle(context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8.0),
      child: Text(
        item['title'],
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 26.0,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).accentColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Navigator.pop(context, false);
          return Future.value(false);
        },
        child: Scaffold(
          appBar: AppBar(title: Text('News Details Page')),
          body: Container(
            child: ListView(
              children: <Widget>[
                _buildTitle(context),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: _buildImage(),
                ),
                Container(
                  padding: EdgeInsets.only(left: 32.0),
                  child: Text(
                    'Full description:',
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    item['description'],
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pop<bool>(context, true);
            },
            tooltip: 'Remove',
            child: Icon(Icons.remove),
          ),
        ));
  }
}
