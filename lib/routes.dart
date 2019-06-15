import 'package:flutter/material.dart';

import './features/welcome/welcome.dart';
import './features/auth/auth.dart';
import './features/registration/registration.dart';
import './features/home/home.dart';
import './features/news/news.dart';
import './features/inbox/inbox.dart';
import './features/inbox/inbox.new_message.stateful.dart';
import './features/random/random.dart';
import './features/settings/settings.dart';
import './features/about/about.dart';

final routes = {
  '/welcome': (BuildContext context) => WelcomePage(),
  '/auth': (BuildContext context) => AuthPage(title: 'Authorization'),
  '/registration': (BuildContext context) => RegistrationPage(),
  '/home': (BuildContext context) => HomePage(title: 'Dating Demo'),
  '/news': (BuildContext context) => NewsPage(title: 'News'),
  '/inbox': (BuildContext context) => InboxPage(),
  '/new-message': (BuildContext context) => InboxNewMessage(),
  '/random': (BuildContext context) => RandomPage(),
  '/settings': (BuildContext context) => SettingsPage(),
  '/about': (BuildContext context) => AboutPage(),
};
