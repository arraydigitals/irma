
import 'package:dio/dio.dart';
import 'package:imraapp/model/food_allergy_model.dart';
import 'package:imraapp/model/question_ans_model.dart';
import '../../modules/dio_service.dart';

class GetQuestion {
  var _dioService = DioService.getInstance();

  Future getQuestion() async {
    try {
      final response = await _dioService.get(
        'get/questions',
        options: Options(headers: {
         // HttpHeaders.authorizationHeader: 'Bearer $token',
          'content-Type': 'application/json'
        }),
      );
      if (response.statusCode == 200) {
        List historyData = response.data["questions"];
        List<QuestionModel> QuestionhistoryModel =
            historyData.map((e) => QuestionModel.fromJson(e)).toList();
        return QuestionhistoryModel;
      } else {
        return response.statusMessage;
      }
    } catch (e) {
      dynamic exception = e;
      return exception.message;
    }
  }
}