import 'package:flutter/material.dart';


class StockPage extends StatefulWidget {
  @override
  _StockPageState createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:Column(
          children: [
            ClipRRect(
  borderRadius: BorderRadius.all(Radius.circular(10)),
  
  ),

          ],
        )
      ),
    );
  }
}