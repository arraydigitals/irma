import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
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
import 'filter_screen.dart';

class FilterFacilityTypeScreen extends StatefulWidget {
  const FilterFacilityTypeScreen({Key? key}) : super(key: key);

  @override
  State<FilterFacilityTypeScreen> createState() =>
      _FilterFacilityTypeScreenState();
}

class _FilterFacilityTypeScreenState extends State<FilterFacilityTypeScreen> {
  int? selectedOption = 1;
  @override
  Widget build(BuildContext context) {
    double _startValue = 500;
    double _endValue = 3000;
    //int selectedOption = 1;
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Image.asset(ImageUtils.back)),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text(
                                  "Facility Type",
                                  style: TextStyle(
                                      fontFamily: FontUtils.proxima,
                                      fontSize: 18,
                                      color: const Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w600),
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
                              const SizedBox(
                                height: 30,
                              ),
                              // ListTile(
                              //   title: Text(
                              //     "Ambulatory surgical centers",
                              //     style: TextStyle(
                              //         fontFamily: FontUtils.proxima,
                              //         fontSize: 14,
                              //         // color: Color(0xFFFFFFFF),
                              //         fontWeight: FontWeight.w600),
                              //   ),
                              //   leading: Image.asset(ImageUtils.netherland),
                              //   trailing: Radio<int>(
                              //     value: 1,
                              //     groupValue: selectedOption,
                              //     onChanged: (int? value) {
                              //       setState(() {
                              //         selectedOption = value!;
                              //         // print("Selected Option: $selectedOption");
                              //       });
                              //     },
                              //   ),
                              // ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Ambulatory surgical centers",
                                    style: TextStyle(
                                        fontFamily: FontUtils.proxima,
                                        fontSize: 14,
                                        // color: Color(0xFFFFFFFF),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Radio(
                                    value: 1,
                                    groupValue: selectedOption,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedOption = value!;
                                      });
                                    },
                                    activeColor: ColorUtils.tuple,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Birth centers",
                                    style: TextStyle(
                                        fontFamily: FontUtils.proxima,
                                        fontSize: 14,
                                        // color: Color(0xFFFFFFFF),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Radio(
                                    value: 2,
                                    groupValue: selectedOption,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedOption = value!;
                                      });
                                    },
                                    activeColor: ColorUtils.tuple,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Blood banks",
                                    style: TextStyle(
                                        fontFamily: FontUtils.proxima,
                                        fontSize: 14,
                                        // color: Color(0xFFFFFFFF),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Radio(
                                    value: 3,
                                    groupValue: selectedOption,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedOption = value!;
                                      });
                                    },
                                    activeColor: ColorUtils.tuple,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Clinics and medical offices",
                                    style: TextStyle(
                                        fontFamily: FontUtils.proxima,
                                        fontSize: 14,
                                        // color: Color(0xFFFFFFFF),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Radio(
                                    value: 5,
                                    groupValue: selectedOption,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedOption = value!;
                                      });
                                    },
                                    activeColor: ColorUtils.tuple,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Diabetes education centers",
                                    style: TextStyle(
                                        fontFamily: FontUtils.proxima,
                                        fontSize: 14,
                                        // color: Color(0xFFFFFFFF),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Radio(
                                    value: 6,
                                    groupValue: selectedOption,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedOption = value!;
                                      });
                                    },
                                    activeColor: ColorUtils.tuple,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Dialysis Centers",
                                    style: TextStyle(
                                        fontFamily: FontUtils.proxima,
                                        fontSize: 14,
                                        // color: Color(0xFFFFFFFF),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Radio(
                                    value: 7,
                                    groupValue: selectedOption,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedOption = value!;
                                      });
                                    },
                                    activeColor: ColorUtils.tuple,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Hospitals",
                                    style: TextStyle(
                                        fontFamily: FontUtils.proxima,
                                        fontSize: 14,
                                        // color: Color(0xFFFFFFFF),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Radio(
                                    value: 8,
                                    groupValue: selectedOption,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedOption = value!;
                                      });
                                    },
                                    activeColor: ColorUtils.tuple,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Imaging and radiology centers",
                                    style: TextStyle(
                                        fontFamily: FontUtils.proxima,
                                        fontSize: 14,
                                        // color: Color(0xFFFFFFFF),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Radio(
                                    value: 9,
                                    groupValue: selectedOption,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedOption = value!;
                                      });
                                    },
                                    activeColor: ColorUtils.tuple,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Mental health & addiction treatment ce...",
                                    style: TextStyle(
                                        fontFamily: FontUtils.proxima,
                                        fontSize: 14,
                                        // color: Color(0xFFFFFFFF),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Radio(
                                    value: 10,
                                    groupValue: selectedOption,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedOption = value!;
                                      });
                                    },
                                    activeColor: ColorUtils.tuple,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3.h,
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
                                              child: FilterScreen()));
                                    },
                                    child: Text(
                                      "Done",
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
