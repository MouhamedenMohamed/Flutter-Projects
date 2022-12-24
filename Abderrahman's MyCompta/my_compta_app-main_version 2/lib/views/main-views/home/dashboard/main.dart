import 'package:flutter/material.dart';
import 'package:my_compta_app/constants/memory.dart';

import 'package:my_compta_app/widgets/home/creation/CreationItemButton.dart';
import 'package:my_compta_app/widgets/home/dashboard/DashboardHeader.dart';
import 'package:my_compta_app/widgets/home/dashboard/DashboardTransactionsList.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 12,
          ),
          child: Column(
            children: [
              DashboardHeader(),
            
                Padding(
                  padding: const EdgeInsets.only(left:60 ),
                  child: Positioned(
                    left: 60,
                    right: 12,
                    child: CreationItemButton(
                      height: MediaQuery.of(context).size.height / 9,
                      width: MediaQuery.of(context).size.width / 1.35,
                      sizeText: 22,
                      title: 'Commande: $command',
                      leadingIcon:
                          Icon(Icons.north_outlined, color: Colors.red, size: 50),
                    )),
                ),
              Padding(
                padding: const EdgeInsets.only(right: 60),
                child: Positioned(
                    left: 6,
                    right: 50,
                  child: CreationItemButton(
                    height: MediaQuery.of(context).size.height / 9,
                    width: MediaQuery.of(context).size.width / 1.35,
                    sizeText: 28,
                    title: 'Cash :  $cach',
                    leadingIcon: Icon(
                      Icons.arrow_downward_outlined,
                      color: Theme.of(context).primaryColor,
                      size: 50,
                    ),
                  ),),
              ),
              
              // DashboardCharts(),

              DashboardTransactionsList(),
            ],
          ),
        ),
      ),
    );
  }
}
