import 'dart:async';
import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_compta_app/constants/memory.dart';
import 'package:my_compta_app/views/main-views/home/menu/main.dart';

import 'Products/main.dart';
import 'creation/main.dart';
import 'dashboard/main.dart';

class HomePageProduct extends StatefulWidget {
  HomePageProduct({Key key}) : super(key: key);

  @override
  _HomePageProductState createState() => _HomePageProductState();
}

class _HomePageProductState extends State<HomePageProduct> {
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
                Products(),
              
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


Icon(Icons.notifications_outlined,
                color: statu > 1 ? Colors.red : Colors.green,
                size: MediaQuery.of(context).size.width / 8.0,)
,

                
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
