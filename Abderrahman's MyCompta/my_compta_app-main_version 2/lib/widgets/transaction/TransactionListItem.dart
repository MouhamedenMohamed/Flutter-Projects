import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:my_compta_app/models/transaction/Transaction.dart';

class TransactionListItem extends StatelessWidget {
  final Transaction transaction;
  const TransactionListItem({
    Key key,
    @required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('dd-MM-yyyy').format(transaction.createdAt);

    final titleStyle = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Color(0xAA000000),
    );
    final dateStyle = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Color(0x77000000),
    );
    final amountStyle = TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 14,
      color: transaction.expense ? Color(0xFFe07163) : Color(0xFF74d67e),
    );

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 12.0,
      ),
      margin: EdgeInsets.symmetric(
        vertical: 4.0,
      ),
      decoration: BoxDecoration(
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
                transaction.title,
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
                transaction.amount.toStringAsFixed(2),
                style: amountStyle,
              ),
              Text(
                "MRU",
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
