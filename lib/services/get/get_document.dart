import 'package:dio/dio.dart';
import '../../model/Document/document_model.dart';
import '../../model/medical_history_model.dart';
import '../../modules/dio_service.dart';

class GetDocument {
  var _dioService = DioService.getInstance();

  Future getdocument(String userId) async {
    try {
      final response = await _dioService.get(
        'user_all_doc/$userId',
        options: Options(headers: {
          // HttpHeaders.authorizationHeader: 'Bearer $token',
          'content-Type': 'application/json'
        }),
      );
      if (response.statusCode == 200) {
        List historyData = response.data["documents"];
        List<DocumentModel> document =
            historyData.map((e) => DocumentModel.fromJson(e)).toList();
        return document;
      } else {
        return response.statusMessage;
      }
    } catch (e) {
      dynamic exception = e;
      return exception.message;
    }
  }
}
