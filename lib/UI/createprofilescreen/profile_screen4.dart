import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
import '../Facilities/food_allergies_screen.dart';
import 'profile_screen5.dart';

class ProfileScreen4 extends StatelessWidget {
  const ProfileScreen4({Key? key}) : super(key: key);

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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextWidget(
                                    textValue: "Enter Allergies",
                                    fontFamily: FontUtils.interSemiBold,
                                    fontSize: 2.2.t,
                                    textColor: ColorUtils.black,
                                  ),
                                  TextWidget(
                                    textValue: "03",
                                    fontFamily: FontUtils.interMedium,
                                    fontSize: 1.8.t,
                                    textColor: ColorUtils.tuple,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: FoodAllergiesScreen()));
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget(
                                      textValue: "Food Allergies",
                                      fontFamily: FontUtils.interMedium,
                                      fontSize: 2.t,
                                      textColor: ColorUtils.tuple,
                                    ),
                                    InkWell(
                                      child: Image.asset(
                                        ImageUtils.fowardicon,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextWidget(
                                    textValue: "Peanut",
                                    fontFamily: FontUtils.proxima,
                                    fontSize: 2.3.t,
                                    textColor: ColorUtils.black,
                                  ),
                                  SvgPicture.asset(ImageUtils.remove),
                                ],
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextWidget(
                                    textValue: "Egg",
                                    fontFamily: FontUtils.proxima,
                                    fontSize: 2.3.t,
                                    textColor: ColorUtils.black,
                                  ),
                                  SvgPicture.asset(ImageUtils.remove),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextWidget(
                                    textValue: "Medical Allergies",
                                    fontFamily: FontUtils.interMedium,
                                    fontSize: 2.t,
                                    textColor: ColorUtils.tuple,
                                  ),
                                  Image.asset(
                                    ImageUtils.fowardicon,
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
                                height: 2.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextWidget(
                                    textValue: "Environmental Allergies",
                                    fontFamily: FontUtils.interMedium,
                                    fontSize: 2.t,
                                    textColor: ColorUtils.tuple,
                                  ),
                                  Image.asset(
                                    ImageUtils.fowardicon,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8.h,
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
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType.fade,
                                              child: ProfileScreen5()));
                                    },
                                    child: Text(
                                      "Continue",
                                      style: TextStyle(
                                        fontFamily: FontUtils.interSemiBold,
                                        fontSize: 1.8.t,
                                        color: ColorUtils.white,
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType.fade,
                                              child: ProfileScreen5()));
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
}
