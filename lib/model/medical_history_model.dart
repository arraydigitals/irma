import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'medical_history_model.g.dart';

@JsonSerializable()
class MedicalHistoryModel {
  MedicalHistoryModel();

  String? _id;
  String? user;
  String? procedure;
  String? reason;
  String? medCenter;
  String? date;
  String? createdAt;
  String? updatedAt;
  String? reception;
 String? patientNo ;
 String? patientName;
 String? dieases;
 String? test;
 String? fees;
 String? doctor_name;
 String? prescribed;
 String? searchCount;

  factory MedicalHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$MedicalHistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$MedicalHistoryModelToJson(this);

  @override
  String toString() {
    return 'MedicalHistoryModel{_id: $_id, user: $user, procedure: $procedure, reason: $reason, medCenter:$medCenter, date: $date, createdAt: $createdAt, updatedAt: $updatedAt, reception: $reception, patientNo: $patientNo, patientName: $patientName, dieases: $dieases, test: $test, fees: $fees, doctor_name: $doctor_name, prescribed: $prescribed, searchCount: $searchCount}';
  }
}

@JsonSerializable()
class MedicalHistoryCompleteModel {
  int? success;
  List<MedicalHistoryModel>? data;

  MedicalHistoryCompleteModel({
    this.success,
    this.data,
  });

  factory MedicalHistoryCompleteModel.fromJson(Map<String, dynamic> json) =>
      _$MedicalHistoryCompleteModelFromJson(json);

  Map<String, dynamic> toJson() => _$MedicalHistoryCompleteModelToJson(this);

  @override
  String toString() {
    return 'MedicalHistoryCompleteModel{success: $success, data: $data}';
  }
}
