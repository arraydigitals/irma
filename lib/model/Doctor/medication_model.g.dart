// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicationModel _$MedicationModelFromJson(Map<String, dynamic> json) =>
    MedicationModel()
      ..sId = json['sId'] as String?
      ..user = json['user'] as String?
      ..medicine = json['medicine'] as String?
      ..reason = json['reason'] as String?
      ..prescribed = json['prescribed'] as String?
      ..datefrom = json['datefrom'] as String?
      ..dateto = json['dateto'] as String?
      ..createdAt = json['createdAt'] as String?
      ..updatedAt = json['updatedAt'] as String?
      ..iV = json['iV'] as int?;

Map<String, dynamic> _$MedicationModelToJson(MedicationModel instance) =>
    <String, dynamic>{
      'sId': instance.sId,
      'user': instance.user,
      'medicine': instance.medicine,
      'reason': instance.reason,
      'prescribed': instance.prescribed,
      'datefrom': instance.datefrom,
      'dateto': instance.dateto,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'iV': instance.iV,
    };

MedicationCompleteModel _$MedicationCompleteModelFromJson(
        Map<String, dynamic> json) =>
    MedicationCompleteModel(
      success: json['success'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => MedicationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MedicationCompleteModelToJson(
        MedicationCompleteModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
