import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_compta_app/constants/memory.dart';
import 'package:my_compta_app/views/main-views/home/Products/main.dart';
import 'package:my_compta_app/views/main-views/home/main.dart';

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
              child: IconButton(
                onPressed: (){
    //                Get.to(
    //   Products(),
     
    //   duration: Duration(seconds:2),
    // );
                },
                
                icon:Icon(Icons.notifications_outlined,
                color: statu > 1 ? Colors.red : Colors.green,
                size: MediaQuery.of(context).size.width / 8.0,)
            
              ),
              // child: Icon(
              //   Icons.notifications_outlined,
              //   color: statu > 1 ? Colors.red : Colors.green,
              //   size: MediaQuery.of(context).size.width / 8.0,
              // ),
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
