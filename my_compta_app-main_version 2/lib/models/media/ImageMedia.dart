import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

String imageMediasBoxname = 'image_medias_box';

@HiveType(typeId: 1)
class ImageMedia {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String ext;
  @HiveField(3)
  String pathOfImage;
  @HiveField(4)
  DateTime createdAt;
  

  ImageMedia({
    @required this.id,
    @required this.name,
    @required this.ext,
    @required this.pathOfImage,
    @required this.createdAt,
   
  });
}
