import 'package:dating_demo/features/home/news-details.stateless.dart';
import 'package:flutter/material.dart';

class News extends StatelessWidget {
  final Map<String, String> item;
  final Function removeNews;

  const News({Key key, this.item, this.removeNews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(6.0),
        child: Card(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                      child: Image.network(item['image_url']),
                      padding: EdgeInsets.only(right: 12.0)),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text(
                            '${item['title']}',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20.0),
                          ),
                          padding: EdgeInsets.all(4.0),
                        ),
                        Text(
                            '${item['description'].length > 100 ? item['description'].substring(0, 99) + '...' : item['description']}'),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                child: FlatButton(
                  child: Text('Details'),
                  onPressed: () {
                    Navigator.push<bool>(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return NewsDetails(item: item);
                    })).then((bool value) {
                      print(value);
                      if (value == true) {
                        removeNews(item);
                      }
                    });
                  },
                ),
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
