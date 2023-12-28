import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imraapp/UI/AuthScreen/login_screen.dart';
import 'package:imraapp/UI/Facilities/select_county_screen.dart';
import 'package:imraapp/UI/Home/location_screen.dart';
import 'package:imraapp/Utils/extensions.dart';
import 'package:imraapp/Utils/widget_loader.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/font_utils.dart';
import '../../Utils/image_utils.dart';
import '../../Utils/size_config.dart';
import '../../ViewModels/main_view_model.dart';
import '../../Widgets/custom_text_field.dart';
import '../../Widgets/customtextfield.dart';
import '../../Widgets/page_horizontal_margin.dart';
import '../../Widgets/text_widget.dart';
import '../../Widgets/textfiled_widget.dart';
import '../../app/locator.dart';
import '../../modules/dio_service.dart';
import '../Home/home_list_view_screen.dart';
import 'profile_screen2.dart';

class ProfileScreen1 extends StatefulWidget {
  String? selectedCountryName;
  String? selectedCountryImage;
  ProfileScreen1(
      {Key? key, this.selectedCountryImage, this.selectedCountryName})
      : super(key: key);

  @override
  State<ProfileScreen1> createState() => _ProfileScreen1State();
}

class _ProfileScreen1State extends State<ProfileScreen1> {
  File? _image; // This will hold the selected image file
  String userSelectedImage = '';
  bool isLoading = false;
  ImagePicker _imagePicker = ImagePicker();
  TextEditingController dateofbithController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  Future<void> createUserProfile(String id, String dateOfBirth, String country,
      String address, String avatarPath) async {
    var dioService = DioService.getInstance();
    setState(() {
      isLoading = true;
    });
    var profileFormData = FormData.fromMap({
      "date_of_birth": dateOfBirth,
      "country": country,
      "address": address,
      "avatar":
          await MultipartFile.fromFile(avatarPath, filename: userSelectedImage),
    });

    try {
      final response = await dioService.post(
        'create-profile/$id',
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "multipart/form-data",
          },
        ),
        data: profileFormData,
      );

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('User profile created successfully');
        }
        setState(() {
          isLoading = false;
          Navigator.push(
              context,
              PageTransition(type: PageTransitionType.fade, child: const Login()
                  //Login()

                  ));
        });
      } else {
        if (kDebugMode) {
          print('Error: ${response.statusMessage}');
        }
        // Handle error response
      }
    } catch (e) {
      print('Error: $e');
      // Handle exceptions
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {},
      builder: (context, model, child) {
        return SafeArea(
          top: false,
          bottom: false,
          child: Scaffold(
            // backgroundColor: ColorUtils.tuple,
            body: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: ColorUtils.tuple,
                  gradient: LinearGradient(begin: Alignment.topCenter, colors: [
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Image.asset(ImageUtils.logopic)],
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
                              const SizedBox(
                                height: 30,
                              ),

                              TextWidget(
                                textValue: "Create Profile",
                                fontFamily: FontUtils.interSemiBold,
                                fontSize: 2.2.t,
                                textColor: ColorUtils.black,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[50],
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    height: 100,
                                    width: 100,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50.0),
                                      child: userSelectedImage.isNotEmpty
                                          ? Image.file(
                                              File(
                                                userSelectedImage,
                                              ),
                                              fit: BoxFit.cover,
                                            )
                                          : const Icon(
                                              Icons.person,
                                              size: 40,
                                              color: Colors.grey,
                                            ),
                                    ),
                                    // : const Icon(
                                    //     Icons.person,
                                    //     size: 40,
                                    //     color: Colors.grey,
                                    //   ), // Display the selected image if available
                                  ),
                                  Positioned(
                                    top: 65,
                                    left: 69,
                                    child: InkWell(
                                      onTap: () {
                                        showImagePickerDialog(
                                          currentBuildContext: context,
                                          onImageSelection: onImageSelection,
                                        );
                                      },
                                      child: Image.asset(ImageUtils.plus),
                                    ),
                                  ),
                                ],
                              ),
                              // Stack(children: [
                              //   Container(
                              //     decoration: BoxDecoration(  color: Colors.grey[50],
                              //
                              //       borderRadius: BorderRadius.circular(50.0),
                              //     ),
                              //
                              //     height: 100,
                              //     width: 100,
                              //   ),
                              //   Positioned(
                              //       top: 65,
                              //       left: 69,
                              //       child: Image.asset(ImageUtils.plus)),
                              // ],),
                              SizedBox(
                                height: 3.h,
                              ),
                              // Image.asset(ImageUtils.profile),
                              SizedBox(
                                height: 3.h,
                              ),
                              Row(
                                children: [
                                  TextWidget(
                                    textValue: "Date of Birth",
                                    fontFamily: FontUtils.proxima,
                                    fontSize: 2.5.t,
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
                                  controller: dateofbithController,
                                  decoration: InputDecoration(
                                      hintText: '',
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
                              // CustomTextField(
                              //   controller: model.dateofbithController,
                              // ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                children: [
                                  TextWidget(
                                    textValue: "Country",
                                    fontFamily: FontUtils.proxima,
                                    fontSize: 2.5.t,
                                    textColor: ColorUtils.black,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: SelectCountryScreen()));
                                },
                                child: Container(
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
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 5.w,
                                                top: 3.h,
                                                right: 2.w,
                                                bottom: 3.h),
                                            child: widget.selectedCountryName !=
                                                    null
                                                ? Text(
                                                    '${widget.selectedCountryName.toString()}',
                                                    // Your text properties here
                                                  )
                                                : Text(
                                                    'Select a Country',
                                                    // Your default text properties here
                                                  ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(ImageUtils.fowardicon)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                children: [
                                  TextWidget(
                                    textValue: "Location",
                                    fontFamily: FontUtils.proxima,
                                    fontSize: 2.5.t,
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
                                          controller: addressController,
                                          decoration: InputDecoration(
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
                                    ),
                                    Image.asset(ImageUtils.loctionIcon),
                                  ],
                                ),
                              ),

                              SizedBox(
                                height: 4.h,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0)),
                                ),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 400),
                                  width: MediaQuery.of(context).size.width / 1,
                                  height: 7.h,
                                  //margin: EdgeInsets.symmetric(horizontal: 5.w),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: ColorUtils.tuple),
                                  child: MaterialButton(
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      onPressed: isLoading == true
                                          ? () {}
                                          : () async {
                                              await createUserProfile(
                                                  model.prefService.userID
                                                      .toString(),
                                                  dateofbithController.text
                                                      .toString(),
                                                  addressController.text
                                                      .toString(),
                                                  widget.selectedCountryName
                                                      .toString(),
                                                  userSelectedImage);

                                              //Navigator.pop(context);
                                            },
                                      child: isLoading == false
                                          ? Text(
                                              "Continue",
                                              style: TextStyle(
                                                fontFamily:
                                                    FontUtils.interSemiBold,
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
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType.fade,
                                              child: const ProfileScreen2()));
                                    },
                                    child: TextWidget(
                                      textValue: "Skip",
                                      fontFamily: FontUtils.interMedium,
                                      fontSize: 1.8.t,
                                      textColor: ColorUtils.tuple,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
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

  static Future<String> convertToBase64(String path) async {
    File file = File(path);
    List<int> fileBytes = await file.readAsBytes();
    String base64String = base64Encode(fileBytes);

    // final fileString = 'audio/mp3;base64,$base64String';

    return base64String;
  }
}
