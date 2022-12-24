import 'package:flutter/material.dart';
import 'package:my_compta_app/constants/memory.dart';
import 'package:my_compta_app/widgets/produits/ProductListItem.dart';

class DashboardProductList extends StatefulWidget {
  DashboardProductList({Key key}) : super(key: key);

  @override
  _DashboardProductListState createState() =>
      _DashboardProductListState();
}

class _DashboardProductListState extends State<DashboardProductList> {
  @override
  void didChangeDependencies() {
    amoun();
    super.didChangeDependencies();
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    final ProductListTitleStyle = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 20.0,
    );
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Color(0x25000000),
            blurRadius: 4,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x15000000),
            blurRadius: 6,
            spreadRadius: 2,
            offset: Offset(0, 8),
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 12.0,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 12.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // HEADER
          Container(
            margin: EdgeInsets.only(
              top: 4.0,
              bottom: 12,
            ),
            child: Text(
              "Les dernieres Produits ajoutées :",
              style: ProductListTitleStyle,
              textAlign: TextAlign.left,
            ),
          ),

          // LIST
          ListView.builder(
            itemCount: products.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              
              return ProductListItem(
                product: products[index],
              );
            },
          ),
        ],
      ),
    );
  }
}
