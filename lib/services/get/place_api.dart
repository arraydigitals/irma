import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class PlaceSearchModel {
  String? sessionToken;
  List placeList = [];

  PlaceSearchModel() {
    sessionToken = '1234567890';
  }
  Future<void> getSuggestions(
      String input, String apiKey, double myLat, double myLng) async {
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$input&location=$myLat,$myLng&origin=$myLat,$myLng&radius=500&key=$apiKey';

    try {
      var response = await http.get(Uri.parse(request));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        final predictions = data['predictions'];

        placeList = predictions;
      } else {
        throw Exception('Failed to load predictions');
      }
    } catch (e) {
      debugPrint('Exception: $e');
    }
  }
}
