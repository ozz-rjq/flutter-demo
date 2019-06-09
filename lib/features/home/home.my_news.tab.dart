import 'package:flutter/material.dart';

import 'news-card.stateless.dart';

class HomeMyNewsTab extends StatefulWidget {
  List<Map<String, String>> data;
  final Function removeNews;
  HomeMyNewsTab({Key key, this.data, this.removeNews}) : super(key: key);

  _HomeMyNewsTabState createState() => _HomeMyNewsTabState();
}

class _HomeMyNewsTabState extends State<HomeMyNewsTab> {
  Widget _buildNews() {
    Widget result;

    if (widget.data.length > 0) {
      result = ListView(
        children: <Widget>[
          for (var item in widget.data)
            News(item: item, removeNews: widget.removeNews)
        ],
      );
    } else {
      result = Center(
          child: Container(
        padding: EdgeInsets.all(64),
        child: Text(
          'There is no news',
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
        ),
      ));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(16.0), child: _buildNews());
  }
}
