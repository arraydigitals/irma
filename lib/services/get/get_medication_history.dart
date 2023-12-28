import 'package:dio/dio.dart';
import 'package:imraapp/model/medication_history_model.dart';
import '../../modules/dio_service.dart';

class GetMedicationHostory {
  var _dioService = DioService.getInstance();

  Future getmedicationHistory(String userId) async {
    try {
      final response = await _dioService.get(
        'medication-history/$userId',
        options: Options(headers: {
          // HttpHeaders.authorizationHeader: 'Bearer $token',
          'content-Type': 'application/json'
        }),
      );
      if (response.statusCode == 200) {
        List historyData = response.data["data"];
        List<MedicationHistoryModel> medicationhistoryModel =
            historyData.map((e) => MedicationHistoryModel.fromJson(e)).toList();
        return medicationhistoryModel;
      } else {
        return response.statusMessage;
      }
    } catch (e) {
      dynamic exception = e;
      return exception.message;
    }
  }
}
