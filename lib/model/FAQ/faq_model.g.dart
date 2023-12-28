// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaqModel _$FaqModelFromJson(Map<String, dynamic> json) => FaqModel()
  ..sId = json['sId'] as String?
  ..faqquestion = json['faqquestion'] as String?
  ..faqanswers = json['faqanswers'] as String?
  ..iV = json['iV'] as int?;

Map<String, dynamic> _$FaqModelToJson(FaqModel instance) => <String, dynamic>{
      'sId': instance.sId,
      'faqquestion': instance.faqquestion,
      'faqanswers': instance.faqanswers,
      'iV': instance.iV,
    };

FaqCompleteModel _$FaqCompleteModelFromJson(Map<String, dynamic> json) =>
    FaqCompleteModel(
      success: json['success'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => FaqModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FaqCompleteModelToJson(FaqCompleteModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
