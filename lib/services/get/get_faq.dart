
import 'package:dio/dio.dart';
import '../../model/FAQ/faq_model.dart';
import '../../modules/dio_service.dart';

class GetFaq {
  var _dioService = DioService.getInstance();

  Future getFaq() async {
    try {
      final response = await _dioService.get(
        'get-faq',
        options: Options(headers: {
         // HttpHeaders.authorizationHeader: 'Bearer $token',
          'content-Type': 'application/json'
        }),
      );
      if (response.statusCode == 200) {
        List historyData = response.data["data"];
        List<FaqModel> faqhistoryModel =
            historyData.map((e) => FaqModel.fromJson(e)).toList();
        return faqhistoryModel;
      } else {
        return response.statusMessage;
      }
    } catch (e) {
      dynamic exception = e;
      return exception.message;
    }
  }
}