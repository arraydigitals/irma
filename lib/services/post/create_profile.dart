
import 'dart:io';
import 'package:dio/dio.dart';

import '../../modules/dio_service.dart';

class UserProfile {
  var _dioService = DioService.getInstance();

  Future userProfile( String id, String date_of_birth, String country,  String address,String avatar) async {
    var profileJson = {

      "date_of_birth": date_of_birth,
      "country": country,
      "address": address,
      "avatar": avatar
    };
    try {
      final response = await _dioService.post(
        'create-profile/$id',
        options: Options(headers: {
          // HttpHeaders.authorizationHeader:
          // 'Bearer $token',
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: profileJson,
      );
      if (response.statusCode == 200) {
       // user found
        print('User profile created successfully');
        print("this is repsone ${response.data.toString()}");
        // if (response.data["status"] == true) {
        //   return;
        // } else {
        //   return response.data['message'];
        // }
      } else {
        print('Error: ${response.statusMessage}');
        return response.statusMessage;
      }
    } catch (e) {
      print('Error: $e');
      dynamic exception = e;
      return exception.message;
    }
  }
}
