import 'package:json_annotation/json_annotation.dart';

part 'medication_history_model.g.dart';

@JsonSerializable()
class MedicationHistoryModel {
  MedicationHistoryModel();

  String? _id;
  String? user;
  String? medicine;
  String? reason;
  String? prescribed;
  String? datefrom;
  String? dateto;
  String? createdAt;
  String? updatedAt;

  factory MedicationHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$MedicationHistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$MedicationHistoryModelToJson(this);

  @override
  String toString() {
    return 'MedicationHistoryModel{_id: $_id, user: $user, medicine: $medicine, reason: $reason, prescribed:$prescribed, datefrom: $datefrom, dateto:$dateto,   createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}

@JsonSerializable()
class MedicationHistoryCompleteModel {
  int? success;
  List<MedicationHistoryModel>? data;

  MedicationHistoryCompleteModel({
    this.success,
    this.data,
  });

  factory MedicationHistoryCompleteModel.fromJson(Map<String, dynamic> json) =>
      _$MedicationHistoryCompleteModelFromJson(json);

  Map<String, dynamic> toJson() => _$MedicationHistoryCompleteModelToJson(this);

  @override
  String toString() {
    return 'MedicationHistoryCompleteModel{success: $success, data: $data}';
  }
}
