import 'package:flutter/material.dart';
import 'package:my_compta_app/constants/memory.dart';
import 'package:my_compta_app/models/transaction/Transaction.dart';
import 'package:my_compta_app/repositories/product/orders_repository.dart';
import 'package:my_compta_app/widgets/transaction/TransactionListItem.dart';

class DashboardTransactionsList extends StatefulWidget {
  DashboardTransactionsList({Key key}) : super(key: key);

  @override
  _DashboardTransactionsListState createState() =>
      _DashboardTransactionsListState();
}

class _DashboardTransactionsListState extends State<DashboardTransactionsList> {
  @override
  void didChangeDependencies() {
    amoun();
    super.didChangeDependencies();
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    final transactionsListTitleStyle = TextStyle(
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
              "Les dernieres transactions:",
              style: transactionsListTitleStyle,
              textAlign: TextAlign.left,
            ),
          ),

          // LIST
          ListView.builder(
            itemCount: transactions.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              
              return TransactionListItem(
                transaction: transactions[index],
              );
            },
          ),
        ],
      ),
    );
  }
}
