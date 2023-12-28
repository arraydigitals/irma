// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privacy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrivacyModel _$PrivacyModelFromJson(Map<String, dynamic> json) => PrivacyModel()
  ..sId = json['sId'] as String?
  ..privacy = json['privacy'] as String?
  ..createdAt = json['createdAt'] as String?
  ..updatedAt = json['updatedAt'] as String?
  ..iV = json['iV'] as int?;

Map<String, dynamic> _$PrivacyModelToJson(PrivacyModel instance) =>
    <String, dynamic>{
      'sId': instance.sId,
      'privacy': instance.privacy,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'iV': instance.iV,
    };

PrivacyCompleteModel _$PrivacyCompleteModelFromJson(
        Map<String, dynamic> json) =>
    PrivacyCompleteModel(
      success: json['success'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PrivacyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PrivacyCompleteModelToJson(
        PrivacyCompleteModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
