import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imraapp/Utils/extensions.dart';
import 'package:imraapp/Utils/widget_loader.dart';
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

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({Key? key}) : super(key: key);

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) async {
        model.gettingFaq(context);
      },
      builder: (context, model, child) {
        return model.faqLoader==true? WidgetLoader(): SafeArea(
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
                              textValue: "FAQ's",
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
                                height: 4.h,
                              ),
                              Container(
                                // padding: EdgeInsets.all(10),
                                height: 60.h,
                                child: ListView.builder(
                                  itemCount: model.faq?.length??0,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ExpansionTile(
                                      title: Container(
                                        child: TextWidget(
                                          textValue: model.faq![index].faqquestion.toString(),
                                              
                                          textColor: ColorUtils.black,
                                          fontFamily: FontUtils.interRegular,
                                          fontSize: 1.6.t,
                                        ),
                                      ),
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 15, right: 15, bottom: 10),
                                          child: TextWidget(
                                            textValue:  model.faq![index].faqanswers.toString(),
                                            textColor: ColorUtils.black,
                                            fontFamily: FontUtils.interRegular,
                                            fontSize: 1.6.t,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     TextWidget(
                              //       textValue: "What is IMRA?",
                              //       fontFamily: FontUtils.proxima,
                              //       fontSize: 2.3.t,
                              //       textColor: ColorUtils.black,
                              //     ),
                              //     SvgPicture.asset(ImageUtils.arrowup)
                              //   ],
                              // ),
                              // SizedBox(
                              //   height: 2.h,
                              // ),
                              // Divider(thickness: 1),
                              // Row(
                              //   children: [
                              //     Expanded(
                              //       child: Text(
                              //         "Lorem ipsum dolor sit amet consectetur. In ut fermentum elementum vestibulum quam urna purus eu morbi. Platea aliquet duis sed massa imperdiet aliquet nec. Risus lorem neque in urna accumsan leo sagittis. Tristique blandit sit tellus tortor.",
                              //         style: TextStyle(
                              //           fontFamily: FontUtils.proxima,
                              //           fontSize: 14,
                              //           color: Color(0xFFAAAFBB),
                              //           //  fontWeight: FontWeight.w600
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              // SizedBox(
                              //   height: 3.h,
                              // ),
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Text(
                              //       "Lorem ipsum dolor sit consectetur.",
                              //       style: TextStyle(
                              //           fontFamily: FontUtils.proxima,
                              //           fontSize: 14,
                              //           fontWeight: FontWeight.w600),
                              //     ),
                              //     Image.asset(ImageUtils.downarrow)
                              //   ],
                              // ),
                              // SizedBox(
                              //   height: 3.h,
                              // ),
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Text(
                              //       "Lorem ipsum dolor sit  consectetur.",
                              //       style: TextStyle(
                              //           fontFamily: FontUtils.proxima,
                              //           fontSize: 14,
                              //           fontWeight: FontWeight.w600),
                              //     ),
                              //     Image.asset(ImageUtils.downarrow)
                              //   ],
                              // ),
                              // SizedBox(
                              //   height: 3.h,
                              // ),
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Text(
                              //       "Lorem ipsum dolor sit amet.",
                              //       style: TextStyle(
                              //           fontFamily: FontUtils.proxima,
                              //           fontSize: 14,
                              //           fontWeight: FontWeight.w600),
                              //     ),
                              //     Image.asset(ImageUtils.downarrow)
                              //   ],
                              // ),
                              // SizedBox(
                              //   height: 3.h,
                              // ),
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Text(
                              //       "Lorem ipsum dolor sit amet consectetur.",
                              //       style: TextStyle(
                              //           fontFamily: FontUtils.proxima,
                              //           fontSize: 14,
                              //           fontWeight: FontWeight.w600),
                              //     ),
                              //     Image.asset(ImageUtils.downarrow)
                              //   ],
                              // ),
                              // SizedBox(
                              //   height: 3.h,
                              // ),
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Text(
                              //       "Lorem ipsum dolor sit amet consectetur.",
                              //       style: TextStyle(
                              //           fontFamily: FontUtils.proxima,
                              //           fontSize: 14,
                              //           fontWeight: FontWeight.w600),
                              //     ),
                              //     Image.asset(ImageUtils.downarrow)
                              //   ],
                              // ),
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
