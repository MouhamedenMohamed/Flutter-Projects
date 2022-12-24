import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_compta_app/views/main-views/home/creation/CreateProduct.dart';
import 'package:my_compta_app/widgets/home/creation/CreationItemButton.dart';
import 'package:my_compta_app/widgets/home/creation/CreationPageHeader.dart';
import 'package:my_compta_app/widgets/home/dashboard/DashboardProductList.dart';

import 'CreateOrder.dart';
import 'NouveauCommand.dart';
import 'TransactionSortant.dart';

class CreationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
              child: Container(
                child: Column(
          children: [
            CreationPageHeader(),
            CreationItemButton(
                title: 'Ajouter un produit',
                leadingIcon: Icon(
                  Icons.work,
                  color: Theme.of(context).primaryColor,
                ),
                nextPage: CreateProduct(),
            ),
            // CreationItemButton(
            //     title: 'Ajouter une commande',
                // leadingIcon: Icon(
                //   Icons.transfer_within_a_station,
                //   color: Theme.of(context).primaryColor,
                // ),
             GestureDetector(
      onTap:() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Voulez-vous Commander un produit existant ou Nouveau :"),
          actions: [
            FlatButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateOrder())),
              child: Text("Existant "),
            ),
            FlatButton(
              onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateNewOrder())),
              textColor: Colors.red,
              child: Text("Nouveau"),
            ),
          ],
        );
      },
    );
    return false;
  },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
        margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Color(0x20000000),
              blurRadius: 2,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Color(0x20000000),
              blurRadius: 6,
              spreadRadius: 2,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
               Icon(
                  Icons.transfer_within_a_station,
                  color: Theme.of(context).primaryColor,
                ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              'Ajouter une commande',
              // style: creationItemButtonLabelStyle,
            ),
          ],
        ),
      ),
    ),
            // ),
            CreationItemButton(
                title: 'Vendre quelque chose',
                leadingIcon: Icon(
                  Icons.work,
                  color: Theme.of(context).primaryColor,
                ),
                nextPage: Sortant(),
            ),
            DashboardProductList()
            // CreationItemButton(
            //   title: 'Ajouter une dépense',
            //   leadingIcon: Icon(
            //     Icons.money,
            //     color: Theme.of(context).primaryColor,
            //   ),
            //   nextPage: this,
            // ),
          ],
        ),
              ),
      ),
    );
  }
}

class TransactionSortant {
}
