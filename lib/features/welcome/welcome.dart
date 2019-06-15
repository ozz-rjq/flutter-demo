import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key key}) : super(key: key);

  navigateToAuthPage(context) {
    Navigator.pushReplacementNamed(context, '/auth');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome To',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700)),
            Container(
                padding: EdgeInsets.all(18.0),
                child: Image.asset('assets/images/datingwalk.png')),
            OutlineButton(
              child: Text(
                'Proceed'.toUpperCase(),
                style: TextStyle(
                  fontSize: 18.0,
                  color: Theme.of(context).indicatorColor,
                ),
              ),
              onPressed: () => navigateToAuthPage(context),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
