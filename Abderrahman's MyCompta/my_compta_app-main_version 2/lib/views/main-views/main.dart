import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home/main.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MyCompta',
      popGesture: true,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFF5386E4),
        accentColor: Color(0xFFF9DB6D),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Popping',
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
