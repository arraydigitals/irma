// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:flutter_xlider/flutter_xlider.dart';
// import 'package:imraapp/Utils/extensions.dart';
// import 'package:imraapp/Utils/whole_loader.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:stacked/stacked.dart';
// import '../../Utils/color_utils.dart';
// import '../../Utils/font_utils.dart';
// import '../../Utils/image_utils.dart';
// import '../../ViewModels/main_view_model.dart';
// import '../../Widgets/custom_text_field.dart';
// import '../../Widgets/customtextfield.dart';
// import '../../Widgets/page_horizontal_margin.dart';
// import '../../Widgets/text_widget.dart';
// import '../../Widgets/textfiled_widget.dart';
// import '../../app/locator.dart';
// import '../../modules/dio_service.dart';
// import '../profilescreen/edit_user_profile_screen2.dart';
// import 'filter_screen.dart';

// class FoodAllergiesScreen extends StatefulWidget {
//   const FoodAllergiesScreen({Key? key}) : super(key: key);

//   @override
//   State<FoodAllergiesScreen> createState() => _FoodAllergiesScreenState();
// }

// class _FoodAllergiesScreenState extends State<FoodAllergiesScreen> {
//   var mymodel;
//   Map<int, bool> selectedOptions = {};
//   List<String> selectedFoodNames = [];

//   @override
//   void initState() {
//     super.initState();
//     // Initialize state asynchronously
//     initializeState();
//   }

//   Future<void> initializeState() async {
//     // Simulate an asynchronous task, such as fetching data
//     await mymodel.gettingFood(context);

//     setState(() {
//       // Initialize selectedOptions based on the length of model.food
//       selectedOptions = Map.fromIterable(
//         mymodel.food!,
//         key: (item) => mymodel.food!.indexOf(item),
//         value: (item) => false,
//       );
//     });
//   }

//   TextEditingController searchTextController = TextEditingController();
//   List<dynamic> foodAllergies = [];
//   Future<void> searchFoodAllergies() async {
//     final String apiUrl = '/get/food-allergies';

//     // Replace 'YOUR_API_BASE_URL' with the actual base URL of your API.

//     try {
//       var dioService = DioService.getInstance();
//       final response = await dioService.get('$apiUrl', queryParameters: {
//         'searchText': searchTextController.text.toString()
//       });

