

import 'package:flutter/material.dart';
import 'package:mycompta/Chat/theme_config.dart';
import 'package:mycompta/Chat/views/screens/auth/login.dart';

import 'const.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: themeData(ThemeConfig.lightTheme),
      // darkTheme: themeData(ThemeConfig.darkTheme),
      home: Login(),
    );
  }

  ThemeData themeData(ThemeData theme) {
    return theme.copyWith(
     
    );
  }
}
