import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

import '../../modules/dio_service.dart';

class UserDocument {
  var _dioService = DioService.getInstance();

  Future document(
    String doc_name,
    String description,
    String document,
  ) async {
    var docJson = {
      "doc_name": doc_name,
      "description": description,
      "document": document,
    };
    try {
      final response = await _dioService.post(
        'create-document',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: jsonEncode(docJson),
      );
      if (response.statusCode == 200) {
        // user found
        if (response.data["status"] == true) {
          return;
        } else {
          return response.data['message'];
        }
      } else {
        return response.statusMessage;
      }
    } catch (e) {
      dynamic exception = e;
      return exception.message;
    }
  }
}
