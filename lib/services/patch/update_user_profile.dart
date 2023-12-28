import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../model/single_user_model.dart';
import '../../modules/dio_service.dart';

class UserUpdate {
  var _dioService = DioService.getInstance();
  Future userUpdate(
      String userId,
      String fullname,
      String email,
      String phonenumber,
      String date_of_birth,
      String country,
      String address,
      String avatar) async {
    var json = {
      "fullname": fullname,
      "email": email,
      "phonenumber": phonenumber,
      "date_of_birth": date_of_birth,
      "country":country ,
      "address":address,
      "avatar": avatar,

      // "password": password,
    };
    try {
      final response = await _dioService.patch(
        'userupdate/$userId',
        //  'user-meta/update',
        options: Options(headers: {
          // HttpHeaders.authorizationHeader: 'Bearer $token',
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: jsonEncode(json),
      );
      if (response.statusCode == 200) {
        // user found
        //print('udate');
       
         SingleUserModel userUpdatesModel = SingleUserModel.fromJson(response.data['data']);
          return userUpdatesModel;
        
      } else {
        return response.statusMessage;
      }
    } catch (e) {
      dynamic exception = e;
      return exception.message;
    }
  }
}
