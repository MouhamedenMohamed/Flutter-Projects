import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_compta_app/models/product/Product.dart';

import 'package:my_compta_app/models/transaction/Transaction.dart';

class CommandListItem extends StatelessWidget {
  final Product product;
  const CommandListItem({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('dd-MM-yyyy').format(product.createdAt);

    final titleStyle = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: MediaQuery.of(context).size.width / 40,
      color: Color(0xAA000000),
    );
    final dateStyle = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Color(0x77000000),
    );
    final amountStyle = TextStyle(
      fontWeight: FontWeight.w800,
      fontSize:  MediaQuery.of(context).size.width / 40,
      
    );

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 12.0,
      ),
      margin: EdgeInsets.symmetric(
        vertical: 4.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight:Radius.circular(12),bottomLeft:Radius.circular(12)),
        color: Color(0xFFFEFEFE),
        boxShadow: [
          BoxShadow(
            color: Color(0x20000000),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title,
                style: titleStyle,
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                formattedDate,
                style: dateStyle,
              ),
            ],
          ),
          Column(
           
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                product.price.toStringAsFixed(0),
                style: amountStyle,
              ),
              Text(
                "Nombre des pieces : ${product.nbPieces}",
                style: amountStyle.copyWith(
                  color: Color(0x99000000),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
