
import 'package:dio/dio.dart';
import 'package:imraapp/model/country_model.dart';
import '../../modules/dio_service.dart';

class GetCountry {
  var _dioService = DioService.getInstance();

  Future getCountry() async {
    try {
      final response = await _dioService.get(
        'all-country',
        options: Options(headers: {
         // HttpHeaders.authorizationHeader: 'Bearer $token',
          'content-Type': 'application/json'
        }),
      );
      if (response.statusCode == 200) {
        List historyData = response.data["data"];
        List<CountryModel> countryhistoryModel =
            historyData.map((e) => CountryModel.fromJson(e)).toList();
        return countryhistoryModel;
      } else {
        return response.statusMessage;
      }
    } catch (e) {
      dynamic exception = e;
      return exception.message;
    }
  }
}