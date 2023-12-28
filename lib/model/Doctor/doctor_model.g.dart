// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorModel _$DoctorModelFromJson(Map<String, dynamic> json) => DoctorModel()
  ..sId = json['sId'] as String?
  ..fullname = json['fullname'] as String?
  ..email = json['email'] as String?
  ..phonenumber = json['phonenumber'] as String?
  ..address = json['address'] as String?
  ..branch = json['branch'] as String?
  ..avatar = json['avatar'] as String?
  ..iV = json['iV'] as int?;

Map<String, dynamic> _$DoctorModelToJson(DoctorModel instance) =>
    <String, dynamic>{
      'sId': instance.sId,
      'fullname': instance.fullname,
      'email': instance.email,
      'phonenumber': instance.phonenumber,
      'address': instance.address,
      'branch': instance.branch,
      'avatar': instance.avatar,
      'iV': instance.iV,
    };

DoctorCompleteModel _$DoctorCompleteModelFromJson(Map<String, dynamic> json) =>
    DoctorCompleteModel(
      success: json['success'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DoctorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DoctorCompleteModelToJson(
        DoctorCompleteModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
