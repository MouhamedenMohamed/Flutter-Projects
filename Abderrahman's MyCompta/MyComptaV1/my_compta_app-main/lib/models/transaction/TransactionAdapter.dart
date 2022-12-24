import 'package:hive/hive.dart';

import 'Transaction.dart';
export 'Transaction.dart';

class TransactionAdapter extends TypeAdapter<Transaction> {
  @override
  int get typeId => 3;

  @override
  Transaction read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Transaction(
      id: fields[0] as int,
      title: fields[1] as String,
      createdAt: fields[2] as DateTime,
      amount: fields[3] as double,
      expense: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Transaction obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.amount)
      ..writeByte(4)
      ..write(obj.expense);
  }
}
