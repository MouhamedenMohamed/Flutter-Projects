import 'dart:async';
import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_compta_app/views/main-views/home/menu/main.dart';

import 'creation/main.dart';
import 'dashboard/main.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StreamController<int> _pageIndexStreamController;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageIndexStreamController = StreamController<int>();
    _pageIndexStreamController.add(0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Color(0xFFf3f4f8),
        body: SafeArea(
          child: SizedBox.expand(
            child: PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                DashboardPage(),
                CreationPage(),
                MenuPage(),
              
              ],
            ),
          ),
        ),
        bottomNavigationBar: StreamBuilder<int>(
            stream: _pageIndexStreamController.stream,
            builder: (context, snapshot) {
              return CurvedNavigationBar(
                backgroundColor: Colors.transparent,
                items: <Widget>[
                  Icon(
                    Icons.home,
                    size: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                  Icon(
                    Icons.add,
                    size: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                  Icon(
                    Icons.menu,
                    size: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
                onTap: (index) {
                  _pageController.jumpToPage(index);
                  _pageIndexStreamController.add(index);
                },
              );
            }),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Voulez-vous vraiment quitter l\'application?"),
          actions: [
            FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Non"),
            ),
            FlatButton(
              onPressed: () => exit(0),
              textColor: Colors.red,
              child: Text("Oui"),
            ),
          ],
        );
      },
    );
    return false;
  }
}
