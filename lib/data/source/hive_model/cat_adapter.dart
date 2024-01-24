import 'package:hive/hive.dart';
import 'package:random_cats/data/source/hive_model/hive_model.dart';
import 'package:random_cats/data/source/hive_model/hive_model.dart';
import 'package:random_cats/data/source/hive_model/hive_model.dart';
import 'package:random_cats/data/source/hive_model/hive_model.dart';

class HiveAdapter extends TypeAdapter<HiveModel> {
  @override
  HiveModel read(BinaryReader reader) {
    return HiveModel.fromJson(reader.readMap().cast());
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, HiveModel obj) {
    writer.writeMap(obj.toJson());
  }
}
