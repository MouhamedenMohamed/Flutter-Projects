import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:drawer_swipe/drawer_swipe.dart';
import 'package:my_compta_app/widgets/home/creation/CreationItemButton.dart';


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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var drawerKey = GlobalKey<SwipeDrawerState>();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // add this line so you can add your appBar in Body
      extendBodyBehindAppBar: true,
      body: SwipeDrawer(
        radius: 20,
        key: drawerKey,

        hasClone: false,
        bodyBackgroundPeekSize: 30,
        backgroundColor: Colors.blue,
        // pass drawer widget
        drawer: buildDrawer(),
        // pass body widget
        child: buildBody(),
      ),
    );
  }

  Widget buildDrawer() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CreationItemButton(title: 'Home Page', leadingIcon: Icon(Icons.home,),nextPage: HomePage(),),
          CreationItemButton(title: 'Home Page', leadingIcon: Icon(Icons.home,),nextPage: HomePage(),),
          CreationItemButton(title: 'Home Page', leadingIcon: Icon(Icons.home,),nextPage: HomePage(),),
          ListTile(
            title: Text('Title'),
          ),
          ListTile(
            title: Text('Title'),
          ),
        ],
      ),
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        // build your appBar
        AppBar(
          title: Text('AppBar title'),
          leading: InkWell(
              onTap: () {
                if (drawerKey.currentState.isOpened()) {
                  drawerKey.currentState.closeDrawer();
                } else {
                  drawerKey.currentState.openDrawer();
                }
              },
              child: Icon(Icons.menu)),
        ),
       // build your screen body
        Expanded(
          child: Container(
            color: Colors.white,
            child: Center(
              child: Text('Home Screen'),
            ),
          ),
        ),
      ],
    );
  }
}