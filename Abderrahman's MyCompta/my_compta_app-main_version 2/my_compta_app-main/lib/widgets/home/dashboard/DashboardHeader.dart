import 'package:flutter/material.dart';
import 'package:my_compta_app/constants/memory.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headerTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    );

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 18.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Hello, ",
            style: headerTextStyle,
          ),
          Stack(
            children: [
            Positioned(
              
              child: Icon(
                Icons.notifications_outlined,
                color: statu > 1 ? Colors.red : Colors.green,
                size: MediaQuery.of(context).size.width / 8.0,
              ),
            ),
            Positioned(
              right:0 ,
              top: 0,
              child: Text("${statu}",style: TextStyle(fontSize: 17),),
            )
          ])
        ],
      ),
    );
  }
}
