import 'dart:typed_data';

import 'package:hive/hive.dart';

part 'hive_adapter.g.dart';

@HiveType(typeId: 0)
class Movies {
  @HiveField(0)
  String name;
  @HiveField(1)
  String directorName;
  @HiveField(2)
  String description;
  @HiveField(3)
  Uint8List image;

  Movies(
    this.name,
    this.directorName,
    this.description,
    this.image,
  );
}
