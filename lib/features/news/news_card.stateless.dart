import 'package:flutter/material.dart';

import './news_details.stateless.dart';

class News extends StatelessWidget {
  final Map<String, String> item;
  final Function removeNews;

  const News({Key key, this.item, this.removeNews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildImage() {
      return Container(
        padding: EdgeInsets.all(6.0),
        child: CircleAvatar(
          backgroundImage: AssetImage(item['image_url']),
          maxRadius: 45.0,
        ),
      );
    }

    Widget _buildNewsInfo() {
      return Expanded(
        child: Column(
          children: <Widget>[
            Container(
              child: Text(
                '${item['title']}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0),
              ),
              padding: EdgeInsets.all(8.0),
            ),
            Text(
                '${item['description'].length > 100 ? item['description'].substring(0, 99) + '...' : item['description']}'),
          ],
        ),
      );
    }

    Widget _buildDetailsButton() {
      return FlatButton(
        child: Text('Details'),
        onPressed: () {
          Navigator.push<bool>(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return NewsDetails(item: item);
          })).then((bool value) {
            if (value == true) {
              removeNews(item);
            }
          });
        },
      );
    }

    return Container(
        padding: EdgeInsets.all(6.0),
        child: Card(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[_buildImage(), _buildNewsInfo()],
              ),
              Container(
                child: _buildDetailsButton(),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8.0)),
              ),
            ],
          ),
        ));
  }
}
