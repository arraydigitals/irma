import 'package:dio/dio.dart';
import 'package:imraapp/model/user_medical_history.dart';
import '../../model/medical_history_model.dart';
import '../../modules/dio_service.dart';

class GetMedicalHostory {
  var _dioService = DioService.getInstance();

  Future getmedicalHistory(String userId) async {
    try {
      final response = await _dioService.get(
        'all-medical-history/$userId',
        options: Options(headers: {
          // HttpHeaders.authorizationHeader: 'Bearer $token',
          'content-Type': 'application/json'
        }),
      );
      if (response.statusCode == 200) {
        List historyData = response.data["data"];
        print('this is data ${historyData}');
        List<UserMedicalHistoryModel> medicalhistoryModel = historyData
            .map((e) => UserMedicalHistoryModel.fromJson(e))
            .toList();
        return medicalhistoryModel;
      } else {
        return response.statusMessage;
      }
    } catch (e) {
      dynamic exception = e;
      return exception.message;
    }
  }
}
