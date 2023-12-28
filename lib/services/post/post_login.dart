import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../model/login/userLoginModel.dart';
import '../../modules/dio_service.dart';

class UserLoginGet {
  var _dioService = DioService.getInstance();

  Future loginUser(String login_id, String password) async {
    var json = {
      "email": login_id,
      "password": password,
    };
    try {
      final response = await _dioService.post(
        'sign-in',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: jsonEncode(json),
      );

      if (response.statusCode == 200) {
        // user found
        if (response.data["success"] == 1) {
          print('this is data ${response.data}');
          UserLoginModel userLoginResponse =
              UserLoginModel.fromJson(response.data);
          return userLoginResponse;
        } else {
          return response.data['data'];
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
