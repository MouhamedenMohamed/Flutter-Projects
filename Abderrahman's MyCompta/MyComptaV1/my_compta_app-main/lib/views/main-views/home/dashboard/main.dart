import 'package:flutter/material.dart';
import 'package:my_compta_app/constants/memory.dart';

import 'package:my_compta_app/widgets/home/creation/CreationItemButton.dart';
import 'package:my_compta_app/widgets/home/dashboard/DashboardHeader.dart';
import 'package:my_compta_app/widgets/home/dashboard/DashboardProductList.dart';
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
            
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20,left: 20),
                      child: Icon(Icons.work_off_rounded,size: 60,color: Colors.red,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:6 ),
                      child: Positioned(
                        left: 60,
                        right: 12,
                        child: CreationItemButton(
                          height: MediaQuery.of(context).size.height / 9,
                          width: MediaQuery.of(context).size.width / 1.55,
                          sizeText: MediaQuery.of(context).size.height / 47,
                          textColor:Colors.blue,
                          title: 'Commande: ${command}',
                          leadingIcon:
                              Icon(Icons.north_outlined, color: Colors.red, size: 50),
                        )),
                    ),
                  ],
                ),
              Row(
                children: [
                  
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: Positioned(
                        left: 6,
                        right: 50,
                      child: CreationItemButton(
                        height: MediaQuery.of(context).size.height / 9,
                        width: MediaQuery.of(context).size.width / 1.55,
                         sizeText: MediaQuery.of(context).size.height / 47,
                        textColor:Colors.green,
                        title: 'Cash :  ${cach}',
                        leadingIcon: Icon(
                          Icons.arrow_downward_outlined,
                          color: Theme.of(context).primaryColor,
                          size: 50,
                        ),
                      ),),
                  ),
                   Padding(
                      padding: const EdgeInsets.only(right: 20,left: 20),
                      child: Icon(Icons.monetization_on_outlined,size: 60,color: Colors.blue,),
                    ),
                ],
              ),
              Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20,left: 20),
                      child: Icon(Icons.cut_outlined,size: 60,color: Colors.red,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:6 ),
                      child: Positioned(
                        left: 60,
                        right: 12,
                        child: CreationItemButton(
                          height: MediaQuery.of(context).size.height / 9,
                          width: MediaQuery.of(context).size.width / 1.55,
                          sizeText: MediaQuery.of(context).size.height / 47,
                          textColor:Colors.red,
                          title: 'depenses: ${dep}',
                          leadingIcon:
                              Icon(Icons.north_outlined, color: Colors.red, size: 50),
                        )),
                    ),
                  ],
                ),
                 Row(
                children: [
                  
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: Positioned(
                        left: 6,
                        right: 50,
                      child: CreationItemButton(
                        height: MediaQuery.of(context).size.height / 9,
                        width: MediaQuery.of(context).size.width / 1.55,
                         sizeText: MediaQuery.of(context).size.height / 47,
                        textColor:Colors.green,
                        title: 'Profit :  ${profil}',
                        leadingIcon: Icon(
                          Icons.arrow_downward_outlined,
                          color: Theme.of(context).primaryColor,
                          size: 50,
                        ),
                      ),),
                  ),
                   Padding(
                      padding: const EdgeInsets.only(right: 20,left: 20),
                      child: Icon(Icons.monetization_on_outlined,size: 60,color: Colors.blue,),
                    ),
                ],
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
