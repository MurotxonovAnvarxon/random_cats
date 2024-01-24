import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class HiveModel extends HiveObject {

  @HiveField(0)
  String? id;
  @HiveField(1)
  String? text;
  @HiveField(2)
  String? date;

  HiveModel({this.id, this.text, this.date});

  String toCustomString() => '$id,$text,$date';

  static HiveModel fromCustomString(String str) {
    var parts = str.split(',');
    return HiveModel(
        id: parts[0],
        text: parts[1],
        date: parts[2]);
  }

  factory HiveModel.fromJson(Map<String, dynamic> json) {
    return HiveModel(
      id: json['_id'],
      text: json['text'],
      date: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['text'] = text;
    data['createdAt'] = date;
    return data;
  }

}
