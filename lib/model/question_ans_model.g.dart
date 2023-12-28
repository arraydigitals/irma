// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_ans_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) =>
    QuestionModel()
      ..sId = json['sId'] as String?
      ..questionText = json['questionText'] as String?
      ..answers =
          (json['answers'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..iV = json['iV'] as int?;

Map<String, dynamic> _$QuestionModelToJson(QuestionModel instance) =>
    <String, dynamic>{
      'sId': instance.sId,
      'questionText': instance.questionText,
      'answers': instance.answers,
      'iV': instance.iV,
    };

QuestionCompleteModel _$QuestionCompleteModelFromJson(
        Map<String, dynamic> json) =>
    QuestionCompleteModel(
      success: json['success'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionCompleteModelToJson(
        QuestionCompleteModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
