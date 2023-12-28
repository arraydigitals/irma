import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imraapp/UI/createprofilescreen/my_routine_screen.dart';
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
import '../createprofilescreen/profile_screen1.dart';
import 'edit_user_profile_screen1.dart';
import 'newprofile screen.dart';
import 'user_profile_screen2.dart';

class UserProfileScreen1 extends StatelessWidget {
  const UserProfileScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) async {
        model.SingleUserData(context, model.prefService.userID.toString());
      },
      builder: (context, model, child) {
        return model.SingleUserLoader == true
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
                                  const EdgeInsets.only(left: 20, right: 20),
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
                                                child:
                                                    //ProfileScreen1()
                                                    const EditUserProfileScreen1()));
                                      },
                                      child: Image.asset(ImageUtils.edit)),
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
                                    const SizedBox(
                                      height: 30,
                                    ),
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
                                            ), // Display the selected image if available
                                    ),
                                    // Image.asset(ImageUtils.personimg),
                                    SizedBox(
                                      height: 1.5.h,
                                    ),
                                    TextWidget(
                                      textValue:
                                          model.prefService.userName.toString(),
                                      //"Davis Schleifer (58)",
                                      fontFamily: FontUtils.proxima,
                                      fontSize: 2.3.t,
                                      textColor: ColorUtils.black,
                                    ),
                                    SizedBox(
                                      height: 2.h,
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
                                                                  const newprofile()));
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
                                          textColor: ColorUtils.tuple,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Row(
                                      children: [
                                        TextWidget(
                                          textValue:
                                              model.datebirth!.toString(),
                                          // "23 May, 1965",
                                          fontFamily: FontUtils.proxima,
                                          fontSize: 2.3.t,
                                          textColor: ColorUtils.black1,
                                        ),
                                      ],
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
                                          textColor: ColorUtils.tuple,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Row(
                                      children: [
                                        TextWidget(
                                          textValue: model.prefService.userEmail
                                              .toString(),
                                          fontFamily: FontUtils.proxima,
                                          fontSize: 2.3.t,
                                          textColor: ColorUtils.black1,
                                        ),
                                      ],
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
                                          textColor: ColorUtils.tuple,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Row(
                                      children: [
                                        TextWidget(
                                          textValue: model.phone.toString(),
                                          //"+971 55 253 3541",
                                          fontFamily: FontUtils.proxima,
                                          fontSize: 2.3.t,
                                          textColor: ColorUtils.black1,
                                        ),
                                      ],
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
                                          textColor: ColorUtils.tuple,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextWidget(
                                          textValue: model.country!.toString(),
                                          // "United Arab Emirates",
                                          fontFamily: FontUtils.proxima,
                                          fontSize: 2.3.t,
                                          textColor: ColorUtils.black1,
                                        ),
                                        //Image.asset(ImageUtils.flagimg)
                                      ],
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
                                          textColor: ColorUtils.tuple,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextWidget(
                                            textValue:
                                                model.loction!.toString(),
                                            // "University City, University Street, Sharjah\nUnited Arab Emirates",
                                            fontFamily: FontUtils.proxima,
                                            fontSize: 2.3.t,
                                            textColor: ColorUtils.black1,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Container(
                                      //width: 90.w,
                                      //  height: 6.3.h,
                                      decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              68, 199, 176, 0.1),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: ListTile(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              PageTransition(
                                                  type: PageTransitionType.fade,
                                                  child:
                                                      const MyRoutineScreen()));
                                        },
                                        title: TextWidget(
                                          textValue: "My Routine",
                                          fontFamily: FontUtils.proxima,
                                          fontSize: 2.3.t,
                                          textColor: ColorUtils.tuple,
                                        ),
                                        trailing:
                                            Image.asset(ImageUtils.fowardicon),
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
