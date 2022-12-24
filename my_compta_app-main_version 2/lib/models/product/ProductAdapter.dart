import 'package:hive/hive.dart';

import '../media/ImageMedia.dart';

import 'Product.dart';
export 'Product.dart';

class ProductAdapter extends TypeAdapter<Product> {
  @override
  int get typeId => 2;

  @override
  Product read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product(
      id: fields[0] as int,
      title: fields[1] as String,
      image: fields[2] as ImageMedia,
      createdAt: fields[3] as DateTime,
      price: fields[4] as double, nbPieces: fields[4] as int ,
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.price)
       ..writeByte(5)
      ..write(obj.nbPieces);
  }
}
