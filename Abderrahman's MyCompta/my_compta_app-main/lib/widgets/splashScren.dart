import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_compta_app/views/main-views/home/dashboard/main.dart';
import 'package:my_compta_app/views/main-views/home/main.dart';



class MyAppSplash extends StatelessWidget {
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
      home: SplashScreen(),
    );
  }
}


class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  AnimationController animationController;
  Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Get.to(
      HomePageProduct,
     
      duration: Duration(seconds:2),
    );;
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));
    animation =
    new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      backgroundColor:Color.fromRGBO(22, 53, 68,0.2),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

              Padding(padding: EdgeInsets.only(bottom: 30.0),
              child:new Image.asset('assets/images/logo.png',
              height: 250.0,fit: BoxFit.scaleDown,)
              )


            ],),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             
            ],
          ),
        ],
      ),
    );
  }
}