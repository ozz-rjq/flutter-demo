import 'package:dating_demo/features/auth/auth.dart';
import 'package:flutter/material.dart';

import './features/about/about.dart';
import './features/home/home.dart';
import './features/inbox/inbox.dart';
import './features/my_profile/my_profile.dart';
import './features/registration/registration.dart';
import './features/search/search.dart';
import './features/settings/settings.dart';

final routes = {
  '/auth': (BuildContext context) => AuthPage(title: 'Authorization'),
  '/registration': (BuildContext context) => RegistrationPage(),
  '/home': (BuildContext context) => HomePage(title: 'Dating Demo'),
  '/my-profile': (BuildContext context) => MyProfilePage(),
  '/inbox': (BuildContext context) => InboxPage(),
  '/search': (BuildContext context) => SearchPage(),
  '/settings': (BuildContext context) => SettingsPage(),
  '/about': (BuildContext context) => AboutPage(),
};
