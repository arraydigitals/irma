import 'package:dio/dio.dart';
import '../../model/single_user_model.dart';
import '../../modules/dio_service.dart';

class GetSingleUser {
  final _dioService = DioService.getInstance();

  Future getSingleUser(
    String userId,
  ) async {
    try {
      final response = await _dioService.get(
        'single-user/$userId',
        options: Options(headers: {
          // HttpHeaders.authorizationHeader: 'Bearer $token',
          'content-Type': 'application/json'
        }),
      );
      if (response.statusCode == 200) {
        SingleUserModel SingleUserResponse =
            SingleUserModel.fromJson(response.data);
        print('this is response data user ${response.data}');
        return SingleUserResponse;
      } else {
        return response.statusMessage;
      }
    } catch (e) {
      dynamic exception = e;
      return exception.message;
    }
  }
}
