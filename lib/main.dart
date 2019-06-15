import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

import './routes.dart' as routeConfig;
import './features/welcome/welcome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) => ThemeData(
            primarySwatch: Colors.indigo,
            brightness: brightness,
            fontFamily: 'Roboto'),
        themedWidgetBuilder: (context, theme) {
          return MaterialApp(
              title: 'Dating Demo',
              theme: theme,
              home: WelcomePage(),
              routes: routeConfig.routes);
        });
  }
}
