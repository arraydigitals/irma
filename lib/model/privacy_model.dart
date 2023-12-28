import 'package:json_annotation/json_annotation.dart';

part 'privacy_model.g.dart';

@JsonSerializable()
class PrivacyModel {
  PrivacyModel();

   String? sId;
  String? privacy;
  String? createdAt;
  String? updatedAt;
  int? iV;

  factory PrivacyModel.fromJson(Map<String, dynamic> json) =>
      _$PrivacyModelFromJson(json);

  Map<String, dynamic> toJson() => _$PrivacyModelToJson(this);

  @override
  String toString() {
    return 'PrivacyModel{sId: $sId, privacy: $privacy,createdAt:$createdAt, updatedAt:$updatedAt,iV:$iV}';
  }
}

@JsonSerializable()
class PrivacyCompleteModel {
  int? success;
  List<PrivacyModel>? data;

  PrivacyCompleteModel({
    this.success,
    this.data,
  });

  factory PrivacyCompleteModel.fromJson(Map<String, dynamic> json) =>
      _$PrivacyCompleteModelFromJson(json);

  Map<String, dynamic> toJson() => _$PrivacyCompleteModelToJson(this);

  @override
  String toString() {
    return 'PrivacyCompleteModel{success: $success, data: $data}';
  }
}
