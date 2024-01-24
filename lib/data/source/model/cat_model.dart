import 'package:freezed_annotation/freezed_annotation.dart';

part 'cat_model.g.dart';

part 'cat_model.freezed.dart';

@freezed
class MyModel with _$MyModel {
  @JsonSerializable(explicitToJson: true)
  const factory MyModel(
      MyStatus? status,
      String? sId,
      String? user,
      String? text,
      int? iV,
      String? source,
      String? updatedAt,
      String? type,
      String? createdAt,
      bool? deleted,
      bool? used) = _MyModel;

  factory MyModel.fromJson(Map<String, dynamic> json) =>
      _$MyModelFromJson(json);
}

@freezed
class MyStatus with _$MyStatus {
  @JsonSerializable(explicitToJson: true)
  const factory MyStatus(bool? verified, int? sentCount) = _MyStatus;

  factory MyStatus.fromJson(Map<String, dynamic> json) =>
      _$MyStatusFromJson(json);
}
