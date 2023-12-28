import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'user_medical_history.g.dart';

@JsonSerializable()
class UserMedicalHistoryModel {
  UserMedicalHistoryModel();

 String? sId;
  String? user;
  String? reception;
  String? procedure;
  String? patientNo;
  String? patientName;
  String? dieases;
  String? test;
  String? fees;
  String? prescribed;
  String? reason;
  String? medCenter;
  String? doctor_name;
  int? searchCount;
  String? date;
  String? createdAt;
  String? updatedAt;
  int? iV;

  factory UserMedicalHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$UserMedicalHistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserMedicalHistoryModelToJson(this);

  @override
  String toString() {
    return 'UserMedicalHistoryModel{_id: $sId, user: $user, procedure: $procedure, reason: $reason, medCenter:$medCenter, date: $date, createdAt: $createdAt, updatedAt: $updatedAt, reception: $reception, patientNo: $patientNo, patientName: $patientName, dieases: $dieases, test: $test, fees: $fees, prescribed: $prescribed, searchCount: $searchCount,doctor_name:$doctor_name}';
  }
}

@JsonSerializable()
class UserMedicalHistoryCompleteModel {
  int? success;
  List<UserMedicalHistoryModel>? data;

  UserMedicalHistoryCompleteModel({
    this.success,
    this.data,
  });

  factory UserMedicalHistoryCompleteModel.fromJson(Map<String, dynamic> json) =>
      _$UserMedicalHistoryCompleteModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserMedicalHistoryCompleteModelToJson(this);

  @override
  String toString() {
    return 'UserMedicalHistoryCompleteModel{success: $success, data: $data}';
  }
}
