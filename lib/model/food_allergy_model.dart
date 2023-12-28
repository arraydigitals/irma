import 'package:json_annotation/json_annotation.dart';

part 'food_allergy_model.g.dart';

@JsonSerializable()
class FoodAllergyModel {
  FoodAllergyModel();

  String? sId;
  String? name;
  int? iV;

  factory FoodAllergyModel.fromJson(Map<String, dynamic> json) =>
      _$FoodAllergyModelFromJson(json);

  Map<String, dynamic> toJson() => _$FoodAllergyModelToJson(this);

  @override
  String toString() {
    return 'FoodAllergyModel{sId: $sId, name: $name,iV:$iV}';
  }
}

@JsonSerializable()
class FoodAllergyCompleteModel {
  int? success;
  List<FoodAllergyModel>? data;

  FoodAllergyCompleteModel({
    this.success,
    this.data,
  });

  factory FoodAllergyCompleteModel.fromJson(Map<String, dynamic> json) =>
      _$FoodAllergyCompleteModelFromJson(json);

  Map<String, dynamic> toJson() => _$FoodAllergyCompleteModelToJson(this);

  @override
  String toString() {
    return 'FoodAllergyCompleteModel{success: $success, data: $data}';
  }
}
