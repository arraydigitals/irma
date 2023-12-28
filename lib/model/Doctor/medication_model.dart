import 'package:json_annotation/json_annotation.dart';

part 'medication_model.g.dart';

@JsonSerializable()
class MedicationModel {
  MedicationModel();

   String? sId;
  String? user;
  String? medicine;
  String? reason;
  String? prescribed;
  String? datefrom;
  String? dateto;
  String? createdAt;
  String? updatedAt;
  int? iV;

  factory MedicationModel.fromJson(Map<String, dynamic> json) =>
      _$MedicationModelFromJson(json);

  Map<String, dynamic> toJson() => _$MedicationModelToJson(this);

  @override
  String toString() {
    return 'MedicationModel{sId: $sId, user: $user, medicine: $medicine, reason: $reason, prescribed:$prescribed, datefrom: $datefrom,dateto:$dateto, createdAt:$createdAt, updatedAt:$updatedAt,iV: $iV,}';
  }
}

@JsonSerializable()
class MedicationCompleteModel {
  int? success;
  List<MedicationModel>? data;

  MedicationCompleteModel({
    this.success,
    this.data,
  });

  factory MedicationCompleteModel.fromJson(Map<String, dynamic> json) =>
      _$MedicationCompleteModelFromJson(json);

  Map<String, dynamic> toJson() => _$MedicationCompleteModelToJson(this);

  @override
  String toString() {
    return 'MedicationCompleteModel{success: $success, data: $data}';
  }
}
