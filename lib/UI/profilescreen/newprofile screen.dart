import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imraapp/Utils/extensions.dart';
import 'package:imraapp/Utils/whole_loader.dart';
import 'package:imraapp/Widgets/bottom_navigation_bar.dart';
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
import 'edit_user_profile_screen2.dart';
import 'user_profile_screen1.dart';

class newprofile extends StatelessWidget {
  const newprofile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) async {
        model.gettingMedicalhistory(
            context, model.userID.toString());
        model.gettingMedicationhistory(
            context, model.userID.toString());
      },
      builder: (context, model, child) {
        return model.medicationhistoryLoader == true &&
                model.medicalhistoryLoader == true
            ? WholePageLoader()
            : SafeArea(
                top: false,
                bottom: false,
                child: Scaffold(
                    backgroundColor: ColorUtils.tuple,
                    body: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 1.h,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      textValue: "My Profile",
                                      fontFamily: FontUtils.interMedium,
                                      fontSize: 2.t,
                                      textColor: ColorUtils.white,
                                    ),
                                  ],
                                ),
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType.fade,
                                              child: EditUserProfileScreen2()));
                                    },
                                    child: Image.asset(ImageUtils.edit)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Container(
                            width: double.infinity,
                            height: 300.h,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30))),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 4.h,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[50],
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  height: 100,
                                  width: 100,
                                  child:
                                      model.prefService.userAvatar!.isNotEmpty
                                          ? ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                              child: Image.network(
                                                  model.avatar.toString(),
                                                  fit: BoxFit.cover),
                                            )
                                          : const Icon(
                                              Icons.person,
                                              size: 40,
                                              color: Colors.grey,
                                            ),

                                  //     Icon(
                                  //   Icons.person,
                                  //   size: 40,
                                  //   color: Colors.grey,
                                  // ), // Display the selected image if available
                                ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                TextWidget(
                                  textValue: model.prefService.userName.toString(),
                                  // "Davis Schleifer (58)",
                                  fontFamily: FontUtils.proxima,
                                  fontSize: 2.3.t,
                                  textColor: ColorUtils.black,
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
                                            labelPadding: const EdgeInsets.only(
                                                bottom: 8.0),
                                            indicatorPadding: EdgeInsets.zero,
                                            // labelStyle: const TextStyle(
                                            //     fontSize: 16.0,
                                            //     fontWeight: FontWeight.bold),
                                            unselectedLabelStyle:
                                                const TextStyle(fontSize: 16.0),
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
                                                              UserProfileScreen1()));
                                                },
                                                child: TextWidget(
                                                  textValue: "Personal Info",
                                                  fontFamily: FontUtils.proxima,
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
                                              textValue: "Medical History ",
                                              fontFamily:
                                                  FontUtils.interSemiBold,
                                              fontSize: 2.t,
                                              textColor: ColorUtils.black,
                                            ),
                                            TextWidget(
                                                textValue: "Download",
                                                fontFamily: FontUtils.proxima,
                                                fontSize: 2.3.t,
                                                textColor: const Color.fromRGBO(
                                                    152, 205, 91, 1)),
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
                                                                .circular(15)),
                                                    child: ListTile(
                                                      onTap: () {},
                                                      leading: Container(
                                                        // padding: EdgeInsets.all(10),
                                                        height: 60,
                                                        width: 50,
                                                        decoration: BoxDecoration(
                                                            color: const Color
                                                                .fromRGBO(50,
                                                                198, 195, 0.3),
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
                                                                Expanded(
                                                                  child:
                                                                      TextWidget(
                                                                    textValue: model
                                                                        .medicalhistory![
                                                                            index]
                                                                        .medCenter
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
                                                                      .medicalhistory![
                                                                          index]
                                                                      .date
                                                                      .toString(),
                                                                  //"25 Dec, 08:00PM",
                                                                  fontFamily:
                                                                      FontUtils
                                                                          .proxima,
                                                                  fontSize: 2.t,
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
                                            separatorBuilder: (context, index) {
                                              return SizedBox(
                                                height: 1.3.h,
                                              );
                                            },
                                            itemCount:
                                                model.medicalhistory?.length ??
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
                                              textValue: "Medication History ",
                                              fontFamily:
                                                  FontUtils.interSemiBold,
                                              fontSize: 2.t,
                                              textColor: ColorUtils.black,
                                            ),
                                            TextWidget(
                                                textValue: "Download",
                                                fontFamily: FontUtils.proxima,
                                                fontSize: 2.3.t,
                                                textColor: const Color.fromRGBO(
                                                    152, 205, 91, 1)),
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
                                                                .circular(15)),
                                                    child: ListTile(
                                                      onTap: () {},
                                                      leading: Container(
                                                        // padding: EdgeInsets.all(10),
                                                        height: 60,
                                                        width: 50,
                                                        decoration: BoxDecoration(
                                                            color: const Color
                                                                .fromRGBO(50,
                                                                198, 195, 0.3),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        child: Image.asset(
                                                            ImageUtils.vector),
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
                                                                  // "25 Dec, 08:00PM",
                                                                  fontFamily:
                                                                      FontUtils
                                                                          .proxima,
                                                                  fontSize: 2.t,
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
                                            separatorBuilder: (context, index) {
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
                                SizedBox(
                                  height: 3.h,
                                ),
                                PageHorizontalMargin(
                                  widget: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextWidget(
                                            textValue: "Food Allergies",
                                            fontFamily: FontUtils.interSemiBold,
                                            fontSize: 2.t,
                                            textColor: ColorUtils.tuple,
                                          ),
                                        ],
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
                                                color: const Color(0xFFF7F7F9)),
                                            child: TextWidget(
                                              textValue: "Peanut",
                                              fontFamily:
                                                  FontUtils.interSemiBold,
                                              fontSize: 2.t,
                                              textColor: ColorUtils.black,
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
                                                color: const Color(0xFFF7F7F9)),
                                            child: Center(
                                              child: TextWidget(
                                                textValue: "Egg",
                                                fontFamily:
                                                    FontUtils.interSemiBold,
                                                fontSize: 2.t,
                                                textColor: ColorUtils.black,
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
                                            fontFamily: FontUtils.interSemiBold,
                                            fontSize: 2.t,
                                            textColor: ColorUtils.tuple,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: const Color(0xFFF7F7F9)),
                                            child: TextWidget(
                                              textValue: "Sulfonamides",
                                              fontFamily:
                                                  FontUtils.interSemiBold,
                                              fontSize: 2.t,
                                              textColor: ColorUtils.black,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 3.w,
                                          ),
                                          Container(
                                            // width: 15.w,
                                            // height: 8.w,
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: const Color(0xFFF7F7F9)),
                                            child: Center(
                                              child: TextWidget(
                                                textValue: "Local Anesthetics",
                                                fontFamily:
                                                    FontUtils.interSemiBold,
                                                fontSize: 2.t,
                                                textColor: ColorUtils.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              );
      },
    );
  }
}

// import 'package:expand_tap_area/expand_tap_area.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:imraapp/App/locator.dart';
// import 'package:imraapp/Utils/extensions.dart';
// import 'package:imraapp/Utils/image_utils.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:stacked/stacked.dart';

// import '../../Utils/color_utils.dart';
// import '../../Utils/font_utils.dart';
// import '../../ViewModels/main_view_model.dart';
// import '../../Widgets/bottom_navigation_bar.dart';
// import '../../Widgets/page_horizontal_margin.dart';
// import '../../Widgets/text_widget.dart';

// class newprofile extends StatefulWidget {
//   const newprofile({Key? key}) : super(key: key);

//   @override
//   State<newprofile> createState() => _newprofileState();
// }

// class _newprofileState extends State<newprofile> {
//   int selectedTabIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<MainViewModel>.reactive(
//       viewModelBuilder: () => locator<MainViewModel>(),
//       disposeViewModel: false,
//       onViewModelReady: (model) async {},
//       builder: (context, model, child) {
//         return SafeArea(
//           child: Scaffold(
//             backgroundColor: Colors.white,
//             body: Column(
//               children: [
//                 Column(
//                   children: [
//                     SizedBox(
//                       height: context.getPadding().top,
//                       child: Padding(
//                         padding: EdgeInsets.only(left: 10),
//                         child: Row(
//                           children: [
//                             ExpandTapWidget(
//                               onTap: () {
//                                 model.navigationService
//                                     .navigateToUntil(to: MyBottomNavBar());
//                                 //Navigator.pop(context);
//                               },
//                               tapPadding: EdgeInsets.all(50),
//                               child: SvgPicture.asset(ImageUtils.backArrowRed),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.only(left: 4.w),
//                               child: TextWidget(
//                                 textValue: "Appointment",
//                                 fontFamily: FontUtils.interSemiBold,
//                                 fontSize: 2.t,
//                                 textColor: ColorUtils.red,
//                               ),
//                             ),
//                             SizedBox(
//                               width: 2.w,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     //TopMarginHome(),
//                   ],
//                 ),
//                 Expanded(
//                   child: PageHorizontalMargin(
//                     widget: Column(
//                       children: [
//                         Expanded(
//                           child: SingleChildScrollView(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 SizedBox(
//                                   height: 3.h,
//                                 ),
//                                 TextWidget(
//                                   textValue: "Doctor Appointment",
//                                   textColor: ColorUtils.blackShade,
//                                   fontFamily: FontUtils.interMedium,
//                                   fontSize: 1.9.t,
//                                 ),
//                                 SizedBox(
//                                   height: 3.h,
//                                 ),
//                                 ListView.separated(
//                                     shrinkWrap: true,
//                                     physics: NeverScrollableScrollPhysics(),
//                                     itemBuilder: (context, index) {
//                                       return Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Container(
//                                             padding: const EdgeInsets.only(
//                                                 top: 15, bottom: 15),
//                                             // width: 90.w,
//                                             // height: 6.3.h,
//                                             decoration: BoxDecoration(
//                                                 border: Border.all(
//                                                     color: ColorUtils.grayf),
//                                                 // color: ColorUtils.silver1,
//                                                 borderRadius:
//                                                     BorderRadius.circular(15)),
//                                             child: ListTile(
//                                               onTap: () {},
//                                               leading: Container(
//                                                 // padding: EdgeInsets.all(10),
//                                                 height: 60,
//                                                 width: 50,
//                                                 decoration: BoxDecoration(
//                                                     color: const Color.fromRGBO(
//                                                         50, 198, 195, 0.3),
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             10)),
//                                                 child:
//                                                     Image.asset(ImageUtils.doc),
//                                               ),
//                                               title: Column(
//                                                 children: [
//                                                   Row(
//                                                     children: [
//                                                       Expanded(
//                                                         child: TextWidget(
//                                                           textValue:
//                                                               "Compartment syndrome",
//                                                           fontFamily:
//                                                               FontUtils.proxima,
//                                                           fontSize: 2.3.t,
//                                                           textColor:
//                                                               ColorUtils.black,
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                   Padding(
//                                                     padding:
//                                                         const EdgeInsets.only(
//                                                             top: 5),
//                                                     child: Row(
//                                                       children: [
//                                                         TextWidget(
//                                                           textValue:
//                                                               "Seha Emirates Hospital",
//                                                           fontFamily:
//                                                               FontUtils.proxima,
//                                                           fontSize: 2.2.t,
//                                                           textColor:
//                                                               ColorUtils.tuple,
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                   Padding(
//                                                     padding:
//                                                         const EdgeInsets.only(
//                                                             top: 3),
//                                                     child: Row(
//                                                       children: [
//                                                         TextWidget(
//                                                           textValue:
//                                                               "25 Dec, 08:00PM",
//                                                           fontFamily:
//                                                               FontUtils.proxima,
//                                                           fontSize: 2.t,
//                                                           textColor: ColorUtils
//                                                               .textcolor,
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               trailing:
//                                                   Image.asset(ImageUtils.more),
//                                             ),
//                                           ),
//                                         ],
//                                       );
//                                     },
//                                     separatorBuilder: (context, index) {
//                                       return Divider();
//                                     },
//                                     itemCount: 4),
//                                 SizedBox(
//                                   height: 3.h,
//                                 ),
//                                 TextWidget(
//                                   textValue: "Lab Appointment",
//                                   textColor: ColorUtils.blackShade,
//                                   fontFamily: FontUtils.interMedium,
//                                   fontSize: 1.9.t,
//                                 ),
//                                 ListView.separated(
//                                     shrinkWrap: true,
//                                     physics: NeverScrollableScrollPhysics(),
//                                     itemBuilder: (context, index) {
//                                       return Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Container(
//                                             padding: const EdgeInsets.only(
//                                                 top: 15, bottom: 15),
//                                             // width: 90.w,
//                                             // height: 6.3.h,
//                                             decoration: BoxDecoration(
//                                                 border: Border.all(
//                                                     color: ColorUtils.grayf),
//                                                 // color: ColorUtils.silver1,
//                                                 borderRadius:
//                                                     BorderRadius.circular(15)),
//                                             child: ListTile(
//                                               onTap: () {},
//                                               leading: Container(
//                                                 // padding: EdgeInsets.all(10),
//                                                 height: 60,
//                                                 width: 50,
//                                                 decoration: BoxDecoration(
//                                                     color: const Color.fromRGBO(
//                                                         50, 198, 195, 0.3),
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             10)),
//                                                 child:
//                                                     Image.asset(ImageUtils.doc),
//                                               ),
//                                               title: Column(
//                                                 children: [
//                                                   Row(
//                                                     children: [
//                                                       Expanded(
//                                                         child: TextWidget(
//                                                           textValue:
//                                                               "Compartment syndrome",
//                                                           fontFamily:
//                                                               FontUtils.proxima,
//                                                           fontSize: 2.3.t,
//                                                           textColor:
//                                                               ColorUtils.black,
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                   Padding(
//                                                     padding:
//                                                         const EdgeInsets.only(
//                                                             top: 5),
//                                                     child: Row(
//                                                       children: [
//                                                         TextWidget(
//                                                           textValue:
//                                                               "Seha Emirates Hospital",
//                                                           fontFamily:
//                                                               FontUtils.proxima,
//                                                           fontSize: 2.2.t,
//                                                           textColor:
//                                                               ColorUtils.tuple,
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                   Padding(
//                                                     padding:
//                                                         const EdgeInsets.only(
//                                                             top: 3),
//                                                     child: Row(
//                                                       children: [
//                                                         TextWidget(
//                                                           textValue:
//                                                               "25 Dec, 08:00PM",
//                                                           fontFamily:
//                                                               FontUtils.proxima,
//                                                           fontSize: 2.t,
//                                                           textColor: ColorUtils
//                                                               .textcolor,
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               trailing:
//                                                   Image.asset(ImageUtils.more),
//                                             ),
//                                           ),
//                                         ],
//                                       );
//                                     },
//                                     separatorBuilder: (context, index) {
//                                       return Divider();
//                                     },
//                                     itemCount: 4),
//                               ],
//                             ),
//                           ),
//                           // SingleChildScrollView(
//                           //   child: Column(
//                           //     crossAxisAlignment: CrossAxisAlignment.start,
//                           //     children: [
//                           //       SizedBox(
//                           //         height: 3.h,
//                           //       ),
//                           //       TextWidget(
//                           //         textValue: "Doctor Appointment",
//                           //         textColor: ColorUtils.blackShade,
//                           //         fontFamily: FontUtils.interMedium,
//                           //         fontSize: 1.9.t,
//                           //       ),
//                           //       SizedBox(
//                           //         height: 3.h,
//                           //       ),
//                           //       TextWidget(
//                           //         textValue: "Pharmacy Order",
//                           //         textColor: ColorUtils.blackShade,
//                           //         fontFamily: FontUtils.interMedium,
//                           //         fontSize: 1.9.t,
//                           //       ),
//                           //       SizedBox(
//                           //         height: 3.h,
//                           //       ),
//                           //     ],
//                           //   ),
//                           // ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
