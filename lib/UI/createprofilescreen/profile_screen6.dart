import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
import 'proflie_screen7.dart';

class ProfileScreen6 extends StatelessWidget {
  const ProfileScreen6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) async {
        model.gettingQuestion(context);
      },
      builder: (context, model, child) {
        return model.questionLoader
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
                                widget: Column(
                                  children: [
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextWidget(
                                          textValue: "My Routine",
                                          fontFamily: FontUtils.interSemiBold,
                                          fontSize: 2.2.t,
                                          textColor: ColorUtils.black,
                                        ),
                                        TextWidget(
                                          textValue: "02",
                                          fontFamily: FontUtils.interMedium,
                                          fontSize: 1.8.t,
                                          textColor: ColorUtils.tuple,
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                          itemCount: 1,
                                          itemBuilder: (context, index) {
                                            //final List<String> answers = List.from();
                                            final question = model.question![1];
                                            final List<String>? answers =
                                                question.answers;
                                            return Column(
                                              children: [
                                                SizedBox(
                                                  height: 4.h,
                                                ),
                                                Row(
                                                  children: [
                                                    TextWidget(
                                                      textValue:
                                                          question.questionText,
                                                      // "Do you exerciese?",
                                                      fontFamily:
                                                          FontUtils.interMedium,
                                                      fontSize: 2.t,
                                                      textColor:
                                                          ColorUtils.black,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 4.h,
                                                ),
                                                Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                25.0)),
                                                  ),
                                                  child: AnimatedContainer(
                                                    duration: const Duration(
                                                        milliseconds: 400),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            1,
                                                    height: 6.h,
                                                    //margin: EdgeInsets.symmetric(horizontal: 5.w),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: const Color
                                                              .fromRGBO(
                                                              68, 199, 176, 1)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color:
                                                          const Color.fromRGBO(
                                                              68,
                                                              199,
                                                              176,
                                                              0.1),
                                                    ),
                                                    child: MaterialButton(
                                                      padding: EdgeInsets.zero,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25)),
                                                      onPressed: () {
                                                        // Navigator.push(
                                                        //     context,
                                                        //     PageTransition(
                                                        //         type: PageTransitionType.fade,
                                                        //         child: MyHomePage()));
                                                      },
                                                      child: Text(
                                                        answers![0].toString(),
                                                        // "Regular",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              FontUtils.proxima,
                                                          fontSize: 1.8.t,
                                                          color:
                                                              ColorUtils.tuple,
                                                          // Color.fromRGBO(2, 104, 81, 1)
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 2.h,
                                                ),
                                                Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                25.0)),
                                                  ),
                                                  child: AnimatedContainer(
                                                    duration: const Duration(
                                                        milliseconds: 400),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            1,
                                                    height: 6.h,
                                                    //margin: EdgeInsets.symmetric(horizontal: 5.w),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: ColorUtils
                                                              .silver1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: MaterialButton(
                                                      padding: EdgeInsets.zero,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25)),
                                                      onPressed: () {
                                                        // Navigator.push(
                                                        //     context,
                                                        //     PageTransition(
                                                        //         type: PageTransitionType.fade,
                                                        //         child: MyHomePage()));
                                                      },
                                                      child: Text(
                                                        answers[1].toString(),

                                                        // "Once a Week",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              FontUtils.proxima,
                                                          fontSize: 1.8.t,
                                                          color: ColorUtils
                                                              .textcolor,
                                                          // Color.fromRGBO(2, 104, 81, 1)
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 2.h,
                                                ),
                                                Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                25.0)),
                                                  ),
                                                  child: AnimatedContainer(
                                                    duration: const Duration(
                                                        milliseconds: 400),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            1,
                                                    height: 6.h,
                                                    //margin: EdgeInsets.symmetric(horizontal: 5.w),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: ColorUtils
                                                              .silver1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      // color:
                                                      //     const Color.fromRGBO(68, 199, 176, 0.1),
                                                    ),
                                                    child: MaterialButton(
                                                      padding: EdgeInsets.zero,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25)),
                                                      onPressed: () {
                                                        // Navigator.push(
                                                        //     context,
                                                        //     PageTransition(
                                                        //         type: PageTransitionType.fade,
                                                        //         child: MyHomePage()));
                                                      },
                                                      child: Text(
                                                        answers[2].toString(),
                                                        // "Never",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              FontUtils.proxima,
                                                          fontSize: 1.8.t,
                                                          color: ColorUtils
                                                              .textcolor,
                                                          // Color.fromRGBO(2, 104, 81, 1)
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                25.0)),
                                                  ),
                                                  child: AnimatedContainer(
                                                    duration: const Duration(
                                                        milliseconds: 400),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            1,
                                                    height: 7.h,
                                                    //margin: EdgeInsets.symmetric(horizontal: 5.w),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        color:
                                                            ColorUtils.tuple),
                                                    child: MaterialButton(
                                                      padding: EdgeInsets.zero,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25)),
                                                      onPressed: () {
                                                        Navigator.push(
                                                            context,
                                                            PageTransition(
                                                                type:
                                                                    PageTransitionType
                                                                        .fade,
                                                                child:
                                                                    ProfileScreen7()));
                                                      },
                                                      child: Text(
                                                        "Next",
                                                        style: TextStyle(
                                                          fontFamily: FontUtils
                                                              .interSemiBold,
                                                          fontSize: 1.8.t,
                                                          color:
                                                              ColorUtils.white,
                                                          // Color.fromRGBO(2, 104, 81, 1)
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            PageTransition(
                                                                type:
                                                                    PageTransitionType
                                                                        .fade,
                                                                child:
                                                                    ProfileScreen7()));
                                                      },
                                                      child: TextWidget(
                                                        textValue: "Skip",
                                                        fontFamily: FontUtils
                                                            .interMedium,
                                                        fontSize: 1.8.t,
                                                        textColor:
                                                            ColorUtils.tuple,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 2.h,
                                                ),
                                              ],
                                            );
                                          }),
                                    )
                                  ],
                                ),
                              )),
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
