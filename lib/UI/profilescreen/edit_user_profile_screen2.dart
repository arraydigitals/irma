import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imraapp/Utils/extensions.dart';
import 'package:imraapp/Widgets/bottom_navigation_bar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/font_utils.dart';
import '../../Utils/image_utils.dart';
import '../../Utils/whole_loader.dart';
import '../../ViewModels/main_view_model.dart';
import '../../Widgets/custom_text_field.dart';
import '../../Widgets/customtextfield.dart';
import '../../Widgets/page_horizontal_margin.dart';
import '../../Widgets/text_widget.dart';
import '../../Widgets/textfiled_widget.dart';
import '../../app/locator.dart';
import '../Facilities/enter_medicxal_history_screen.dart';
import '../Facilities/food_allergies_screen.dart';
import '../Facilities/medication_history_screen.dart';
import 'edit_user_profile_screen1.dart';

class EditUserProfileScreen2 extends StatefulWidget {
  const EditUserProfileScreen2({Key? key}) : super(key: key);

  @override
  State<EditUserProfileScreen2> createState() => _EditUserProfileScreen2State();
}

class _EditUserProfileScreen2State extends State<EditUserProfileScreen2> {
  File? _image; // This will hold the selected image file

// Function to pick an image from the gallery or camera
  ImagePicker _imagePicker = ImagePicker();
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      print('this is image url ${_image} ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) async {
        await model.gettingMedicalhistory(context, model.userID.toString());
        await model.gettingMedicationhistory(context, model.userID.toString());
      },
      builder: (context, model, child) {
        return model.medicationhistoryLoader == true &&
                model.medicalhistoryLoader == true
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
                                      .navigateToUntil(to: MyBottomNavBar());
                                          },
                                          child: Image.asset(ImageUtils.back)),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      TextWidget(
                                        textValue: "Edit Profile ",
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
                            child: SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  // Image.asset(ImageUtils.editprofile),
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
                                        child: model.prefService.userAvatar!
                                                .isNotEmpty
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50.0),
                                                child: Image.network(
                                                    model.avatar.toString(),
                                                    fit: BoxFit.cover),
                                              )
                                            //: Image.asset(ImageUtils.personimg)
                                            : const Icon(
                                                Icons.person,
                                                size: 40,
                                                color: Colors.grey,
                                              ),
                                        // Display the selected image if available
                                      ),
                                      Positioned(
                                        top: 65,
                                        left: 57,
                                        child: InkWell(
                                          onTap: () {
                                            _pickImage(ImageSource.gallery);
                                          },
                                          child: Image.asset(
                                              ImageUtils.editprofile),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  DefaultTabController(
                                      length: 2,
                                      initialIndex: 1,
                                      child: Column(
                                        children: [
                                          TabBar(
                                              indicatorColor: ColorUtils.tuple,
                                              labelPadding:
                                                  const EdgeInsets.only(
                                                      bottom: 8.0),
                                              indicatorPadding: EdgeInsets.zero,
                                              // labelStyle: const TextStyle(
                                              //     fontSize: 16.0,
                                              //     fontWeight: FontWeight.bold),
                                              // unselectedLabelStyle: TextStyle(
                                              //     fontSize: 16.0,
                                              //     color: Colors.red),
                                              // unselectedLabelColor: Colors.red,
                                              tabs: [
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                EditUserProfileScreen1()));
                                                  },
                                                  child: TextWidget(
                                                    textValue: "Personal Info",
                                                    fontFamily:
                                                        FontUtils.proxima,
                                                    fontSize: 2.3.t,
                                                    textColor:
                                                        ColorUtils.textcolor,
                                                  ),
                                                ),
                                                TextWidget(
                                                  textValue: "Medical Info",
                                                  fontFamily: FontUtils.proxima,
                                                  fontSize: 2.3.t,
                                                  textColor: ColorUtils.tuple,
                                                ),
                                              ]),
                                        ],
                                      )),
                                  SizedBox(
                                    height: 4.h,
                                  ),

                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  SingleChildScrollView(
                                    child: PageHorizontalMargin(
                                      widget: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextWidget(
                                                textValue: "Medical History",
                                                fontFamily:
                                                    FontUtils.interSemiBold,
                                                fontSize: 2.t,
                                                textColor: ColorUtils.black,
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
                                                              EnterMedicxalHistoryScreen()));
                                                },
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      ImageUtils.plusicon,
                                                      fit: BoxFit.cover,
                                                      width: 5.w,
                                                      height: 5.w,
                                                    ),
                                                    SizedBox(
                                                      width: 2.w,
                                                    ),
                                                    TextWidget(
                                                      textValue: "Add More",
                                                      fontFamily:
                                                          FontUtils.proxima,
                                                      fontSize: 2.t,
                                                      textColor:
                                                          ColorUtils.bgcontiner,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          ListView.separated(
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                return Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 15,
                                                              bottom: 15),
                                                      // width: 90.w,
                                                      // height: 6.3.h,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: ColorUtils
                                                                  .grayf),
                                                          // color: ColorUtils.silver1,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15)),
                                                      child: ListTile(
                                                        onTap: () {},
                                                        leading: Container(
                                                          // padding: EdgeInsets.all(10),
                                                          height: 60,
                                                          width: 50,
                                                          decoration: BoxDecoration(
                                                              color: const Color
                                                                  .fromRGBO(
                                                                  50,
                                                                  198,
                                                                  195,
                                                                  0.3),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: Image.asset(
                                                              ImageUtils.doc),
                                                        ),
                                                        title: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      TextWidget(
                                                                    textValue: model
                                                                        .medicalhistory![
                                                                            index]
                                                                        .procedure
                                                                        .toString(),
                                                                    // "Compartment syndrome",
                                                                    fontFamily:
                                                                        FontUtils
                                                                            .proxima,
                                                                    fontSize:
                                                                        2.3.t,
                                                                    textColor:
                                                                        ColorUtils
                                                                            .black,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 5),
                                                              child: Row(
                                                                children: [
                                                                  // TextWidget(
                                                                  //   textValue: model
                                                                  //       .medicalhistory![
                                                                  //           index]
                                                                  //       .medCenter
                                                                  //       .toString(),
                                                                  //   //  "Seha Emirates Hospital",
                                                                  //   fontFamily:
                                                                  //       FontUtils
                                                                  //           .proxima,
                                                                  //   fontSize:
                                                                  //       2.t,
                                                                  //   textColor:
                                                                  //       ColorUtils
                                                                  //           .tuple,
                                                                  // ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 3),
                                                              child: Row(
                                                                children: [
                                                                  TextWidget(
                                                                    textValue: model
                                                                        .medicalhistory?[
                                                                            index]
                                                                        .date
                                                                        .toString(),
                                                                    //"25 Dec, 08:00PM",
                                                                    fontFamily:
                                                                        FontUtils
                                                                            .proxima,
                                                                    fontSize:
                                                                        2.t,
                                                                    textColor:
                                                                        ColorUtils
                                                                            .textcolor,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        trailing: Image.asset(
                                                            ImageUtils.more),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                              separatorBuilder:
                                                  (context, index) {
                                                return SizedBox(
                                                  height: 1.3.h,
                                                );
                                              },
                                              itemCount: model
                                                      .medicalhistory?.length ??
                                                  0),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),

                                  SingleChildScrollView(
                                    child: PageHorizontalMargin(
                                      widget: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextWidget(
                                                textValue: "Medication History",
                                                fontFamily:
                                                    FontUtils.interSemiBold,
                                                fontSize: 2.t,
                                                textColor: ColorUtils.black,
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
                                                              MedicationHistoryScreen()));
                                                },
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      ImageUtils.plusicon,
                                                      fit: BoxFit.cover,
                                                      width: 5.w,
                                                      height: 5.w,
                                                    ),
                                                    SizedBox(
                                                      width: 2.w,
                                                    ),
                                                    TextWidget(
                                                      textValue: "Add More",
                                                      fontFamily:
                                                          FontUtils.proxima,
                                                      fontSize: 2.t,
                                                      textColor:
                                                          ColorUtils.bgcontiner,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          ListView.separated(
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                return Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 15,
                                                              bottom: 15),
                                                      // width: 90.w,
                                                      // height: 6.3.h,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: ColorUtils
                                                                  .grayf),
                                                          // color: ColorUtils.silver1,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15)),
                                                      child: ListTile(
                                                        onTap: () {},
                                                        leading: Container(
                                                          // padding: EdgeInsets.all(10),
                                                          height: 60,
                                                          width: 50,
                                                          decoration: BoxDecoration(
                                                              color: const Color
                                                                  .fromRGBO(
                                                                  50,
                                                                  198,
                                                                  195,
                                                                  0.3),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: Image.asset(
                                                              ImageUtils
                                                                  .vector),
                                                        ),
                                                        title: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      TextWidget(
                                                                    textValue: model
                                                                        .medicationhistory![
                                                                            index]
                                                                        .medicine
                                                                        .toString(),
                                                                    //  "Compartment syndrome",
                                                                    fontFamily:
                                                                        FontUtils
                                                                            .proxima,
                                                                    fontSize:
                                                                        2.3.t,
                                                                    textColor:
                                                                        ColorUtils
                                                                            .black,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 5),
                                                              child: Row(
                                                                children: [
                                                                  TextWidget(
                                                                    textValue: model
                                                                        .medicationhistory![
                                                                            index]
                                                                        .prescribed
                                                                        .toString(),
                                                                    // "Seha Emirates Hospital",
                                                                    fontFamily:
                                                                        FontUtils
                                                                            .proxima,
                                                                    fontSize:
                                                                        2.2.t,
                                                                    textColor:
                                                                        ColorUtils
                                                                            .tuple,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 3),
                                                              child: Row(
                                                                children: [
                                                                  TextWidget(
                                                                    textValue: model
                                                                        .medicationhistory![
                                                                            index]
                                                                        .dateto
                                                                        .toString(),
                                                                    //  "25 Dec, 08:00PM",
                                                                    fontFamily:
                                                                        FontUtils
                                                                            .proxima,
                                                                    fontSize:
                                                                        2.t,
                                                                    textColor:
                                                                        ColorUtils
                                                                            .textcolor,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        trailing: Image.asset(
                                                            ImageUtils.more),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                              separatorBuilder:
                                                  (context, index) {
                                                return SizedBox(
                                                  height: 1.3.h,
                                                );
                                              },
                                              itemCount: model.medicationhistory
                                                      ?.length ??
                                                  0),
                                        ],
                                      ),
                                    ),
                                  ),

                                  PageHorizontalMargin(
                                    widget: Column(
                                      children: [
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextWidget(
                                              textValue: "Allergies",
                                              fontFamily:
                                                  FontUtils.interSemiBold,
                                              fontSize: 2.t,
                                              textColor: ColorUtils.black,
                                            ),
                                            // TextWidget(
                                            //     textValue: "Download",
                                            //     fontFamily: FontUtils.proxima,
                                            //     fontSize: 2.3.t,
                                            //     textColor: const Color.fromRGBO(
                                            //         152, 205, 91, 1)),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                PageTransition(
                                                    type:
                                                        PageTransitionType.fade,
                                                    child:
                                                        FoodAllergiesScreen()));
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextWidget(
                                                textValue: "Food Allergies",
                                                fontFamily:
                                                    FontUtils.interSemiBold,
                                                fontSize: 2.t,
                                                textColor: ColorUtils.tuple,
                                              ),
                                              Image.asset(ImageUtils.fowardicon)
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color:
                                                      const Color(0xFFF7F7F9)),
                                              child: InkWell(
                                                onTap: () {
                                                    model.navigationService
                                      .navigateToUntil(to: MyBottomNavBar());
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    TextWidget(
                                                      textValue: "Peanut",
                                                      fontFamily:
                                                          FontUtils.interMedium,
                                                      fontSize: 1.5.t,
                                                      textColor:
                                                          ColorUtils.black,
                                                    ),
                                                    SizedBox(
                                                      width: 3.w,
                                                    ),
                                                    Image.asset(
                                                        ImageUtils.cancelicon1),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                            Container(
                                              //  width: 15.w,
                                              // height: 8.w,
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color:
                                                      const Color(0xFFF7F7F9)),
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    TextWidget(
                                                      textValue: "Egg",
                                                      fontFamily:
                                                          FontUtils.interMedium,
                                                      fontSize: 1.5.t,
                                                      textColor:
                                                          ColorUtils.black,
                                                    ),
                                                    SizedBox(
                                                      width: 3.w,
                                                    ),
                                                    Image.asset(
                                                        ImageUtils.cancelicon1),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        const Divider(
                                          thickness: 1,
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextWidget(
                                              textValue: "Medical Allergies",
                                              fontFamily:
                                                  FontUtils.interSemiBold,
                                              fontSize: 2.t,
                                              textColor: ColorUtils.tuple,
                                            ),
                                            Image.asset(ImageUtils.fowardicon)
                                          ],
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: const Color(
                                                        0xFFF7F7F9)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    TextWidget(
                                                      textValue: "Sulfonamides",
                                                      fontFamily:
                                                          FontUtils.interMedium,
                                                      fontSize: 1.5.t,
                                                      textColor:
                                                          ColorUtils.black,
                                                    ),
                                                    SizedBox(
                                                      width: 6.w,
                                                    ),
                                                    Image.asset(
                                                        ImageUtils.cancelicon1),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                            Expanded(
                                              child: Container(
                                                // width: 15.w,
                                                // height: 8.w,
                                                padding:
                                                    const EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: const Color(
                                                        0xFFF7F7F9)),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: TextWidget(
                                                        textValue:
                                                            "Local Anesthetics",
                                                        fontFamily: FontUtils
                                                            .interMedium,
                                                        fontSize: 1.5.t,
                                                        textColor:
                                                            ColorUtils.black,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 3.w,
                                                    ),
                                                    Image.asset(
                                                        ImageUtils.cancelicon1),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
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
                                            duration: const Duration(
                                                milliseconds: 400),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
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
                                                      BorderRadius.circular(
                                                          25)),
                                              onPressed: () {
                                                // Navigator.push(
                                                //     context,
                                                //     PageTransition(
                                                //         type: PageTransitionType.fade,
                                                //         child: MyHomePage()));
                                              },
                                              child: Text(
                                                "Save Change",
                                                style: TextStyle(
                                                  fontFamily:
                                                      FontUtils.interSemiBold,
                                                  fontSize: 1.8.t,
                                                  color: ColorUtils.white,
                                                  // Color.fromRGBO(2, 104, 81, 1)
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(
                                    height: 6.h,
                                  ),
                                ],
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
}
