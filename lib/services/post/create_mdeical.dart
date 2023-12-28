import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

import '../../modules/dio_service.dart';

class CreateMedical {
  var _dioService = DioService.getInstance();

  Future medical(
    String userId,
    String procedure,
    String reason,
    String medCenter,
    String date,
    // String receptionId,
    // String patientNo,
    // String patientName,
    // String doctor_name,
    // String dieases,
    // String test,
    // String fees,
    // String prescribed,
  ) async {
    var medicalJson = {
      "userId": userId,
      "procedure": procedure,
      "reason": reason,
      "medCenter": medCenter,
      "date": date,
      // "receptionId": receptionId,
      // "patientNo": patientNo,
      // "patientName":patientName,
      // "dieases": dieases,
      // "test": test,
      // "fees": fees,
      // "prescribed": prescribed,
      // "doctor_name": doctor_name,
    };
    try {
      final response = await _dioService.post(
        'create-medicalhistory',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: jsonEncode(medicalJson),
      );
      if (response.statusCode == 201) {
      } else {
        return response.statusMessage;
      }
    } catch (e) {
      print('Error: $e');
      if (e is DioError) {
        print('DioError: ${e.response?.data}');
      }
      dynamic exception = e;
      return exception.message;
    }
  }
}
