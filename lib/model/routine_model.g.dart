// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutineModel _$RoutineModelFromJson(Map<String, dynamic> json) => RoutineModel()
  ..sId = json['sId'] as String?
  ..questiontext = json['questiontext'] as String?
  ..answers = json['answers'] as String?
  ..iV = json['iV'] as int?;

Map<String, dynamic> _$RoutineModelToJson(RoutineModel instance) =>
    <String, dynamic>{
      'sId': instance.sId,
      'questiontext': instance.questiontext,
      'answers': instance.answers,
      'iV': instance.iV,
    };

RoutineCompleteModel _$RoutineCompleteModelFromJson(
        Map<String, dynamic> json) =>
    RoutineCompleteModel(
      success: json['success'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => RoutineModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoutineCompleteModelToJson(
        RoutineCompleteModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
