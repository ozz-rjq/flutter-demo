import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

import './features/auth/auth.dart';

import './routes.dart' as routeConfig;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) => ThemeData(
              primarySwatch: Colors.indigo,
              brightness: brightness,
            ),
        themedWidgetBuilder: (context, theme) {
          return MaterialApp(
              title: 'Dating Demo',
              theme: theme,
              home: AuthPage(title: 'Authorization'),
              routes: routeConfig.routes);
        });
  }
}
