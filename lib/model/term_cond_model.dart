import 'package:json_annotation/json_annotation.dart';

part 'term_cond_model.g.dart';

@JsonSerializable()
class TermCondModel {
  TermCondModel();

   String? sId;
  String? termcondition;
  String? createdAt;
  String? updatedAt;
  int? iV;

  factory TermCondModel.fromJson(Map<String, dynamic> json) =>
      _$TermCondModelFromJson(json);

  Map<String, dynamic> toJson() => _$TermCondModelToJson(this);

  @override
  String toString() {
    return 'TermCondModel{sId: $sId, termcondition: $termcondition,createdAt:$createdAt, updatedAt:$updatedAt,iV:$iV}';
  }
}

@JsonSerializable()
class TermCondCompleteModel {
  int? success;
  List<TermCondModel>? data;

  TermCondCompleteModel({
    this.success,
    this.data,
  });

  factory TermCondCompleteModel.fromJson(Map<String, dynamic> json) =>
      _$TermCondCompleteModelFromJson(json);

  Map<String, dynamic> toJson() => _$TermCondCompleteModelToJson(this);

  @override
  String toString() {
    return 'TermCondCompleteModel{success: $success, data: $data}';
  }
}
