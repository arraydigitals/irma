import 'package:dio/dio.dart';
import '../../model/Doctor/doctor_model.dart';
import '../../model/medical_history_model.dart';
import '../../modules/dio_service.dart';

class GetHospital {
  var _dioService = DioService.getInstance();

  Future getHospital(String userId) async {
    try {
      final response = await _dioService.get(
        'all-hospitals',
        options: Options(headers: {
          // HttpHeaders.authorizationHeader: 'Bearer $token',
          'content-Type': 'application/json'
        }),
      );

      if (response.statusCode == 200) {
        List hospitalData = response.data["hospitals"];
        List<DoctorModel> hospitalModel =
            hospitalData.map((e) => DoctorModel.fromJson(e)).toList();
        print('this is resp data ${hospitalModel}');
        return hospitalModel;
      } else {
        return response.statusMessage;
      }
    } catch (e) {
      print('this is error ${e}');
      dynamic exception = e;
      return exception.message;
    }
  }
}
