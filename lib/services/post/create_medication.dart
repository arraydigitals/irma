import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

import '../../modules/dio_service.dart';

class CreateMedication {
  var _dioService = DioService.getInstance();

  Future medication(String userId, String medicine,  String reason,String prescribed,
      String datefrom, String dateto) async {
    var medicationJson = {
      "userId":userId,
      "medicine": medicine,
      "reason": reason,
      "prescribed": prescribed,
      "datefrom": datefrom,
      "dateto":dateto
    };
    try {
      final response = await _dioService.post(
        'create-medicationhistory',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: jsonEncode(medicationJson),
      );
      if (response.statusCode == 201) {
 
      } else {
        return response.statusMessage;
      }
    } catch (e) {
      dynamic exception = e;
      return exception.message;
    }
  }
}
