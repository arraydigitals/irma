import 'package:json_annotation/json_annotation.dart';

part 'doctor_model.g.dart';

@JsonSerializable()
class DoctorModel {
  DoctorModel();

  String? sId;
  String? fullname;
  String? email;
  String? phonenumber;
  String? address;
  String? branch;
  String? avatar;
  int? iV;

  factory DoctorModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorModelToJson(this);

  @override
  String toString() {
    return 'DoctorModel{sId: $sId, fullname: $fullname, email: $email, phonenumber: $phonenumber, avatar:$avatar, branch: $branch, iV: $iV,}';
  }
}

@JsonSerializable()
class DoctorCompleteModel {
  int? success;
  List<DoctorModel>? data;

  DoctorCompleteModel({
    this.success,
    this.data,
  });

  factory DoctorCompleteModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorCompleteModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorCompleteModelToJson(this);

  @override
  String toString() {
    return 'DoctorCompleteModel{success: $success, data: $data}';
  }
}
