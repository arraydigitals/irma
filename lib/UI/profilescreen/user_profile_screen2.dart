// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:imraapp/Utils/extensions.dart';
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
// import 'edit_user_profile_screen2.dart';
// import 'user_profile_screen1.dart';

// class UserProfileScreen2 extends StatelessWidget {
//   const UserProfileScreen2({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<MainViewModel>.reactive(
//       viewModelBuilder: () => locator<MainViewModel>(),
//       disposeViewModel: false,
//       onModelReady: (model) async {
//         // model.gettingMedicationhistory(
//         //     context, model.prefService.userID.toString());
//       },
//       builder: (context, model, child) {
//         return SafeArea(
//           top: false,
//           bottom: false,
//           child: Scaffold(
//             // backgroundColor: ColorUtils.tuple,
//             body: Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                   color: ColorUtils.tuple,
//                   gradient: LinearGradient(begin: Alignment.topCenter, colors: [
//                     ColorUtils.tuple,
//                     ColorUtils.tuple,
//                     ColorUtils.tuple,
//                     // Colors.orange,
//                     // Colors.orange
//                   ])),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   const SizedBox(
//                     height: 60,
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Padding(
//                         padding: const EdgeInsets.only(left: 20, right: 20),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 InkWell(
//                                     onTap: () {
//                                       Navigator.pop(context);
//                                     },
//                                     child: Image.asset(ImageUtils.back)),
//                                 SizedBox(
//                                   width: 3.w,
//                                 ),
//                                 TextWidget(
//                                   textValue: "My Profile",
//                                   fontFamily: FontUtils.interMedium,
//                                   fontSize: 2.t,
//                                   textColor: ColorUtils.white,
//                                 ),
//                               ],
//                             ),
//                             InkWell(
//                                 onTap: () {
//                                   Navigator.push(
//                                       context,
//                                       PageTransition(
//                                           type: PageTransitionType.fade,
//                                           child: const EditUserProfileScreen2()));
//                                 },
//                                 child: Image.asset(ImageUtils.edit)),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 50),
//                   Expanded(
//                     child: Column(
//                       children: [
//                         Container(
//                           decoration: const BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(30),
//                                   topRight: Radius.circular(30))),
//                           child: PageHorizontalMargin(
//                             widget: Column(
//                               children: <Widget>[
//                                 const SizedBox(
//                                   height: 30,
//                                 ),
//                                 Container(
//                                   decoration: BoxDecoration(
//                                     color: Colors.grey[50],
//                                     borderRadius: BorderRadius.circular(50.0),
//                                   ),
//                                   height: 100,
//                                   width: 100,
//                                   child:
//                                       model.prefService.userAvatar!.isNotEmpty
//                                           ? ClipRRect(
//                                               borderRadius:
//                                                   BorderRadius.circular(50.0),
//                                               child: Image.network(
//                                                   model.avatar.toString(),
//                                                   fit: BoxFit.cover),
//                                             )
//                                           : const Icon(
//                                               Icons.person,
//                                               size: 40,
//                                               color: Colors.grey,
//                                             ),
//                                   //     : Icon(
//                                   //   Icons.person,
//                                   //   size: 40,
//                                   //   color: Colors.grey,
//                                   // ), // Display the selected image if available
//                                 ),
//                                 //
//                                 SizedBox(
//                                   height: 1.5.h,
//                                 ),
//                                 TextWidget(
//                                   textValue:
//                                       model.prefService.userName.toString(),
//                                   //"Davis Schleifer (58)",
//                                   fontFamily: FontUtils.proxima,
//                                   fontSize: 2.3.t,
//                                   textColor: ColorUtils.black,
//                                 ),
//                                 SizedBox(
//                                   height: 2.h,
//                                 ),
//                                 DefaultTabController(
//                                     length: 2,
//                                     initialIndex: 1,
//                                     child: Column(
//                                       children: [
//                                         TabBar(
//                                             indicatorColor: ColorUtils.tuple,
//                                             labelPadding: const EdgeInsets.only(
//                                                 bottom: 8.0),
//                                             indicatorPadding: EdgeInsets.zero,
//                                             // labelStyle: const TextStyle(
//                                             //     fontSize: 16.0,
//                                             //     fontWeight: FontWeight.bold),
//                                             // unselectedLabelStyle: TextStyle(
//                                             //     fontSize: 16.0,
//                                             //     color: Colors.red),
//                                             // unselectedLabelColor: Colors.red,
//                                             tabs: [
//                                               InkWell(
//                                                 onTap: () {
//                                                   Navigator.push(
//                                                       context,
//                                                       PageTransition(
//                                                           type:
//                                                               PageTransitionType
//                                                                   .fade,
//                                                           child:
//                                                               const UserProfileScreen1()));
//                                                 },
//                                                 child: TextWidget(
//                                                   textValue: "Personal Info",
//                                                   fontFamily: FontUtils.proxima,
//                                                   fontSize: 2.3.t,
//                                                   textColor:
//                                                       ColorUtils.textcolor,
//                                                 ),
//                                               ),
//                                               TextWidget(
//                                                 textValue: "Medical Info",
//                                                 fontFamily: FontUtils.proxima,
//                                                 fontSize: 2.3.t,
//                                                 textColor: ColorUtils.tuple,
//                                               ),
//                                             ]),
//                                       ],
//                                     )),
//                                 SizedBox(
//                                   height: 1.h,
//                                 ),

//                                 Expanded(
//                                     child: Row(
//                                   children: [
//                                     PageHorizontalMargin(
//                                       widget: const Column(
//                                         children: [
//                                           Expanded(
//                                             child: Column(
//                                               children: [
                                                
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 )),

