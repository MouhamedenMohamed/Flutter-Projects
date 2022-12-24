import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:my_compta_app/models/product/Product.dart';
import 'package:my_compta_app/models/transaction/Transaction.dart';

String ordersBoxname = 'orders_box';

@HiveType(typeId: 4)
class Order {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final Product product;
  @HiveField(3)
  final int quantity;
  @HiveField(4)
  final DateTime createdAt;
  @HiveField(5)
  final Transaction transaction;

  Order({
    @required this.id,
    @required this.name,
    @required this.quantity,
    @required this.product,
    @required this.createdAt,
    @required this.transaction,
  });
}
