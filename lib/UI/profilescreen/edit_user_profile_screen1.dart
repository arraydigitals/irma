import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imraapp/UI/Facilities/select_county_screen.dart';
import 'package:imraapp/Utils/extensions.dart';
import 'package:imraapp/Utils/whole_loader.dart';
import 'package:imraapp/Widgets/bottom_navigation_bar.dart';
import 'package:imraapp/services/get/get_single_user.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/font_utils.dart';
import '../../Utils/image_utils.dart';
import '../../Utils/widget_loader.dart';
import '../../ViewModels/main_view_model.dart';
import '../../Widgets/custom_text_field.dart';
import '../../Widgets/customtextfield.dart';
import '../../Widgets/page_horizontal_margin.dart';
import '../../Widgets/text_widget.dart';
import '../../Widgets/textfiled_widget.dart';
import '../../app/locator.dart';
import '../../modules/dio_service.dart';
import '../../services/get/get_single_user.dart';
import 'edit_user_profile_screen2.dart';

class EditUserProfileScreen1 extends StatefulWidget {
  const EditUserProfileScreen1({Key? key}) : super(key: key);

  @override
  State<EditUserProfileScreen1> createState() => _EditUserProfileScreen1State();
}

class _EditUserProfileScreen1State extends State<EditUserProfileScreen1> {
  bool isLoading = false;
  File? _image; // This will hold the selected image file
  String userSelectedImage = '';
// Function to pick an image from the gallery or camera
  ImagePicker _imagePicker = ImagePicker();
  TextEditingController updatefullnameController = TextEditingController();
  TextEditingController updateemailController = TextEditingController();
  TextEditingController updatephoneController = TextEditingController();
  TextEditingController updatedateofbithController = TextEditingController();
  TextEditingController updateaddressController = TextEditingController();
  TextEditingController updatecountryController = TextEditingController();
  Future<void> updateUserProfile(
    String id, {
    String? phonenumber,
    String? date_of_birth,
    String? country,
    String? address,
    String? avatar,
  }) async {
    var dioService = DioService.getInstance();

    // Check if the widget is mounted before updating the state
    if (!mounted) return;

    setState(() {
      isLoading = true;
    });

    FormData profileFormData = FormData();

    // Add non-empty fields to the map
    Map<String, String?> fieldsToUpdate = {
      if (avatar != null && avatar.isNotEmpty) "avatar": avatar,
      if (phonenumber != null && phonenumber.isNotEmpty)
        "phonenumber": phonenumber,
      if (date_of_birth != null && date_of_birth.isNotEmpty)
        "date_of_birth": date_of_birth,
      if (country != null && country.isNotEmpty) "country": country,
      if (address != null && address.isNotEmpty) "address": address,
    };

    // Add fields to profileFormData
    for (var entry in fieldsToUpdate.entries) {
      if (entry.value != null) {
        profileFormData.fields.add(MapEntry(entry.key, entry.value!));
      }
    }

    try {
      final response = await dioService.patch(
        'userupdate/$id',
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "multipart/form-data",
          },
        ),
        data: profileFormData,
      );

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('User profile update successfully');
        }
        // Handle success if needed
      } else {
        if (kDebugMode) {
          print('Error: ${response.statusMessage}');
        }
        // Handle error response
      }
    } catch (e) {
      print('Error: $e');
      // Handle exceptions
    } finally {
      // Check if the widget is mounted before updating the state
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }
  // Future<void> updateUserProfile(
  //   String id, {
  //   //String? email,
  //   String? phonenumber,
  //   String? date_of_birth,
  //   String? country,
  //   String? address,
  //   String? avatar,
  // }) async {
  //   var dioService = DioService.getInstance();
  //   setState(() {
  //     isLoading = true;
  //   });

  //   FormData profileFormData = FormData();

  //   // Add non-empty fields to the map
  //   Map<String, String?> fieldsToUpdate = {
  //     if (avatar != null && avatar.isNotEmpty) "avatar": avatar,
  //     // if (email != null) "email": email,
  //     if (phonenumber != null && phonenumber.isNotEmpty)
  //       "phonenumber": phonenumber,
  //     if (date_of_birth != null && date_of_birth.isNotEmpty)
  //       "date_of_birth": date_of_birth,
  //     if (country != null && country.isNotEmpty) "country": country,
  //     if (address != null && address.isNotEmpty) "address": address,
  //   };

  //   // Add fields to profileFormData
  //   for (var entry in fieldsToUpdate.entries) {
  //     if (entry.value != null) {
  //       profileFormData.fields.add(MapEntry(entry.key, entry.value!));
  //     }
  //   }

  //   try {
  //     final response = await dioService.patch(
  //       'userupdate/$id',
  //       options: Options(
  //         headers: {
  //           HttpHeaders.contentTypeHeader: "multipart/form-data",
  //         },
  //       ),
  //       data: profileFormData,
  //     );

  //     if (response.statusCode == 200) {
  //       if (kDebugMode) {
  //         print('User profile update successfully');
  //       }
  //     } else {
  //       if (kDebugMode) {
  //         print('Error: ${response.statusMessage}');
  //       }
  //       // Handle error response
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //     // Handle exceptions
  //   } finally {
  //     setState(() {
  //       isLoading = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) async {
        // model.SingleUserData(context, model.prefService.userID.toString());
      },
      builder: (context, model, child) {
        return model.SingleUserLoader
            ? WholePageLoader()
            : SafeArea(
                top: false,
                bottom: false,
                child: Scaffold(
                  // backgroundColor: ColorUtils.tuple,
                  body: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: ColorUtils.tuple,
                        gradient:
                            LinearGradient(begin: Alignment.topCenter, colors: [
                          ColorUtils.tuple,
                          ColorUtils.tuple,
                          ColorUtils.tuple,
                          // Colors.orange,
                          // Colors.orange
                        ])),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 60,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            model.navigationService
                                                .navigateToUntil(
                                                    to: MyBottomNavBar());
                                          },
                                          child: Image.asset(ImageUtils.back)),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      TextWidget(
                                        textValue: "Edit Profile",
                                        fontFamily: FontUtils.interMedium,
                                        fontSize: 2.t,
                                        textColor: ColorUtils.white,
                                      ),
                                    ],
                                  ),
                                  //Image.asset(ImageUtils.edit),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30))),
                            child: PageHorizontalMargin(
                              widget: SingleChildScrollView(
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Stack(
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                              color: Colors.grey[50],
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            height: 100,
                                            width: 100,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                              child: userSelectedImage
                                                      .isNotEmpty
                                                  ? Image.file(
                                                      File(userSelectedImage),
                                                      fit: BoxFit.cover,
                                                    )
                                                  : const Icon(
                                                      Icons.person,
                                                      size: 40,
                                                      color: Colors.grey,
                                                    ),
                                            )
                                            //  model.prefService.userAvatar!
                                            //         .isNotEmpty
                                            //     ? ClipRRect(
                                            //         borderRadius:
                                            //             BorderRadius.circular(
                                            //                 50.0),
                                            //         child: Image.network(
                                            //             model.avatar.toString(),
                                            //             fit: BoxFit.cover),
                                            //       )

                                            //     : const Icon(
                                            //         Icons.person,
                                            //         size: 40,
                                            //         color: Colors.grey,
                                            //       ),
                                            // Display the selected image if available
                                            ),
                                        Positioned(
                                          top: 65,
                                          left: 57,
                                          child: InkWell(
                                            onTap: () {
                                              showImagePickerDialog(
                                                currentBuildContext: context,
                                                onImageSelection:
                                                    onImageSelection,
                                              );
                                            },
                                            child: Image.asset(
                                                ImageUtils.editprofile),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Image.asset(ImageUtils.editprofile),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    DefaultTabController(
                                        length: 2,
                                        child: Column(
                                          children: [
                                            TabBar(
                                                indicatorColor:
                                                    ColorUtils.tuple,
                                                labelPadding:
                                                    const EdgeInsets.only(
                                                        bottom: 8.0),
                                                indicatorPadding:
                                                    EdgeInsets.zero,
                                                // labelStyle: const TextStyle(
                                                //     fontSize: 16.0,
                                                //     fontWeight: FontWeight.bold),
                                                unselectedLabelStyle:
                                                    const TextStyle(
                                                        fontSize: 16.0),
                                                tabs: [
                                                  TextWidget(
                                                    textValue: "Personal Info",
                                                    fontFamily:
                                                        FontUtils.proxima,
                                                    fontSize: 2.3.t,
                                                    textColor: ColorUtils.tuple,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          PageTransition(
                                                              type:
                                                                  PageTransitionType
                                                                      .fade,
                                                              child:
                                                                  EditUserProfileScreen2()));
                                                    },
                                                    child: TextWidget(
                                                      textValue: "Medical Info",
                                                      fontFamily:
                                                          FontUtils.proxima,
                                                      fontSize: 2.3.t,
                                                      textColor:
                                                          ColorUtils.textcolor,
                                                    ),
                                                  ),
                                                ]),
                                          ],
                                        )),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Row(
                                      children: [
                                        TextWidget(
                                          textValue: "Date of Birth",
                                          fontFamily: FontUtils.proxima,
                                          fontSize: 2.3.t,
                                          textColor: ColorUtils.black,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: ColorUtils.silver1,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                      ),
                                      child: TextField(
                                        controller: updatedateofbithController,

                                        decoration: InputDecoration(
                                            hintText:
                                                model.datebirth!.toString(),
                                            //     '23 May, 1965',
                                            hintStyle: TextStyle(
                                                color: ColorUtils.black,
                                                fontFamily: FontUtils.proxima,
                                                fontSize: 16),
                                            contentPadding: EdgeInsets.only(
                                                left: 5.w,
                                                top: 2.h,
                                                right: 2.w,
                                                bottom: 3.h),
                                            //labelStyle: ,
                                            border: InputBorder.none),
                                        //enabled: false,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Row(
                                      children: [
                                        TextWidget(
                                          textValue: "Email Address",
                                          fontFamily: FontUtils.proxima,
                                          fontSize: 2.3.t,
                                          textColor: ColorUtils.black,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Container(
                                      // padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFF32C6C3)),
                                        //  color: ColorUtils.silver1,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                      ),
                                      child: TextField(
                                        controller: updateemailController,

                                        decoration: InputDecoration(
                                            hintText: model.email.toString(),
                                            //'davisschleifer@gmail.com|',
                                            hintStyle: TextStyle(
                                                color: ColorUtils.black,
                                                fontFamily: FontUtils.proxima,
                                                fontSize: 16),
                                            contentPadding: EdgeInsets.only(
                                                left: 5.w,
                                                top: 2.h,
                                                right: 2.w,
                                                bottom: 3.h),
                                            //labelStyle: ,
                                            border: InputBorder.none),
                                        //enabled: false,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Row(
                                      children: [
                                        TextWidget(
                                          textValue: "Phone",
                                          fontFamily: FontUtils.proxima,
                                          fontSize: 2.3.t,
                                          textColor: ColorUtils.black,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: ColorUtils.silver1,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                      ),
                                      child: TextField(
                                        controller: updatephoneController,

                                        decoration: InputDecoration(
                                            hintText: model.phone.toString(),
                                            //'+971 55 253 3541',
                                            hintStyle: TextStyle(
                                                color: ColorUtils.black,
                                                fontFamily: FontUtils.proxima,
                                                fontSize: 16),
                                            contentPadding: EdgeInsets.only(
                                                left: 5.w,
                                                top: 2.h,
                                                right: 2.w,
                                                bottom: 3.h),
                                            //labelStyle: ,
                                            border: InputBorder.none),
                                        //enabled: false,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Row(
                                      children: [
                                        TextWidget(
                                          textValue: "Country",
                                          fontFamily: FontUtils.proxima,
                                          fontSize: 2.3.t,
                                          textColor: ColorUtils.black,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(right: 15),
                                      decoration: BoxDecoration(
                                        color: ColorUtils.silver1,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              // height: 50,
                                              // width: 220,
                                              child: TextField(
                                                controller:
                                                    updatecountryController,

                                                decoration: InputDecoration(
                                                    hintText: model.country!
                                                        .toString(),
                                                    //'United Arab Emirates',
                                                    hintStyle: TextStyle(
                                                        color: ColorUtils.black,
                                                        fontFamily:
                                                            FontUtils.proxima,
                                                        fontSize: 16),
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                            left: 5.w,
                                                            top: 2.h,
                                                            right: 2.w,
                                                            bottom: 3.h),
                                                    //labelStyle: ,
                                                    border: InputBorder.none),
                                                //enabled: false,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              // Navigator.push(
                                              //     context,
                                              //     PageTransition(
                                              //         type: PageTransitionType.fade,
                                              //         child: SelectCountryScreen()));
                                            },
                                            child: Row(
                                              children: [
                                                // Image.asset(ImageUtils.flagimg),
                                                SizedBox(
                                                  width: 4.w,
                                                ),
                                                Image.asset(
                                                    ImageUtils.fowardicon)
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Row(
                                      children: [
                                        TextWidget(
                                          textValue: "Location",
                                          fontFamily: FontUtils.proxima,
                                          fontSize: 2.3.t,
                                          textColor: ColorUtils.black,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(right: 15),
                                      decoration: BoxDecoration(
                                        color: ColorUtils.silver1,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              // height: 50,
                                              // width: 220,
                                              child: TextField(
                                                controller:
                                                    updateaddressController,
                                                decoration: InputDecoration(
                                                    // label: Text(
                                                    //   model.loction!.toString(),
                                                    // ),
                                                    hintText: model.loction!
                                                        .toString(),
                                                    // 'University City.',
                                                    hintStyle: TextStyle(
                                                        color: ColorUtils.black,
                                                        fontFamily:
                                                            FontUtils.proxima,
                                                        fontSize: 16),
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                            left: 5.w,
                                                            top: 2.h,
                                                            right: 2.w,
                                                            bottom: 3.h),
                                                    //labelStyle: ,
                                                    border: InputBorder.none),
                                                //enabled: false,
                                              ),
                                            ),
                                          ),
                                          Image.asset(ImageUtils.loctionIcon),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25.0)),
                                      ),
                                      child: AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 400),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1,
                                        height: 7.h,
                                        //margin: EdgeInsets.symmetric(horizontal: 5.w),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: ColorUtils.tuple),
                                        child: MaterialButton(
                                            padding: EdgeInsets.zero,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                            onPressed: () {
                                              isLoading == true
                                                  ? () {}
                                                  : updateUserProfile(
                                                      model.prefService.userID
                                                          .toString(),
                                                      // email:
                                                      //     updateemailController
                                                      //         .text
                                                      //         .toString(),
                                                      phonenumber:
                                                          updatephoneController
                                                              .text
                                                              .toString(),
                                                      date_of_birth:
                                                          updatedateofbithController
                                                              .text
                                                              .toString(),
                                                      country:
                                                          updatecountryController
                                                              .text
                                                              .toString(),
                                                      address:
                                                          updateaddressController
                                                              .text
                                                              .toString(),
                                                      avatar: userSelectedImage,
                                                    );
                                              Navigator.pop(context);
                                            },
                                            child: isLoading == false
                                                ? Text(
                                                    "Save Change",
                                                    style: TextStyle(
                                                      fontFamily: FontUtils
                                                          .interSemiBold,
                                                      fontSize: 1.8.t,
                                                      color: ColorUtils.white,
                                                      // Color.fromRGBO(2, 104, 81, 1)
                                                    ),
                                                  )
                                                : WidgetLoader()),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }

  void onImageSelection(String imagePath) {
    setState(() {
      userSelectedImage = imagePath;
    });
  }

  _hide() {
    Navigator.pop(context);
  }

  showImagePickerDialog({
    required BuildContext currentBuildContext,
    required void Function(String imagePath) onImageSelection,
  }) async {
    await showDialog(
      context: currentBuildContext,
      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              color: Colors.grey, // Set your desired color
              padding: const EdgeInsets.all(16.0), // Adjust padding as needed
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      _getFromCamera(onImageSelection);
                    },
                    child: const Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.camera,
                            color: Colors.teal,
                          ),
                          title: Text('Camera'),
                        )
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _getFromGallery(onImageSelection);
                    },
                    child: const Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.image,
                            color: Colors.teal,
                          ),
                          title: Text('Gallery'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  _getFromGallery(void Function(String imagePath) onImageSelection) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      onImageSelection.call(image.path);
      _hide();
    }
  }

  _getFromCamera(void Function(String imagePath) onImageSelection) async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      onImageSelection.call(photo.path);
      _hide();
    }
  }
}
