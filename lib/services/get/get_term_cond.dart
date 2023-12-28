import 'package:dio/dio.dart';
import 'package:imraapp/model/term_cond_model.dart';
import '../../modules/dio_service.dart';

class GetTermCond {
  var _dioService = DioService.getInstance();
  Future getTermcond() async {
    try {
      final response = await _dioService.get(
        'get-term-condition',
        options: Options(headers: {
          // HttpHeaders.authorizationHeader: 'Bearer $token',
          'content-Type': 'application/json'
        }),
      );
      if (response.statusCode == 200) {
       
        List historyData = response.data['data'];
       
        List<TermCondModel> termhistoryModel =
            historyData.map((e) => TermCondModel.fromJson(e)).toList();
  
        return termhistoryModel;
      } else {
        return response.statusMessage;
      }
    } catch (e) {
      dynamic exception = e;
      return exception.message;
    }
  }
}
