import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

String transactionsBoxname = 'transactions_box';

@HiveType(typeId: 3)
class Transaction {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final DateTime createdAt;
  @HiveField(3)
  final double amount;
  @HiveField(4)
  final bool expense;

  Transaction({
    @required this.id,
    @required this.title,
    @required this.createdAt,
    @required this.amount,
    @required this.expense,
  });

  Transaction copyWith({
    int id,
    String title,
    DateTime createdAt,
    double amount,
    bool expense,
  }) {
    return Transaction(
      id: id ?? this.id,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      amount: amount ?? this.amount,
      expense: expense ?? this.expense,
    );
  }
}
