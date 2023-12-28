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
import '../Home/home_bottombarnav_screen3.dart';
import 'facilities_screen2.dart';
import 'filter_facility_type_screen.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    double _startValue = 500;
    double _endValue = 3000;
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
                                  "Filter",
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
                              Row(
                                children: [
                                  Text(
                                    "Facility Type",
                                    style: TextStyle(
                                        fontFamily: FontUtils.proxima,
                                        fontSize: 14,
                                        // color: Color(0xFFFFFFFF),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      const Color.fromRGBO(170, 175, 187, 0.2),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Cardiac Hospital",
                                      style: TextStyle(
                                        fontFamily: FontUtils.proxima,
                                        fontSize: 16,
                                        // color: Color(0xFFFFFFFF),
                                        //fontWeight: FontWeight.w600
                                      ),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              PageTransition(
                                                  type: PageTransitionType.fade,
                                                  child:
                                                      FilterFacilityTypeScreen()));
                                        },
                                        child:
                                            Image.asset(ImageUtils.fowardicon))
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Distance",
                                    style: TextStyle(
                                        fontFamily: FontUtils.proxima,
                                        fontSize: 14,
                                        // color: Color(0xFFFFFFFF),
                                        fontWeight: FontWeight.w600),
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
                                  Text(
                                    "500km",
                                    style: TextStyle(
                                      fontFamily: FontUtils.proxima,
                                      fontSize: 12,
                                      // color: Color(0xFFFFFFFF),
                                      //fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  Text(
                                    "3000km",
                                    style: TextStyle(
                                      fontFamily: FontUtils.proxima,
                                      fontSize: 12,
                                      // color: Color(0xFFFFFFFF),
                                      //fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              FlutterSlider(
                                values: [1000, 2000],
                                rangeSlider: true,
                                max: 3000,
                                min: 500,
                                rightHandler: FlutterSliderHandler(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorUtils.tuple,
                                  ),
                                  child: Icon(
                                    Icons.chevron_left,
                                    color: ColorUtils.tuple,
                                    size: 0,
                                  ),
                                ),
                                // onDragging:
                                //     (handlerIndex, lowerValue, upperValue) {
                                //   setState(() {
                                //     _startValue = lowerValue;
                                //     _endValue = upperValue;
                                //   });
                                // },
                                handler: FlutterSliderHandler(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorUtils.tuple,
                                  ),
                                  child: Icon(
                                    Icons.circle,
                                    color: ColorUtils.tuple,
                                    size: 0,
                                  ),
                                ),
                                trackBar: FlutterSliderTrackBar(
                                  activeTrackBarHeight: 4,
                                  inactiveTrackBarHeight: 4,
                                  activeTrackBar: BoxDecoration(
                                    color: ColorUtils.tuple,
                                  ),
                                  inactiveTrackBar:
                                      const BoxDecoration(color: Colors.grey),
                                ),
                                tooltip: FlutterSliderTooltip(
                                  // rightSuffix: Icon(
                                  //   Icons.circle,
                                  //   size: 19,
                                  //   color: Colors.green,
                                  // ),
                                  textStyle: const TextStyle(
                                      fontSize: 17, color: Colors.black),
                                ),
                                handlerAnimation:
                                    const FlutterSliderHandlerAnimation(
                                  curve: Curves.elasticOut,
                                  reverseCurve: Curves.elasticIn,
                                  duration: Duration(milliseconds: 700),
                                  scale: 1.4,
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Rating",
                                    style: TextStyle(
                                        fontFamily: FontUtils.proxima,
                                        fontSize: 14,
                                        // color: Color(0xFFFFFFFF),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Row(
                                children: [
                                  Image.asset(ImageUtils.shape),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Image.asset(ImageUtils.shape),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Image.asset(ImageUtils.shape),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Image.asset(ImageUtils.shape1),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Image.asset(ImageUtils.shape1),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
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
                                              child:
                                                  HomeBottombarNavScreen3()
                                                  
                                                  ));
                                    },
                                    child: Text(
                                      "Apply",
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
                                height: 3.h,
                              ),
                              Text(
                                "Reset",
                                style: TextStyle(
                                  fontFamily: FontUtils.interSemiBold,
                                  fontSize: 1.8.t,
                                  color: ColorUtils.tuple,
                                  // Color.fromRGBO(2, 104, 81, 1)
                                ),
                              ),
                              SizedBox(
                                height: 6.h,
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
