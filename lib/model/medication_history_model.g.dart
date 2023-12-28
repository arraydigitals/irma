// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicationHistoryModel _$MedicationHistoryModelFromJson(
        Map<String, dynamic> json) =>
    MedicationHistoryModel()
      ..user = json['user'] as String?
      ..medicine = json['medicine'] as String?
      ..reason = json['reason'] as String?
      ..prescribed = json['prescribed'] as String?
      ..datefrom = json['datefrom'] as String?
      ..dateto = json['dateto'] as String?
      ..createdAt = json['createdAt'] as String?
      ..updatedAt = json['updatedAt'] as String?;

Map<String, dynamic> _$MedicationHistoryModelToJson(
        MedicationHistoryModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'medicine': instance.medicine,
      'reason': instance.reason,
      'prescribed': instance.prescribed,
      'datefrom': instance.datefrom,
      'dateto': instance.dateto,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

MedicationHistoryCompleteModel _$MedicationHistoryCompleteModelFromJson(
        Map<String, dynamic> json) =>
    MedicationHistoryCompleteModel(
      success: json['success'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map(
              (e) => MedicationHistoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MedicationHistoryCompleteModelToJson(
        MedicationHistoryCompleteModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
