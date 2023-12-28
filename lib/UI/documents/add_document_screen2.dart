import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imraapp/UI/documents/document_screen.dart';
import 'package:imraapp/Utils/extensions.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';
import '../../../Utils/color_utils.dart';
import '../../../Utils/font_utils.dart';
import '../../../Utils/image_utils.dart';
import '../../../ViewModels/main_view_model.dart';
import '../../../Widgets/custom_text_field.dart';
import '../../../Widgets/customtextfield.dart';
import '../../../Widgets/page_horizontal_margin.dart';
import '../../../Widgets/text_widget.dart';
import '../../../Widgets/textfiled_widget.dart';
import '../../../app/locator.dart';
import '../../Widgets/bottom_navigation_bar.dart';
import '../../modules/navigation_service.dart' as my_nav_service;
import 'add_document_screen.dart';

class AddDocumentScreen2 extends StatefulWidget {
  const AddDocumentScreen2({Key? key}) : super(key: key);

  @override
  State<AddDocumentScreen2> createState() => _AddDocumentScreen2State();
}

class _AddDocumentScreen2State extends State<AddDocumentScreen2> {
  var navigationService = my_nav_service.NavigationService();
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
                                  textValue: "Add New Document",
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
                              SizedBox(
                                height: 4.h,
                              ),
                              Row(
                                children: [
                                  TextWidget(
                                    textValue: "Document Name ",
                                    fontFamily: FontUtils.proxima,
                                    fontSize: 2.3.t,
                                    textColor: ColorUtils.black,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: ColorUtils.silver1,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: '',
                                      hintStyle: TextStyle(
                                          color: ColorUtils.black,
                                          fontFamily: FontUtils.proxima,
                                          fontSize: 16),
                                      contentPadding: EdgeInsets.only(
                                          left: 5.w,
                                          top: 2.h,
                                          right: 2.w,
                                          bottom: 3.h),
                                      //labelStyle: ,
                                      border: InputBorder.none),
                                  //enabled: false,
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Row(
                                children: [
                                  TextWidget(
                                    textValue: "Description",
                                    fontFamily: FontUtils.proxima,
                                    fontSize: 2.3.t,
                                    textColor: ColorUtils.black,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: ColorUtils.silver1,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: TextField(
                                  //textAlign: TextAlign.justify,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 4,
                                  decoration: InputDecoration(
                                      hintText: '',
                                      hintStyle: TextStyle(
                                          color: ColorUtils.black,
                                          fontFamily: FontUtils.proxima,
                                          fontSize: 16),
                                      contentPadding: EdgeInsets.only(
                                          left: 1.w,
                                          // top: 2.h,
                                          right: 2.w,
                                          bottom: 3.h),
                                      //labelStyle: ,
                                      border: InputBorder.none),
                                  //enabled: false,
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Attachment",
                                    style: TextStyle(
                                        fontFamily: FontUtils.proxima,
                                        fontSize: 14,
                                        //color: Color(0xFF9399A6),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Container(
                                // padding: EdgeInsets.only(top: 10, bottom: 10),
                                // width: 90.w,
                                // height: 6.3.h,
                                decoration: BoxDecoration(
                                    border: Border.all(color: ColorUtils.grayf),
                                    // color: ColorUtils.silver1,
                                    borderRadius: BorderRadius.circular(10)),
                                child: ListTile(
                                  onTap: () {
                                    navigationService.navigateToUntil(
                                        to: const AddDocumentScreen());
                                    //Navigator.pop(context);
                                  },
                                  leading: Image.asset(ImageUtils.pdf),
                                  title: Text(
                                    "Compartment syndrome",
                                    style: TextStyle(
                                        fontFamily: FontUtils.proxima,
                                        fontSize: 14,
                                        //color: Color(0xFF9399A6),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  subtitle: Text(
                                    "1.59mb",
                                    style: TextStyle(
                                      fontFamily: FontUtils.proxima,
                                      fontSize: 12,
                                      color: const Color(0xFF9399A6),
                                      //fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  trailing: Image.asset(ImageUtils.cancelicon1),
                                ),
                              ),
                              SizedBox(
                                height: 14.h,
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
                                    color: ColorUtils.tuple,
                                    //Color(0xFFF7F7F9)
                                  ),
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
                                              child: MyBottomNavBar(
                                                index: 1,
                                              )
                                              //DocumentScreen()

                                              ));
                                    },
                                    child: Text(
                                      "Submit",
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
                                height: 5.h,
                              )
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

void _settingModalBottomSheet(context) {
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
          child: Column(
            children: <Widget>[
              ListTile(
                  leading: SvgPicture.asset(ImageUtils.camera),
                  title: TextWidget(
                    textValue: "Open Camera",
                    fontFamily: FontUtils.proxima,
                    fontSize: 2.3.t,
                    textColor: ColorUtils.black,
                  ),
                  onTap: () => {}),
              // ignore: unnecessary_new
              ListTile(
                leading: SvgPicture.asset(ImageUtils.file),
                title: TextWidget(
                  textValue: "Browse File",
                  fontFamily: FontUtils.proxima,
                  fontSize: 2.3.t,
                  textColor: ColorUtils.black,
                ),
                onTap: () => {},
              ),
            ],
          ),
        );
      });
}
