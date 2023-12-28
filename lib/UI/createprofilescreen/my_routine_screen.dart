import 'package:flutter/material.dart';
import 'package:imraapp/UI/AuthScreen/login_screen.dart';
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
import '../Home/location_screen.dart';
import '../questionnaire/questionnaire_screen3.dart';

class MyRoutineScreen extends StatelessWidget {
  const MyRoutineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) async {
        model.gettingRoutine(context);
      },
      builder: (context, model, child) {
        return model.routineLoader
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
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Image.asset(ImageUtils.back)),
                              SizedBox(
                                width: 3.w,
                              ),
                              TextWidget(
                                textValue: "My Routine",
                                fontFamily: FontUtils.interMedium,
                                fontSize: 2.t,
                                textColor: ColorUtils.white,
                              ),
                            ],
                          ),
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
                                    Expanded(
                                      child: ListView.builder(
                                          itemCount: model.routine?.length ?? 0,
                                          itemBuilder: (context, index) {
                                            return Column(
                                              children: [
                                                SizedBox(
                                                  height: 2.h,
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
                                                                QuestionnaireScreen3()));
                                                  },
                                                  child: Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.rectangle,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  25.0)),
                                                    ),
                                                    child: AnimatedContainer(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(15.0),
                                                        duration: const Duration(
                                                            milliseconds: 400),
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            1,
                                                        // height: 16.h,
                                                        //margin: EdgeInsets.symmetric(horizontal: 5.w),
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color: ColorUtils
                                                                  .silver1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                TextWidget(
                                                                  textValue: model
                                                                      .routine![
                                                                          index]
                                                                      .questiontext
                                                                      .toString(),
                                                                  //"Do you Smoke?",
                                                                  fontFamily:
                                                                      FontUtils
                                                                          .interMedium,
                                                                  fontSize: 2.t,
                                                                  textColor:
                                                                      ColorUtils
                                                                          .black,
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 4.h,
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  const BoxDecoration(
                                                                shape: BoxShape
                                                                    .rectangle,
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            25.0)),
                                                              ),
                                                              child:
                                                                  AnimatedContainer(
                                                                duration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            400),
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    1,
                                                                height: 6.h,
                                                                //margin: EdgeInsets.symmetric(horizontal: 5.w),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border.all(
                                                                      color: const Color
                                                                          .fromRGBO(
                                                                          68,
                                                                          199,
                                                                          176,
                                                                          1)),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                  color: const Color
                                                                      .fromRGBO(
                                                                      68,
                                                                      199,
                                                                      176,
                                                                      0.1),
                                                                ),
                                                                child:
                                                                    MaterialButton(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              25)),
                                                                  onPressed:
                                                                      () {
                                                                    // Navigator.push(
                                                                    //     context,
                                                                    //     PageTransition(
                                                                    //         type: PageTransitionType.fade,
                                                                    //         child: MyHomePage()));
                                                                  },
                                                                  child: Text(
                                                                    model
                                                                        .routine![
                                                                            index]
                                                                        .answers
                                                                        .toString(),
                                                                    //  "Regular",
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          FontUtils
                                                                              .proxima,
                                                                      fontSize:
                                                                          1.8.t,
                                                                      color: ColorUtils
                                                                          .tuple,
                                                                      // Color.fromRGBO(2, 104, 81, 1)
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 4.h,
                                                ),
                                                SizedBox(
                                                  height: 2.h,
                                                ),
                                              ],
                                            );
                                          }),
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
                                            Navigator.push(
                                                context,
                                                PageTransition(
                                                    type:
                                                        PageTransitionType.fade,
                                                    child: Login()
                                                    // LocationsConfirmScreen()

                                                    ));
                                          },
                                          child: Text(
                                            "Continue",
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
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
