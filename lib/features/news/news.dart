import 'package:flutter/material.dart';

import './news_card.stateless.dart';
import './../../static_data/news.dart' as staticData;

class NewsPage extends StatefulWidget {
  final String title;
  NewsPage({Key key, this.title}) : super(key: key);

  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final List<Map<String, String>> _news = staticData.news;

  _removeNews(Map<String, String> item) {
    setState(() {
      int itemIndex = _news.indexOf(item);
      _news.removeAt(itemIndex);
    });
  }

  Widget _buildNews() {
    Widget result;

    if (_news.length > 0) {
      result = ListView(
        children: <Widget>[
          for (var item in _news) News(item: item, removeNews: _removeNews)
        ],
      );
    } else {
      result = Center(
          child: Container(
        padding: EdgeInsets.all(64),
        child: Text(
          'There is no news',
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
      ));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: _buildNews());
  }
}