//                                 Container(
//                                   padding:
//                                       const EdgeInsets.only(top: 15, bottom: 15),
//                                   // width: 90.w,
//                                   // height: 6.3.h,
//                                   decoration: BoxDecoration(
//                                       border: Border.all(color: ColorUtils.grayf),
//                                       // color: ColorUtils.silver1,
//                                       borderRadius: BorderRadius.circular(15)),
//                                   child: ListTile(
//                                     onTap: () {},
//                                     leading: Container(
//                                       // padding: EdgeInsets.all(10),
//                                       height: 60,
//                                       width: 50,
//                                       decoration: BoxDecoration(
//                                           color: const Color.fromRGBO(
//                                               50, 198, 195, 0.3),
//                                           borderRadius:
//                                               BorderRadius.circular(10)),
//                                       child: Image.asset(ImageUtils.doc),
//                                     ),
//                                     title: Column(
//                                       children: [
//                                         Row(
//                                           children: [
//                                             Expanded(
//                                               child: TextWidget(
//                                                 textValue: "Compartment syndrome",
//                                                 fontFamily: FontUtils.proxima,
//                                                 fontSize: 2.3.t,
//                                                 textColor: ColorUtils.black,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.only(top: 5),
//                                           child: Row(
//                                             children: [
//                                               TextWidget(
//                                                 textValue:
//                                                     "Seha Emirates Hospital",
//                                                 fontFamily: FontUtils.proxima,
//                                                 fontSize: 2.2.t,
//                                                 textColor: ColorUtils.tuple,
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.only(top: 3),
//                                           child: Row(
//                                             children: [
//                                               TextWidget(
//                                                 textValue: "25 Dec, 08:00PM",
//                                                 fontFamily: FontUtils.proxima,
//                                                 fontSize: 2.t,
//                                                 textColor: ColorUtils.textcolor,
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     trailing: Image.asset(ImageUtils.more),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 4.h,
//                                 ),
//                                 // Row(
//                                 //   mainAxisAlignment:
//                                 //       MainAxisAlignment.spaceBetween,
//                                 //   children: [
//                                 //     TextWidget(
//                                 //       textValue: "Medication History",
//                                 //       fontFamily: FontUtils.interSemiBold,
//                                 //       fontSize: 2.t,
//                                 //       textColor: ColorUtils.black,
//                                 //     ),
//                                 //     TextWidget(
//                                 //         textValue: "Download",
//                                 //         fontFamily: FontUtils.proxima,
//                                 //         fontSize: 2.3.t,
//                                 //         textColor: const Color.fromRGBO(
//                                 //             152, 205, 91, 1)),
//                                 //   ],
//                                 // ),
//                                 // SizedBox(
//                                 //   height: 4.h,
//                                 // ),
//                                 // SizedBox(
//                                 //   height: 15.h,
//                                 //   child: GridView.builder(
//                                 //       itemCount: 4,
//                                 //       gridDelegate:
//                                 //           const SliverGridDelegateWithFixedCrossAxisCount(
//                                 //               crossAxisCount: 1,
//                                 //               crossAxisSpacing: 10.0,
//                                 //               mainAxisSpacing: 10.0,
//                                 //               //1.35
//                                 //               childAspectRatio: 3.2),
//                                 //       itemBuilder: (context, index) {
//                                 //         return Container(
//                                 //           padding: const EdgeInsets.only(
//                                 //               top: 15, bottom: 15),
//                                 //           // width: 90.w,
//                                 //           // height: 6.3.h,
//                                 //           decoration: BoxDecoration(
//                                 //               border: Border.all(
//                                 //                   color: ColorUtils.grayf),
//                                 //               // color: ColorUtils.silver1,
//                                 //               borderRadius:
//                                 //                   BorderRadius.circular(15)),
//                                 //           child: ListTile(
//                                 //             onTap: () {},
//                                 //             leading: Container(
//                                 //               // padding: EdgeInsets.all(10),
//                                 //               height: 60,
//                                 //               width: 50,
//                                 //               decoration: BoxDecoration(
//                                 //                   color: const Color.fromRGBO(
//                                 //                       50, 198, 195, 0.3),
//                                 //                   borderRadius:
//                                 //                       BorderRadius.circular(10)),
//                                 //               child:
//                                 //                   Image.asset(ImageUtils.vector),
//                                 //             ),
//                                 //             title: Column(
//                                 //               children: [
//                                 //                 Row(
//                                 //                   children: [
//                                 //                     Expanded(
//                                 //                       child: TextWidget(
//                                 //                         textValue: "Amoxicillin",
//                                 //                         fontFamily:
//                                 //                             FontUtils.proxima,
//                                 //                         fontSize: 2.3.t,
//                                 //                         textColor:
//                                 //                             ColorUtils.black,
//                                 //                       ),
//                                 //                     ),
//                                 //                   ],
//                                 //                 ),
//                                 //                 Padding(
//                                 //                   padding: const EdgeInsets.only(
//                                 //                       top: 5),
//                                 //                   child: Row(
//                                 //                     children: [
//                                 //                       TextWidget(
//                                 //                         textValue:
//                                 //                             "Dr. Zain Kenter",
//                                 //                         fontFamily:
//                                 //                             FontUtils.proxima,
//                                 //                         fontSize: 2.2.t,
//                                 //                         textColor:
//                                 //                             ColorUtils.tuple,
//                                 //                       ),
//                                 //                     ],
//                                 //                   ),
//                                 //                 ),
//                                 //                 Padding(
//                                 //                   padding: const EdgeInsets.only(
//                                 //                       top: 3),
//                                 //                   child: Row(
//                                 //                     children: [
//                                 //                       TextWidget(
//                                 //                         textValue:
//                                 //                             "25 May - 15 Jun",
//                                 //                         fontFamily:
//                                 //                             FontUtils.proxima,
//                                 //                         fontSize: 2.t,
//                                 //                         textColor:
//                                 //                             ColorUtils.textcolor,
//                                 //                       ),
//                                 //                     ],
//                                 //                   ),
//                                 //                 ),
//                                 //               ],
//                                 //             ),
//                                 //             trailing:
//                                 //                 Image.asset(ImageUtils.more),
//                                 //           ),
//                                 //         );
//                                 //       }),
//                                 // ),

