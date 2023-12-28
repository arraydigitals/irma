import 'package:dotted_border/dotted_border.dart';
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

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({Key? key}) : super(key: key);

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
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
                                TextWidget(
                                  textValue: "Search Result",
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
                      SizedBox(
                        height: 3.h,
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
                      child: SingleChildScrollView(
                        child: PageHorizontalMargin(
                          widget: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 3.h,
                              ),
                              SizedBox(
                                child: GridView.builder(
                                  itemCount: 4,
                                  // model.DeliveryList.length,
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  primary: false,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 1,
                                          crossAxisSpacing: 10.0,
                                          mainAxisSpacing: 10.0,
                                          //1.35
                                          childAspectRatio: 2.4),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                        onTap: () {
                                          //   Navigator.push(
                                          //       context,
                                          //       PageTransition(
                                          //           type: PageTransitionType.fade,
                                          //           child: const DeliverResaurantCheckoutPage2()));
                                        },
                                        child: Container(
                                            //height: 50,
                                            width: 87.w,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    // color: Color(0xFF9399A6)
                                                    color: ColorUtils.grayf),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.white),
                                            child: Column(
                                              children: [
                                                ListTile(
                                                  leading: Image.asset(
                                                      ImageUtils.img),
                                                  title: TextWidget(
                                                    textValue:
                                                        "Emirates Hospital Jumeirah",
                                                    fontFamily:
                                                        FontUtils.proxima,
                                                    fontSize: 2.3.t,
                                                    textColor: ColorUtils.black,
                                                  ),
                                                  subtitle: Row(
                                                    children: [
                                                      // ignore: prefer_const_constructors
                                                      Icon(
                                                        Icons.star,
                                                        color: Colors.yellow,
                                                        size: 20,
                                                      ),
                                                      SizedBox(
                                                        width: 2.w,
                                                      ),
                                                      TextWidget(
                                                        textValue:
                                                            "4.5 |  2.7 km",
                                                        fontFamily:
                                                            FontUtils.proxima,
                                                        fontSize: 2.2.t,
                                                        textColor:
                                                            ColorUtils.black,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    // mainAxisAlignment:
                                                    //     MainAxisAlignment.spaceAround,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(13),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              9),
                                                                  color: const Color
                                                                          .fromRGBO(
                                                                      50,
                                                                      198,
                                                                      195,
                                                                      0.09)),
                                                              child: Image.asset(
                                                                  ImageUtils
                                                                      .save)),
                                                          SizedBox(
                                                            width: 3.w,
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              _shareModalBottomSheet(
                                                                  context);
                                                            },
                                                            child: Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        13),
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                9),
                                                                    color: const Color
                                                                            .fromRGBO(
                                                                        50,
                                                                        198,
                                                                        195,
                                                                        0.09)),
                                                                child: Image.asset(
                                                                    ImageUtils
                                                                        .share)),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 8.2.w,
                                                      ),
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 15,
                                                                top: 10,
                                                                bottom: 10,
                                                                right: 15),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: const Color(
                                                              0xFF32C6C3),
                                                        ),
                                                        child: TextWidget(
                                                          textValue:
                                                              "Get Direction",
                                                          fontFamily: FontUtils
                                                              .interMedium,
                                                          fontSize: 2.t,
                                                          textColor:
                                                              ColorUtils.white,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )));
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
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

// share modelBOttom sheet
void _shareModalBottomSheet(context) {
  showModalBottomSheet(
      backgroundColor: Colors.grey,
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: 40.w,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: PageHorizontalMargin(
            widget: Column(
              children: <Widget>[
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    TextWidget(
                      textValue: "Share",
                      fontFamily: FontUtils.interMedium,
                      fontSize: 2.3.t,
                      textColor: ColorUtils.black,
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(ImageUtils.messanger),
                    Image.asset(ImageUtils.whatapp1),
                    Image.asset(ImageUtils.mail),
                    Image.asset(ImageUtils.skype),
                    Image.asset(ImageUtils.moreh),
                  ],
                )
              ],
            ),
          ),
        );
      });
}

// Delete modalBOttom sheet
void _deleteModalBottomSheet(context) {
  showModalBottomSheet(
      backgroundColor: Colors.grey,
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: 40.w,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: PageHorizontalMargin(
            widget: Column(
              children: <Widget>[
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    TextWidget(
                      textValue: "Are you sure you want to delete?",
                      fontFamily: FontUtils.interMedium,
                      fontSize: 2.3.t,
                      textColor: ColorUtils.black,
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 50, right: 50, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: ColorUtils.grayf),
                        ),
                        child: const Text('Cancel'),
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 50, right: 50, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: ColorUtils.tuple),
                        ),
                        child: const Text('Yes'),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      });
}
