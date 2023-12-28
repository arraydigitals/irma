// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_medical_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMedicalHistoryModel _$UserMedicalHistoryModelFromJson(
        Map<String, dynamic> json) =>
    UserMedicalHistoryModel()
      ..sId = json['sId'] as String?
      ..user = json['user'] as String?
      ..reception = json['reception'] as String?
      ..procedure = json['procedure'] as String?
      ..patientNo = json['patientNo'] as String?
      ..patientName = json['patientName'] as String?
      ..dieases = json['dieases'] as String?
      ..test = json['test'] as String?
      ..fees = json['fees'] as String?
      ..prescribed = json['prescribed'] as String?
      ..reason = json['reason'] as String?
      ..medCenter = json['medCenter'] as String?
      ..doctor_name = json['doctor_name'] as String?
      ..searchCount = json['searchCount'] as int?
      ..date = json['date'] as String?
      ..createdAt = json['createdAt'] as String?
      ..updatedAt = json['updatedAt'] as String?
      ..iV = json['iV'] as int?;

Map<String, dynamic> _$UserMedicalHistoryModelToJson(
        UserMedicalHistoryModel instance) =>
    <String, dynamic>{
      'sId': instance.sId,
      'user': instance.user,
      'reception': instance.reception,
      'procedure': instance.procedure,
      'patientNo': instance.patientNo,
      'patientName': instance.patientName,
      'dieases': instance.dieases,
      'test': instance.test,
      'fees': instance.fees,
      'prescribed': instance.prescribed,
      'reason': instance.reason,
      'medCenter': instance.medCenter,
      'doctor_name': instance.doctor_name,
      'searchCount': instance.searchCount,
      'date': instance.date,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'iV': instance.iV,
    };

UserMedicalHistoryCompleteModel _$UserMedicalHistoryCompleteModelFromJson(
        Map<String, dynamic> json) =>
    UserMedicalHistoryCompleteModel(
      success: json['success'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              UserMedicalHistoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserMedicalHistoryCompleteModelToJson(
        UserMedicalHistoryCompleteModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
