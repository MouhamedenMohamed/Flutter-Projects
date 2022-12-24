import 'package:flutter/material.dart';
import 'package:my_compta_app/widgets/home/dashboard/DashboardCommandsList.dart';



class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          DashboardCommandList()
        ],
      ),
    );
  }
}
