// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_allergy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodAllergyModel _$FoodAllergyModelFromJson(Map<String, dynamic> json) =>
    FoodAllergyModel()
      ..sId = json['sId'] as String?
      ..name = json['name'] as String?
      ..iV = json['iV'] as int?;

Map<String, dynamic> _$FoodAllergyModelToJson(FoodAllergyModel instance) =>
    <String, dynamic>{
      'sId': instance.sId,
      'name': instance.name,
      'iV': instance.iV,
    };

FoodAllergyCompleteModel _$FoodAllergyCompleteModelFromJson(
        Map<String, dynamic> json) =>
    FoodAllergyCompleteModel(
      success: json['success'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => FoodAllergyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FoodAllergyCompleteModelToJson(
        FoodAllergyCompleteModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
