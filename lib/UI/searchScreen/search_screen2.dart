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
import '../documents/add_document_screen.dart';
import '../profilescreen/edit_user_profile_screen2.dart';

class SeachScreen2 extends StatefulWidget {
  const SeachScreen2({Key? key}) : super(key: key);

  @override
  State<SeachScreen2> createState() => _SeachScreen2State();
}

class _SeachScreen2State extends State<SeachScreen2> {
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
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 50),
                  PageHorizontalMargin(
                    widget: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Image.asset(ImageUtils.blackbackarrow)),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "Search ",
                              style: TextStyle(
                                  fontFamily: FontUtils.proxima,
                                  fontSize: 18,
                                  //color: const Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(147, 153, 166, 0.09),
                              // color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                  left: 15,
                                  top: 15,
                                ),
                                border: InputBorder.none,
                                hintText: 'Search ',
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.search))),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Recent Searches",
                              style: TextStyle(
                                fontFamily: FontUtils.proxima,
                                fontSize: 16,
                                // color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Clear",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontFamily: FontUtils.proxima,
                                fontSize: 16,
                                color: Color(0xFFE70C0C),
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Emirates Hospital Jumeirah",
                              style: TextStyle(
                                fontFamily: FontUtils.proxima,
                                fontSize: 16,
                                // color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: AddDocumentScreen()));
                                },
                                child: Image.asset(ImageUtils.cancelicon1))
                          ],
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Complete blood Count (CBC)",
                              style: TextStyle(
                                fontFamily: FontUtils.proxima,
                                fontSize: 16,
                                // color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Image.asset(ImageUtils.cancelicon1)
                          ],
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Seha Emirates Hospital",
                              style: TextStyle(
                                fontFamily: FontUtils.proxima,
                                fontSize: 16,
                                // color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Image.asset(ImageUtils.cancelicon1)
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
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
                                  borderRadius: BorderRadius.circular(25)),
                              onPressed: () {
                                // Navigator.push(
                                //     context,
                                //     PageTransition(
                                //         type: PageTransitionType.fade,
                                //         child: EditUserProfileScreen2()));
                              },
                              child: Text(
                                "Search",
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
