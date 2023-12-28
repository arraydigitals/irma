import 'package:expand_tap_area/expand_tap_area.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imraapp/Utils/extensions.dart';

import '../Utils/color_utils.dart';
import '../Utils/font_utils.dart';
import '../Utils/image_utils.dart';
import 'text_widget.dart';

class BackSingleText extends StatelessWidget {

  String? backText;

  BackSingleText({this.backText, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 6.w, top: 2.h),
        child: Row(
          children: [
            ExpandTapWidget(
              onTap: (){
                Navigator.pop(context);
              },
                tapPadding: EdgeInsets.all(50),
              child:SvgPicture.asset(ImageUtils.backArrowRed),
            ),
            SizedBox(width: 4.w,),
            TextWidget(
              textValue: backText,
              fontFamily: FontUtils.interSemiBold,
              fontSize: 2.t,
              textColor: ColorUtils.red,
            ),
          ],
        ),
      ),
    );
  }
}
