import 'package:hive/hive.dart';

import 'ImageMedia.dart';
export 'ImageMedia.dart';

class ImageMediaAdapter extends TypeAdapter<ImageMedia> {
  @override
  int get typeId => 1;

  @override
  ImageMedia read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageMedia(
      id: fields[0] as int,
      name: fields[1] as String,
      ext: fields[2] as String,
      pathOfImage: fields[3] as String,
      createdAt: fields[4] as DateTime,
     
    );
  }

  @override
  void write(BinaryWriter writer, ImageMedia obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.ext)
      ..writeByte(3)
      ..write(obj.pathOfImage)
      ..writeByte(4)
      ..write(obj.createdAt);
      
  }
}
