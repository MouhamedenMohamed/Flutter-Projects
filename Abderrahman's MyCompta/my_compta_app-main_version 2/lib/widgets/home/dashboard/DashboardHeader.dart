import 'package:flutter/material.dart';

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
            "Hello",
            style: headerTextStyle,
          ),
          Icon(
            Icons.notifications_outlined,
            size: 26.0,
          ),
        ],
      ),
    );
  }
}
