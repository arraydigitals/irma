// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryModel _$CountryModelFromJson(Map<String, dynamic> json) => CountryModel()
  ..sId = json['sId'] as String?
  ..countryImage = json['countryImage'] as String?
  ..name = json['name'] as String?
  ..createdAt = json['createdAt'] as String?
  ..updatedAt = json['updatedAt'] as String?
  ..iV = json['iV'] as int?;

Map<String, dynamic> _$CountryModelToJson(CountryModel instance) =>
    <String, dynamic>{
      'sId': instance.sId,
      'countryImage': instance.countryImage,
      'name': instance.name,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'iV': instance.iV,
    };

CountryCompleteModel _$CountryCompleteModelFromJson(
        Map<String, dynamic> json) =>
    CountryCompleteModel(
      success: json['success'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CountryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CountryCompleteModelToJson(
        CountryCompleteModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
