import 'package:flutter/material.dart';
import 'package:imraapp/Utils/extensions.dart';
import 'package:imraapp/Utils/font_utils.dart';

import '../Utils/color_utils.dart';
import '../Utils/image_utils.dart';

class TextFormFieldCustom extends StatefulWidget {
  final TextEditingController? controller;
  //final TextInputType? textInputType;
  final String? hintText;
  // final String? prefixicon;
  // final String? sufixicon;
  // final bool? prefixRequired;
  // final bool? suffixRequired;
  // final String? svgImage;
  // final double? suffixImageWidth;
  // final double? suffixImageHeight;

  const TextFormFieldCustom(
      {
      // this.sufixicon,
      this.controller,
      // this.textInputType,
      this.hintText,
      // this.prefixicon,
      // this.prefixRequired,
      // this.suffixRequired,
      // this.svgImage,
      // this.suffixImageWidth,
      // this.suffixImageHeight,
      Key? key,
      prefixIcon})
      : super(key: key);

  @override
  State<TextFormFieldCustom> createState() => _TextFormFieldCustomState();
}

class _TextFormFieldCustomState extends State<TextFormFieldCustom> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorUtils.silver1, borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller: widget.controller,
        style: TextStyle(color: ColorUtils.black),
        obscureText: _obscureText,
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(left: 5.w, top: 3.h, right: 2.w, bottom: 3.h),
            border: InputBorder.none,
            prefixIcon: Image.asset(
              ImageUtils.keyicon,
            ),
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                )),
            // prefixIcon: Image.asset(widget.prefixicon!),
            // suffixIcon: Image.asset(widget.sufixicon!),
            hintText: widget.hintText,
            hintStyle: TextStyle(
                color: ColorUtils.hinttextcolor,
                fontFamily: FontUtils.proxima)),
      ),
    );
  }
}
