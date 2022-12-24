import 'package:flutter/material.dart';
import 'package:my_compta_app/widgets/home/dashboard/DashboardCommandsList.dart';
import 'package:my_compta_app/widgets/home/dashboard/DashboardProductList.dart';
import 'package:my_compta_app/widgets/produits/ProductListItem.dart';



class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          DashboardProductList(),
          // DashboardProductList()
        ],
      ),
    );
  }
}
