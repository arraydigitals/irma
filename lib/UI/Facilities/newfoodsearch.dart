import 'dart:convert';

import 'package:flutter/material.dart';

import '../../modules/dio_service.dart';

class FoodAllergiesScreen1 extends StatefulWidget {
  @override
  _FoodAllergiesScreen1State createState() => _FoodAllergiesScreen1State();
}

class _FoodAllergiesScreen1State extends State<FoodAllergiesScreen1> {
  TextEditingController searchTextController = TextEditingController();
  List<dynamic>? foodAllergies = [];

  Future<void> searchFoodAllergies() async {
    final String apiUrl = 'search/food-allergies';

    try {
      var dioService = DioService.getInstance();
      final response = await dioService.get(apiUrl, queryParameters: {
        'searchText': searchTextController.text.toString(),
      });

      if (response.statusCode == 200) {
        if (searchTextController.text.isEmpty) {
          // Clear the results or update the UI as needed
          setState(() {
            foodAllergies =
                null; // Or clear the list or update the UI accordingly
          });
        } else {
          setState(() {
            foodAllergies = response.data['foodAllergies']!;
            print('Food Allergies: $foodAllergies');
          });
        }
        // print('Raw Response: ${response.data}');

        // print(' Response: ${foodAllergies}');
        // // final jsonResponse = json.decode(response.data.toString());
        // setState(() {
        //   foodAllergies = response.data['foodAllergies'];
        //   print('Food Allergies: $foodAllergies');
        // });
      } else {
        // Handle error
        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      // Handle error
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Allergies'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                searchFoodAllergies();
              },
              controller: searchTextController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                  left: 15,
                  top: 15,
                ),
                border: InputBorder.none,
                hintText: 'Search',
                suffixIcon: IconButton(
                  onPressed: () {
                    // Optionally, you can trigger search here as well.
                    // searchFoodAllergies();
                  },
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
          if (foodAllergies != null)
            Expanded(
              child: ListView.builder(
                itemCount: foodAllergies!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${foodAllergies![index]['name']}'),
                    subtitle: Text('${foodAllergies![index]['_id']}'),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
