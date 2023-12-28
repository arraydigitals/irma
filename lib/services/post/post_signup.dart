import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

import '../../modules/dio_service.dart';

class UserSignUp {
  var _dioService = DioService.getInstance();

  Future signup(String fullname, String email,  String phonenumber,String password,
      String confirmPassword,) async {
    var signupJson = {
      "fullname": fullname,
      "email": email,
      "phonenumber": phonenumber,
      "password": password,
      "confirmPassword": confirmPassword,
      "date_of_birth": "",
      "country": "",
      "address": "",
      "avatar": ""
    };
    try {
      final response = await _dioService.post(
        'create-user',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: jsonEncode(signupJson),
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
