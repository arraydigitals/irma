import 'package:json_annotation/json_annotation.dart';

part 'faq_model.g.dart';

@JsonSerializable()
class FaqModel {
  FaqModel();

  String? sId;
  String? faqquestion;
  String? faqanswers;
  int? iV;

  factory FaqModel.fromJson(Map<String, dynamic> json) =>
      _$FaqModelFromJson(json);

  Map<String, dynamic> toJson() => _$FaqModelToJson(this);

  @override
  String toString() {
    return 'FaqModel{sId: $sId, faqquestion: $faqquestion, faqanswers: $faqanswers,iV:$iV}';
  }
}

@JsonSerializable()
class FaqCompleteModel {
  int? success;
  List<FaqModel>? data;

  FaqCompleteModel({
    this.success,
    this.data,
  });

  factory FaqCompleteModel.fromJson(Map<String, dynamic> json) =>
      _$FaqCompleteModelFromJson(json);

  Map<String, dynamic> toJson() => _$FaqCompleteModelToJson(this);

  @override
  String toString() {
    return 'FaqCompleteModel{success: $success, data: $data}';
  }
}
