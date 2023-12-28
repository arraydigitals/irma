// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocumentModel _$DocumentModelFromJson(Map<String, dynamic> json) =>
    DocumentModel()
      ..sId = json['sId'] as String?
      ..user = json['user'] as String?
      ..doc_name = json['doc_name'] as String?
      ..description = json['description'] as String?
      ..document = json['document'] as String?
      ..createdAt = json['createdAt'] as String?
      ..updatedAt = json['updatedAt'] as String?
      ..iV = json['iV'] as int?;

Map<String, dynamic> _$DocumentModelToJson(DocumentModel instance) =>
    <String, dynamic>{
      'sId': instance.sId,
      'user': instance.user,
      'doc_name': instance.doc_name,
      'description': instance.description,
      'document': instance.document,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'iV': instance.iV,
    };

DocumentCompleteModel _$DocumentCompleteModelFromJson(
        Map<String, dynamic> json) =>
    DocumentCompleteModel(
      success: json['success'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DocumentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DocumentCompleteModelToJson(
        DocumentCompleteModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
