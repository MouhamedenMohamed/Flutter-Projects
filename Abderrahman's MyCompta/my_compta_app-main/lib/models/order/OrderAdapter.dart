import 'package:hive/hive.dart';

import '../transaction/Transaction.dart';
import '../product/Product.dart';

import 'Order.dart';
export 'Order.dart';

class OrderAdapter extends TypeAdapter<Order> {
  @override
  int get typeId => 4;

  @override
  Order read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Order(
      id: fields[0] as int,
      name: fields[1] as String,
      quantity: fields[2] as int,
      product: fields[3] as Product,
      createdAt: fields[4] as DateTime,
      transaction: fields[5] as Transaction,
    );
  }

  @override
  void write(BinaryWriter writer, Order obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.quantity)
      ..writeByte(3)
      ..write(obj.product)
      ..writeByte(4)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.transaction);
  }
}
