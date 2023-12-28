import 'package:flutter/material.dart';
import 'package:imraapp/Utils/extensions.dart';
import 'package:imraapp/Utils/whole_loader.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/font_utils.dart';
import '../../Utils/image_utils.dart';
import '../../ViewModels/main_view_model.dart';
import '../../Widgets/page_horizontal_margin.dart';
import '../../Widgets/text_widget.dart';
import '../../app/locator.dart';
import 'profile_screen6.dart';

class ProfileScreen5 extends StatelessWidget {
  const ProfileScreen5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) async {
        model.gettingQuestion(context);
      },
      builder: (context, model, child) {
        return model.questionLoader == true
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
                                          textValue: "01",
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
                                            final question = model.question![0];
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
                                                      textValue: model
                                                          .question![index]
                                                          .questionText
                                                          .toString(),
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
                                                        //model. ['questions'][0]['answers']
                                                        model.question![index]
                                                            .answers![index]
                                                            .toString(),
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
                                                        model.question![index]
                                                            .answers![1]
                                                            .toString(),
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
                                                        model.question![index]
                                                            .answers![2]
                                                            .toString(),
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
                                                                    ProfileScreen6()));
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
                                                                    ProfileScreen6()));
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