//                                 // SizedBox(
//                                 //   height: 4.h,
//                                 // ),
//                                 // Container(
//                                 //   padding:
//                                 //       const EdgeInsets.only(top: 15, bottom: 15),
//                                 //   // width: 90.w,
//                                 //   // height: 6.3.h,
//                                 //   decoration: BoxDecoration(
//                                 //       border: Border.all(color: ColorUtils.grayf),
//                                 //       // color: ColorUtils.silver1,
//                                 //       borderRadius: BorderRadius.circular(15)),
//                                 //   child: ListTile(
//                                 //     onTap: () {},
//                                 //     leading: Container(
//                                 //       // padding: EdgeInsets.all(10),
//                                 //       height: 60,
//                                 //       width: 50,
//                                 //       decoration: BoxDecoration(
//                                 //           color: const Color.fromRGBO(
//                                 //               50, 198, 195, 0.3),
//                                 //           borderRadius:
//                                 //               BorderRadius.circular(10)),
//                                 //       child: Image.asset(ImageUtils.vector),
//                                 //     ),
//                                 //     title: Column(
//                                 //       children: [
//                                 //         Row(
//                                 //           children: [
//                                 //             Expanded(
//                                 //               child: TextWidget(
//                                 //                 textValue: "Tramadol",
//                                 //                 fontFamily: FontUtils.proxima,
//                                 //                 fontSize: 2.3.t,
//                                 //                 textColor: ColorUtils.black,
//                                 //               ),
//                                 //             ),
//                                 //           ],
//                                 //         ),
//                                 //         Padding(
//                                 //           padding: const EdgeInsets.only(top: 5),
//                                 //           child: Row(
//                                 //             children: [
//                                 //               TextWidget(
//                                 //                 textValue: "Dr.Wilson Bergson",
//                                 //                 fontFamily: FontUtils.proxima,
//                                 //                 fontSize: 2.2.t,
//                                 //                 textColor: ColorUtils.tuple,
//                                 //               ),
//                                 //             ],
//                                 //           ),
//                                 //         ),
//                                 //         Padding(
//                                 //           padding: const EdgeInsets.only(top: 3),
//                                 //           child: Row(
//                                 //             children: [
//                                 //               TextWidget(
//                                 //                 textValue: "25 Dec, 08:00PM",
//                                 //                 fontFamily: FontUtils.proxima,
//                                 //                 fontSize: 2.t,
//                                 //                 textColor: ColorUtils.textcolor,
//                                 //               ),
//                                 //             ],
//                                 //           ),
//                                 //         ),
//                                 //       ],
//                                 //     ),
//                                 //     trailing: Image.asset(ImageUtils.more),
//                                 //   ),
//                                 // ),
//                                 SizedBox(
//                                   height: 4.h,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     TextWidget(
//                                       textValue: "Allergies",
//                                       fontFamily: FontUtils.interSemiBold,
//                                       fontSize: 2.t,
//                                       textColor: ColorUtils.black,
//                                     ),
//                                     TextWidget(
//                                         textValue: "Download",
//                                         fontFamily: FontUtils.proxima,
//                                         fontSize: 2.3.t,
//                                         textColor: const Color.fromRGBO(
//                                             152, 205, 91, 1)),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 4.h,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     TextWidget(
//                                       textValue: "Food Allergies",
//                                       fontFamily: FontUtils.interSemiBold,
//                                       fontSize: 2.t,
//                                       textColor: ColorUtils.tuple,
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 4.h,
//                                 ),
//                                 Row(
//                                   children: [
//                                     Container(
//                                       padding: const EdgeInsets.all(10),
//                                       decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                           color: const Color(0xFFF7F7F9)),
//                                       child: TextWidget(
//                                         textValue: "Peanut",
//                                         fontFamily: FontUtils.interSemiBold,
//                                         fontSize: 2.t,
//                                         textColor: ColorUtils.black,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 3.w,
//                                     ),
//                                     Container(
//                                       //  width: 15.w,
//                                       // height: 8.w,
//                                       padding: const EdgeInsets.all(10),
//                                       decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                           color: const Color(0xFFF7F7F9)),
//                                       child: Center(
//                                         child: TextWidget(
//                                           textValue: "Egg",
//                                           fontFamily: FontUtils.interSemiBold,
//                                           fontSize: 2.t,
//                                           textColor: ColorUtils.black,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 2.h,
//                                 ),
//                                 const Divider(
//                                   thickness: 1,
//                                 ),
//                                 SizedBox(
//                                   height: 3.h,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     TextWidget(
//                                       textValue: "Medical Allergies",
//                                       fontFamily: FontUtils.interSemiBold,
//                                       fontSize: 2.t,
//                                       textColor: ColorUtils.tuple,
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 2.h,
//                                 ),
//                                 Row(
//                                   children: [
//                                     Container(
//                                       padding: const EdgeInsets.all(10),
//                                       decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                           color: const Color(0xFFF7F7F9)),
//                                       child: TextWidget(
//                                         textValue: "Sulfonamides",
//                                         fontFamily: FontUtils.interSemiBold,
//                                         fontSize: 2.t,
//                                         textColor: ColorUtils.black,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 3.w,
//                                     ),
//                                     Container(
//                                       // width: 15.w,
//                                       // height: 8.w,
//                                       padding: const EdgeInsets.all(10),
//                                       decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                           color: const Color(0xFFF7F7F9)),
//                                       child: Center(
//                                         child: TextWidget(
//                                           textValue: "Local Anesthetics",
//                                           fontFamily: FontUtils.interSemiBold,
//                                           fontSize: 2.t,
//                                           textColor: ColorUtils.black,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 6.h,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
