import 'package:json_annotation/json_annotation.dart';

part 'country_model.g.dart';

@JsonSerializable()
class CountryModel {
  CountryModel();

  String? sId;
  String? countryImage;
  String? name;
  String? createdAt;
  String? updatedAt;
  int? iV;

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountryModelToJson(this);

  @override
  String toString() {
    return 'CountryModel{sId: $sId, countryImage: $countryImage, createdAt: $createdAt, updatedAt: $updatedAt,iV:$iV}';
  }
}

@JsonSerializable()
class CountryCompleteModel {
  int? success;
  List<CountryModel>? data;

  CountryCompleteModel({
    this.success,
    this.data,
  });

  factory CountryCompleteModel.fromJson(Map<String, dynamic> json) =>
      _$CountryCompleteModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountryCompleteModelToJson(this);

  @override
  String toString() {
    return 'CountryCompleteModel{success: $success, data: $data}';
  }
}
