import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imraapp/UI/News/news_detail_screen.dart';
import 'package:imraapp/Utils/extensions.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
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

class NewsUpdateScreen extends StatefulWidget {
  const NewsUpdateScreen({Key? key}) : super(key: key);

  @override
  State<NewsUpdateScreen> createState() => _NewsUpdateScreenState();
}

class _NewsUpdateScreenState extends State<NewsUpdateScreen> {
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
                          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Image.asset(ImageUtils.back)),
                            SizedBox(
                              width: 4.2.w,
                            ),
                            TextWidget(
                              textValue: "News & Updates",
                              fontFamily: FontUtils.interMedium,
                              fontSize: 2.t,
                              textColor: ColorUtils.white,
                            ),
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
                              Row(
                                children: [
                                  Text(
                                    "Trending News",
                                    style: TextStyle(
                                        fontFamily: FontUtils.proxima,
                                        fontSize: 16,
                                        // color: Color(0xFF9399A6),
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              SizedBox(
                                height: 25.h,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            child: const NewsDetailsScreen()));
                                  },
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        //  height: 50,
                                        width: 70.w,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                // color: Color(0xFF9399A6)
                                                color: ColorUtils.grayf),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              ImageUtils.hospital,
                                              fit: BoxFit.fill,
                                              height: 15.h,
                                              width: 85.w,
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      "Lorem ipsum dolor sit amet consectetur.\n Luctus pellentesque suspendisse et.",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              FontUtils.proxima,
                                                          fontSize: 12,
                                                          //color: Color(0xFF898C94),
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      "25 Dec, 08:00PM",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            FontUtils.proxima,
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xFF9399A6),
                                                        //fontWeight: FontWeight.w600
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        //  height: 50,
                                        width: 70.w,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                // color: Color(0xFF9399A6)
                                                color: ColorUtils.grayf),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              ImageUtils.image,
                                              fit: BoxFit.fill,
                                              height: 15.h,
                                              width: 85.w,
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      "Lorem ipsum dolor sit amet consectetur.\n Luctus pellentesque suspendisse et.",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              FontUtils.proxima,
                                                          fontSize: 12,
                                                          //color: Color(0xFF898C94),
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      "25 Dec, 08:00PM",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            FontUtils.proxima,
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xFF9399A6),
                                                        //fontWeight: FontWeight.w600
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Highlights",
                                    style: TextStyle(
                                        fontFamily: FontUtils.proxima,
                                        fontSize: 16,
                                        //color: Color(0xFF9399A6),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              SizedBox(
                                child: GridView.builder(
                                  itemCount:
                                      // 3,
                                      model.news.length,
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  primary: false,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 1,
                                          crossAxisSpacing: 10.0,
                                          mainAxisSpacing: 20.0,
                                          //1.35
                                          childAspectRatio: 3.5),
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
                                            // width: 87.w,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    // color: Color(0xFF9399A6)
                                                    color: ColorUtils.grayf),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.white),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 7,
                                                    top: 5,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      model.news[index]
                                                          ['image'],
                                                      Expanded(
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  "Lorem ipsum dolor sit amet consectetur. \nLuctus pellentesque suspendisse et.",
                                                                  style: TextStyle(
                                                                      fontFamily: FontUtils.proxima,
                                                                      fontSize: 12,
                                                                      // color:
                                                                      //     Color(0xFF9399A6),
                                                                      fontWeight: FontWeight.w600),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 1.h,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 25),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    "25 Dec, 08:00PM",
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          FontUtils
                                                                              .proxima,
                                                                      fontSize:
                                                                          12,
                                                                      color: Color(
                                                                          0xFF9399A6),
                                                                      //fontWeight: FontWeight.w600
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        // Text(
                                                        //   "Lorem ipsum dolor sit amet consectetur. Luctus pellentesque suspendisse et.",
                                                        //   style: TextStyle(
                                                        //       fontFamily:
                                                        //           FontUtils.proxima,
                                                        //       fontSize: 12,
                                                        //       // color:
                                                        //       //     Color(0xFF9399A6),
                                                        //       fontWeight:
                                                        //           FontWeight.w600),
                                                        // ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                // ListTile(
                                                //   // leading: model.news[index]
                                                //   //     ['image'],
                                                //   title: Text(
                                                //     "Lorem ipsum dolor sit amet consectetur. Luctus pellentesque suspendisse et.",
                                                //     style: TextStyle(
                                                //         fontFamily:
                                                //             FontUtils.proxima,
                                                //         fontSize: 12,
                                                //         // color:
                                                //         //     Color(0xFF9399A6),
                                                //         fontWeight:
                                                //             FontWeight.w600),
                                                //   ),
                                                //   subtitle: Padding(
                                                //     padding:
                                                //         const EdgeInsets.only(
                                                //             top: 5),
                                                //     child: Text(
                                                //       "25 Dec, 08:00PM",
                                                //       style: TextStyle(
                                                //         fontFamily:
                                                //             FontUtils.proxima,
                                                //         fontSize: 12,
                                                //         color:
                                                //             Color(0xFF9399A6),
                                                //         //fontWeight: FontWeight.w600
                                                //       ),
                                                //     ),
                                                //   ),
                                                // ),
                                              ],
                                            )));
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
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
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
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
                    // Container(
                    //   width: 50,
                    //   height: 50,
                    //   decoration: BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     border: Border.all(
                    //       color: ColorUtils.grayf,
                    //       width: 1.0,
                    //     ),
                    //   ),
                    //   child: Image.asset(ImageUtils.save),
                    // ),
                    // Container(
                    //   width: 50,
                    //   height: 50,
                    //   decoration: BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     border: Border.all(
                    //       color: ColorUtils.grayf,
                    //       width: 1.0,
                    //     ),
                    //   ),
                    //   child: Image.asset(ImageUtils.save),
                    // ),
                    // Container(
                    //   width: 50,
                    //   height: 50,
                    //   decoration: BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     border: Border.all(
                    //       color: ColorUtils.grayf,
                    //       width: 1.0,
                    //     ),
                    //   ),
                    //   child: Image.asset(ImageUtils.save),
                    // ),
                    // Container(
                    //   width: 50,
                    //   height: 50,
                    //   decoration: BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     border: Border.all(
                    //       color: ColorUtils.grayf,
                    //       width: 1.0,
                    //     ),
                    //   ),
                    //   child: Image.asset(ImageUtils.save),
                    // ),
                    // Container(
                    //   width: 50,
                    //   height: 50,
                    //   decoration: BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     border: Border.all(
                    //       color: ColorUtils.grayf,
                    //       width: 1.0,
                    //     ),
                    //   ),
                    //   child: Image.asset(ImageUtils.save),
                    // ),
                  ],
                )
              ],
            ),
          ),
        );
      });
}
