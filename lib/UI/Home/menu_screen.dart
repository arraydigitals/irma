import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imraapp/UI/faqs_screen.dart';
import 'package:imraapp/UI/privacy_policy_scree.dart';
import 'package:imraapp/UI/term_condition_screen.dart';
import 'package:imraapp/Utils/extensions.dart';
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
import '../Facilities/saved_locations.dart';
import '../News/news_update_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
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
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                // Image.asset(ImageUtils.back),
                                // SizedBox(
                                //   width: 3.w,
                                // ),
                                TextWidget(
                                  textValue: "Menu",
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
                                height: 4.h,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: NewsUpdateScreen()));
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(ImageUtils.news),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        TextWidget(
                                          textValue: "News & Updates",
                                          fontFamily: FontUtils.interMedium,
                                          fontSize: 2.1.t,
                                          textColor: ColorUtils.black,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                            child: Image.asset(
                                                ImageUtils.fowardicon)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: SavedLocationScreen()));
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(ImageUtils.saved),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        TextWidget(
                                          textValue: "Saved Facilities",
                                          fontFamily: FontUtils.interMedium,
                                          fontSize: 2.1.t,
                                          textColor: ColorUtils.black,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                            child: Image.asset(
                                                ImageUtils.fowardicon)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: FaqsScreen()));
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(ImageUtils.faqs),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        TextWidget(
                                          textValue: "FAQ's ",
                                          fontFamily: FontUtils.interMedium,
                                          fontSize: 2.1.t,
                                          textColor: ColorUtils.black,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              // Navigator.push(
                                              //     context,
                                              //     PageTransition(
                                              //         type: PageTransitionType
                                              //             .fade,
                                              //         child: FaqsScreen()));
                                            },
                                            child: Image.asset(
                                                ImageUtils.fowardicon)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: PrivacyPolicyScreen()));
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(ImageUtils.privacy),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        TextWidget(
                                          textValue: "Privacy Policy",
                                          fontFamily: FontUtils.interMedium,
                                          fontSize: 2.1.t,
                                          textColor: ColorUtils.black,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                            child: Image.asset(
                                                ImageUtils.fowardicon)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: TermConditionScreen()));
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(ImageUtils.term),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        TextWidget(
                                          textValue: "Term & Conditions",
                                          fontFamily: FontUtils.interMedium,
                                          fontSize: 2.1.t,
                                          textColor: ColorUtils.black,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                            child: Image.asset(
                                                ImageUtils.fowardicon)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 29.h,
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
                                      color: const Color(0xFFF7F7F9)),
                                  child: MaterialButton(
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    onPressed: () {
                                      model.onLogout();
                                      // Navigator.push(
                                      //     context,
                                      //     PageTransition(
                                      //         type: PageTransitionType.fade,
                                      //         child: MyHomePage()));
                                    },
                                    child: Text(
                                      "logout",
                                      style: TextStyle(
                                        fontFamily: FontUtils.interSemiBold,
                                        fontSize: 1.8.t,
                                        color: ColorUtils.silver,
                                        // Color.fromRGBO(2, 104, 81, 1)
                                      ),
                                    ),
                                  ),
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
}

void _settingModalBottomSheet(context) {
  showModalBottomSheet(
      backgroundColor: Colors.grey,
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: 40.w,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: <Widget>[
              ListTile(
                  leading: SvgPicture.asset(ImageUtils.camera),
                  title: TextWidget(
                    textValue: "Open Camera",
                    fontFamily: FontUtils.proxima,
                    fontSize: 2.3.t,
                    textColor: ColorUtils.black,
                  ),
                  onTap: () => {}),
              // ignore: unnecessary_new
              ListTile(
                leading: SvgPicture.asset(ImageUtils.file),
                title: TextWidget(
                  textValue: "Browse File",
                  fontFamily: FontUtils.proxima,
                  fontSize: 2.3.t,
                  textColor: ColorUtils.black,
                ),
                onTap: () => {},
              ),
            ],
          ),
        );
      });
}
