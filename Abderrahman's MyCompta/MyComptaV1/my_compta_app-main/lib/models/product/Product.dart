import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../media/ImageMedia.dart';

String productsBoxname = 'products_box';

@HiveType(typeId: 2)
class Product {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  ImageMedia image;
  @HiveField(3)
  DateTime createdAt;
  @HiveField(4)
  double price;
  @HiveField(4)
  int nbPieces;
  @HiveField(4)
  int vente;

  Product({
    @required this.id,
    @required this.title,
    @required this.image,
    @required this.createdAt,
    @required this.price,
    @required this.nbPieces,
    this.vente,
  });

Product copyWith({
    int id,
    String title,
    DateTime createdAt,
    double amount,
    bool expense,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      image: image ?? this.image,
      price: price ?? this.price,
      nbPieces: nbPieces ?? this.nbPieces,
       vente: vente ?? this.vente,
    );
  }


}