//       if (response.statusCode == 200) {
//         final jsonResponse = json.decode(response.data.toString());
//         setState(() {
//           foodAllergies = jsonResponse['foodAllergies'];
//         });
//       } else {
//         // Handle error
//         print('Error: ${response.statusCode}');
//       }
//     } catch (error) {
//       // Handle error
//       print('Error: $error');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<MainViewModel>.reactive(
//       viewModelBuilder: () => locator<MainViewModel>(),
//       disposeViewModel: false,
//       onModelReady: (model) async {
//         mymodel = model;
//         await initializeState();
//       },
//       builder: (context, model, child) {
//         return model.foodLoader == true
//             ? WholePageLoader()
//             : SafeArea(
//                 top: false,
//                 bottom: false,
//                 child: Scaffold(
//                   body: PageHorizontalMargin(
//                     widget: Column(
//                       children: <Widget>[
//                         SizedBox(
//                           height: 6.h,
//                         ),
//                         Row(
//                           children: [
//                             InkWell(
//                               onTap: () {
//                                 Navigator.pop(context);
//                               },
//                               child: Image.asset(ImageUtils.blackbackarrow),
//                             ),
//                             SizedBox(
//                               width: 3.w,
//                             ),
//                             Text(
//                               "Food Allergies ",
//                               style: TextStyle(
//                                 fontFamily: FontUtils.proxima,
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 4.h,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             color: const Color.fromRGBO(147, 153, 166, 0.09),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: TextField(
//                             controller: searchTextController,
//                             decoration: InputDecoration(
//                               contentPadding: const EdgeInsets.only(
//                                 left: 15,
//                                 top: 15,
//                               ),
//                               border: InputBorder.none,
//                               hintText: 'Search',
//                               suffixIcon: IconButton(
//                                 onPressed: () {
//                                   searchFoodAllergies();
//                                 },
//                                 icon: const Icon(Icons.search),
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 4.h,
//                         ),
//                         Expanded(
//                           child: ListView.builder(
//                             itemCount: model.food?.length ?? 0,
//                             itemBuilder: (context, index) {
//                               return ListTile(
//                                 title: Text(
//                                     '${model.food![index].name.toString()}'),
//                                 trailing: Checkbox(
//                                   value: selectedOptions[index] ?? false,
//                                   onChanged: (bool? value) {
//                                     setState(() {
//                                       selectedOptions[index] = value ?? false;
//                                       if (value ?? false) {
//                                         selectedFoodNames.add(
//                                             model.food![index].name.toString());
//                                       } else {
//                                         selectedFoodNames
//                                             .remove(model.food![index].name);
//                                       }
//                                     });
//                                   },
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                         SizedBox(
//                           height: 3.h,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             shape: BoxShape.rectangle,
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(25.0)),
//                           ),
//                           child: AnimatedContainer(
//                             duration: Duration(milliseconds: 400),
//                             width: MediaQuery.of(context).size.width / 1,
//                             height: 7.h,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(8),
//                               color: ColorUtils.tuple,
//                             ),
//                             child: MaterialButton(
//                               padding: EdgeInsets.zero,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(25),
//                               ),
//                               onPressed: () {
//                                 // Handle the selected food names based on selectedOptions
//                                 print(
//                                     'Selected Food Names: $selectedFoodNames');
//                                 // Navigator.push(
//                                 //   context,
//                                 //   PageTransition(
//                                 //     type: PageTransitionType.fade,
//                                 //     child: EditUserProfileScreen2(),
//                                 //   ),
//                                 // );
//                               },
//                               child: Text(
//                                 "Submit",
//                                 style: TextStyle(
//                                   fontFamily: FontUtils.interSemiBold,
//                                   fontSize: 1.8.t,
//                                   color: ColorUtils.white,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 2.h,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//       },
//     );
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:imraapp/Utils/extensions.dart';
import 'package:imraapp/Utils/whole_loader.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/font_utils.dart';
import '../../Utils/image_utils.dart';
import '../../ViewModels/main_view_model.dart';
import '../../Widgets/custom_text_field.dart';
import '../../Widgets/customtextfield.dart';
import '../../Widgets/page_horizontal_margin.dart';
import '../../Widgets/text_widget.dart';
import '../../Widgets/textfiled_widget.dart';
import '../../app/locator.dart';
import '../../modules/dio_service.dart';
import '../profilescreen/edit_user_profile_screen2.dart';

class FoodAllergiesScreen extends StatefulWidget {
  const FoodAllergiesScreen({Key? key}) : super(key: key);

  @override
  State<FoodAllergiesScreen> createState() => _FoodAllergiesScreenState();
}

class _FoodAllergiesScreenState extends State<FoodAllergiesScreen> {
  var mymodel;
  Map<int, bool> selectedOptions = {};
  List<String> selectedFoodNames = [];

  @override
  void initState() {
    super.initState();
    // Initialize state asynchronously
    initializeState();
  }

  Future<void> initializeState() async {
    // Simulate an asynchronous task, such as fetching data
    await mymodel.gettingFood(context);

    setState(() {
      // Initialize selectedOptions based on the length of model.food
      selectedOptions = Map.fromIterable(
        mymodel.food!,
        key: (item) => mymodel.food!.indexOf(item),
        value: (item) => false,
      );
    });
  }

  TextEditingController searchTextController = TextEditingController();
  List<dynamic>? foodAllergies = [];
  bool textfiled = false;
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
            textfiled = false;
            foodAllergies =
                null; // Or clear the list or update the UI accordingly
          });
        } else {
          setState(() {
            foodAllergies = response.data['foodAllergies']!;
            print('Food Allergies: $foodAllergies');
          });
        }
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
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) async {
        mymodel = model;
        await initializeState();
      },
      builder: (context, model, child) {
        return model.foodLoader == true
            ? WholePageLoader()
            : SafeArea(
                top: false,
                bottom: false,
                child: Scaffold(
                  body: Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: PageHorizontalMargin(
                      widget: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 3.h,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Image.asset(ImageUtils.blackbackarrow),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                "Food Allergies ",
                                style: TextStyle(
                                  fontFamily: FontUtils.proxima,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color:
                                    const Color.fromRGBO(147, 153, 166, 0.09),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    textfiled = true;
                                    textfiled = value.isNotEmpty;
                                    searchFoodAllergies();
                                  });
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
                                      //searchFoodAllergies();
                                    },
                                    icon: const Icon(Icons.search),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          textfiled
                              ? foodAllergies != null
                                  ? Expanded(
                                      child: ListView.builder(
                                        itemCount: foodAllergies!.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            title: Text(
                                              '${foodAllergies![index]['name']}',
                                            ),
                                            trailing: Checkbox(
                                              value: selectedOptions[index] ??
                                                  false,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  selectedOptions[index] =
                                                      value ?? false;
                                                  if (value ?? false) {
                                                    selectedFoodNames.add(
                                                        foodAllergies![index]
                                                            ['name']);
                                                  } else {
                                                    selectedFoodNames.remove(
                                                        foodAllergies![index]
                                                            ['name']);
                                                  }
                                                });
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  : Container()
                              : Expanded(
                                  child: ListView.builder(
                                    itemCount: model.food?.length ?? 0,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        title: Text(
                                          '${model.food![index].name.toString()}',
                                        ),
                                        trailing: Checkbox(
                                          value:
                                              selectedOptions[index] ?? false,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              selectedOptions[index] =
                                                  value ?? false;
                                              if (value ?? false) {
                                                selectedFoodNames.add(model
                                                    .food![index].name
                                                    .toString());
                                              } else {
                                                selectedFoodNames.remove(
                                                    model.food![index].name);
                                              }
                                            });
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)),
                            ),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 400),
                              width: MediaQuery.of(context).size.width / 1,
                              height: 7.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: ColorUtils.tuple,
                              ),
                              child: MaterialButton(
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                onPressed: () {
                                  // Handle the selected food names based on selectedOptions
                                  print(
                                      'Selected Food Names: $selectedFoodNames');
                                  // Navigator.push(
                                  //   context,
                                  //   PageTransition(
                                  //     type: PageTransitionType.fade,
                                  //     child: EditUserProfileScreen2(),
                                  //   ),
                                  // );
                                },
                                child: Text(
                                  "Submit",
                                  style: TextStyle(
                                    fontFamily: FontUtils.interSemiBold,
                                    fontSize: 1.8.t,
                                    color: ColorUtils.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
