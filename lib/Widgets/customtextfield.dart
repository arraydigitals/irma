import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imraapp/Utils/extensions.dart';
import 'package:imraapp/Utils/font_utils.dart';

import '../Utils/color_utils.dart';

class CustomTextFiledForm extends StatelessWidget {
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;
  final String? hintText;
  final String? prefixicon;
  final String? sufixicon;
  final bool? prefixRequired;
  final bool? suffixRequired;
  final String? svgImage;
  final double? suffixImageWidth;
  final double? suffixImageHeight;
  final int? maxLength;
  const CustomTextFiledForm(
      {this.sufixicon,
      this.maxLength,
      this.controller,
      this.inputFormatters,
      this.textInputType,
      this.hintText,
      this.prefixicon,
      this.prefixRequired,
      this.suffixRequired,
      this.svgImage,
      this.suffixImageWidth,
      this.suffixImageHeight,
      Key? key,
      prefixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorUtils.silver1, borderRadius: BorderRadius.circular(10)),
      child: TextField(
        maxLengthEnforcement: MaxLengthEnforcement.none, controller: controller,
        style: TextStyle(color: ColorUtils.black),
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(left: 5.w, top: 3.h, right: 2.w, bottom: 3.h),
            border: InputBorder.none,
            prefixIcon: Image.asset(prefixicon!),
            //suffixIcon: Image.asset(sufixicon!),
            hintText: hintText,
            hintStyle: TextStyle(
                color: ColorUtils.hinttextcolor,
                fontFamily: FontUtils.proxima)),
        keyboardType: textInputType, // Set the keyboardType to phone
        inputFormatters: inputFormatters,
        //maxLength: maxLength,
        
      ),
    );
  }
}
