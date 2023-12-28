import 'package:json_annotation/json_annotation.dart';

part 'document_model.g.dart';

@JsonSerializable()
class DocumentModel {
  DocumentModel();

   String? sId;
  String? user;
  String? doc_name;
  String? description;
  String? document;
  String? createdAt;
  String? updatedAt;
  int? iV;

  factory DocumentModel.fromJson(Map<String, dynamic> json) =>
      _$DocumentModelFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentModelToJson(this);

  @override
  String toString() {
    return 'DocumentModel{sId: $sId, user: $user, docName: $doc_name, description: $description, document:$document, createdAt: $createdAt, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}

@JsonSerializable()
class DocumentCompleteModel {
  int? success;
  List<DocumentModel>? data;

  DocumentCompleteModel({
    this.success,
    this.data,
  });

  factory DocumentCompleteModel.fromJson(Map<String, dynamic> json) =>
      _$DocumentCompleteModelFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentCompleteModelToJson(this);

  @override
  String toString() {
    return 'DocumentCompleteModel{success: $success, data: $data}';
  }
}
