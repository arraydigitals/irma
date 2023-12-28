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
import '../Facilities/enter_medicxal_history_screen.dart';
import 'profile_screen3.dart';

class ProfileScreen2 extends StatelessWidget {
  const ProfileScreen2({Key? key}) : super(key: key);

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
                                    textValue: "Enter Medical History",
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
                              SizedBox(
                                height: 8.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextWidget(
                                    textValue: "Past Surgical History",
                                    fontFamily: FontUtils.interMedium,
                                    fontSize: 2.t,
                                    textColor: ColorUtils.black,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType.fade,
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
                                          fontFamily: FontUtils.proxima,
                                          fontSize: 2.t,
                                          textColor: ColorUtils.bgcontiner,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 15, bottom: 15),
                                // width: 90.w,
                                // height: 6.3.h,
                                decoration: BoxDecoration(
                                    border: Border.all(color: ColorUtils.grayf),
                                    // color: ColorUtils.silver1,
                                    borderRadius: BorderRadius.circular(15)),
                                child: ListTile(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  leading: Container(
                                    // padding: EdgeInsets.all(10),
                                    height: 60,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromRGBO(50, 198, 195, 0.3),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Image.asset(ImageUtils.doc),
                                  ),
                                  title: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextWidget(
                                              textValue: "Compartment syndrome",
                                              fontFamily: FontUtils.proxima,
                                              fontSize: 2.3.t,
                                              textColor: ColorUtils.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Row(
                                          children: [
                                            TextWidget(
                                              textValue:
                                                  "Seha Emirates Hospital",
                                              fontFamily: FontUtils.proxima,
                                              fontSize: 2.2.t,
                                              textColor: ColorUtils.tuple,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 3),
                                        child: Row(
                                          children: [
                                            TextWidget(
                                              textValue: "25 Dec, 08:00PM",
                                              fontFamily: FontUtils.proxima,
                                              fontSize: 2.t,
                                              textColor: ColorUtils.textcolor,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  trailing: Image.asset(ImageUtils.cancelicon1),
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
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
                                              child: ProfileScreen3()));
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
                                              child: ProfileScreen3()));
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
