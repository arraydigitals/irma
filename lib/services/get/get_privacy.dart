import 'package:dio/dio.dart';
import 'package:imraapp/model/privacy_model.dart';
import '../../modules/dio_service.dart';

class GetPrivacy {
  var _dioService = DioService.getInstance();
  Future getPrivacy() async {
    try {
      final response = await _dioService.get(
        'get-privacy',
        options: Options(headers: {
          // HttpHeaders.authorizationHeader: 'Bearer $token',
          'content-Type': 'application/json'
        }),
      );
      if (response.statusCode == 200) {
       
        List historyData = response.data['data'];
       
        List<PrivacyModel> privacyhistoryModel =
            historyData.map((e) => PrivacyModel.fromJson(e)).toList();
  
        return privacyhistoryModel;
      } else {
        return response.statusMessage;
      }
    } catch (e) {
      print('thi is errr ${e}');
      dynamic exception = e;
      return exception.message;
    }
  }
}
