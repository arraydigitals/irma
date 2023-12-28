import 'package:dio/dio.dart';
import 'package:imraapp/model/food_allergy_model.dart';
import '../../modules/dio_service.dart';

class GetFoodAllergy {
  var _dioService = DioService.getInstance();

  Future getFoodAllergy() async {
    try {
      final response = await _dioService.get(
        'get/food-allergies',
        options: Options(headers: {
          // HttpHeaders.authorizationHeader: 'Bearer $token',
          'content-Type': 'application/json'
        }),
      );
      if (response.statusCode == 200) {
        print('this is response data ${response.data}');
        List historyData = response.data['foodAllergies'];
        print('this ios ddd ${historyData}');
        List<FoodAllergyModel> foodhistoryModel =
            historyData.map((e) => FoodAllergyModel.fromJson(e)).toList();
        print('this is food ${foodhistoryModel}');
        return foodhistoryModel;
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
