import 'package:json_annotation/json_annotation.dart';

part 'question_ans_model.g.dart';

@JsonSerializable()
class QuestionModel {
  QuestionModel();

  String? sId;
  String? questionText;
  List<String>? answers;
  int? iV;

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);

  @override
  String toString() {
    return 'QuestionModel{sId: $sId, questionText: $questionText, answers: $answers,iV:$iV}';
  }
}

@JsonSerializable()
class QuestionCompleteModel {
  int? success;
  List<QuestionModel>? data;

  QuestionCompleteModel({
    this.success,
    this.data,
  });

  factory QuestionCompleteModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionCompleteModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionCompleteModelToJson(this);

  @override
  String toString() {
    return 'QuestionCompleteModel{success: $success, data: $data}';
  }
}
