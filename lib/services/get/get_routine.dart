
import 'package:dio/dio.dart';
import 'package:imraapp/model/routine_model.dart';
import '../../modules/dio_service.dart';

class GetRoutine {
  var _dioService = DioService.getInstance();

  Future getRoutine() async {
    try {
      final response = await _dioService.get(
        'get/routines',
        options: Options(headers: {
         // HttpHeaders.authorizationHeader: 'Bearer $token',
          'content-Type': 'application/json'
        }),
      );
      if (response.statusCode == 200) {
        List historyData = response.data["data"];
        List<RoutineModel> routinehistoryModel =
            historyData.map((e) => RoutineModel.fromJson(e)).toList();
        return routinehistoryModel;
      } else {
        return response.statusMessage;
      }
    } catch (e) {
      dynamic exception = e;
      return exception.message;
    }
  }
}