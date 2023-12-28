import 'package:json_annotation/json_annotation.dart';

part 'routine_model.g.dart';

@JsonSerializable()
class RoutineModel {
  RoutineModel();

   String? sId;
  String? questiontext;
  String? answers;
  int? iV;

  factory RoutineModel.fromJson(Map<String, dynamic> json) =>
      _$RoutineModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoutineModelToJson(this);

  @override
  String toString() {
    return 'RoutineModel{sId: $sId, questiontext: $questiontext, answers: $answers,iV:$iV}';
  }
}

@JsonSerializable()
class RoutineCompleteModel {
  int? success;
  List<RoutineModel>? data;

  RoutineCompleteModel({
    this.success,
    this.data,
  });

  factory RoutineCompleteModel.fromJson(Map<String, dynamic> json) =>
      _$RoutineCompleteModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoutineCompleteModelToJson(this);

  @override
  String toString() {
    return 'RoutineCompleteModel{success: $success, data: $data}';
  }
}
