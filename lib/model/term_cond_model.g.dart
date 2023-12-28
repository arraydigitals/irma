// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'term_cond_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TermCondModel _$TermCondModelFromJson(Map<String, dynamic> json) =>
    TermCondModel()
      ..sId = json['sId'] as String?
      ..termcondition = json['termcondition'] as String?
      ..createdAt = json['createdAt'] as String?
      ..updatedAt = json['updatedAt'] as String?
      ..iV = json['iV'] as int?;

Map<String, dynamic> _$TermCondModelToJson(TermCondModel instance) =>
    <String, dynamic>{
      'sId': instance.sId,
      'termcondition': instance.termcondition,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'iV': instance.iV,
    };

TermCondCompleteModel _$TermCondCompleteModelFromJson(
        Map<String, dynamic> json) =>
    TermCondCompleteModel(
      success: json['success'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TermCondModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TermCondCompleteModelToJson(
        TermCondCompleteModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
