import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imraapp/Utils/extensions.dart';


import '../Utils/color_utils.dart';

class CustomTextFieldForpassword extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? hintText;
  final IconData? prefixIconData;
  final bool? prefixRequired;
  final bool? suffixRequired;
  final String? svgImage;
  final double? suffixImageWidth;
  final double? suffixImageHeight;

  CustomTextFieldForpassword(
      {this.controller,
      this.textInputType,
      this.hintText,
      this.prefixIconData,
      this.prefixRequired,
      this.suffixRequired,
      this.svgImage,
      this.suffixImageWidth,
      this.suffixImageHeight,
      Key? key})
      : super(key: key);

  @override
  State<CustomTextFieldForpassword> createState() =>
      _CustomTextFieldForpasswordState();
}

class _CustomTextFieldForpasswordState
    extends State<CustomTextFieldForpassword> {
  @override
  bool _passwordVisible = true;

  Widget build(BuildContext context) {
    return Container(
        height: 55,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: widget.prefixRequired == true
            ? TextField(
                controller: widget.controller,
                style: TextStyle(color: ColorUtils.black),
                keyboardType: widget.textInputType,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                      left: 5.w, top: 2.h, right: 2.w, bottom: 3.h),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: ColorUtils.black.withOpacity(0.5), width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide:
                        BorderSide(color: ColorUtils.lightBlue, width: 1.5),
                  ),
                  hintText: widget.hintText,
                  hintStyle:
                      TextStyle(color: ColorUtils.black.withOpacity(0.5)),
                  prefixIcon: Icon(
                    widget.prefixIconData,
                    //color: ColorUtils.blue1,
                  ),
                ),
              )
            : widget.suffixRequired == true
                ? TextField(
                    controller: widget.controller,
                    style: TextStyle(color: ColorUtils.black),
                    keyboardType: widget.textInputType,
                    decoration: InputDecoration(
                      //isDense: true,
                      suffixIconConstraints: BoxConstraints(
                        minHeight: widget.suffixImageHeight!,
                        minWidth: widget.suffixImageWidth!,
                      ),
                      contentPadding: EdgeInsets.only(
                          left: 5.w, top: 3.h, right: 2.w, bottom: 3.h),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorUtils.greenf, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide:
                            BorderSide(color: ColorUtils.greenf, width: 1.5),
                      ),
                      hintText: widget.hintText,
                      hintStyle:
                          TextStyle(color: ColorUtils.black.withOpacity(0.5)),
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(right: 4.w),
                        child: SvgPicture.asset(
                          widget.svgImage!,
                        ),
                      ),
                    ),
                  )
                : TextField(
                    obscureText: _passwordVisible,
                    controller: widget.controller,
                    style: TextStyle(color: ColorUtils.black),
                    keyboardType: widget.textInputType,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      //isDense: true,
                      contentPadding: EdgeInsets.only(
                          left: 5.w, top: 2.h, right: 2.w, bottom: 3.h),
                      enabledBorder: OutlineInputBorder(
                        //color: ColorUtils.greenf,
                        borderSide:
                            BorderSide(color: ColorUtils.greenf, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide:
                            BorderSide(color: ColorUtils.greenf, width: 1),
                      ),
                      suffix: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: ColorUtils.greenf,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                      hintText: widget.hintText,
                      hintStyle:
                          TextStyle(color: ColorUtils.black.withOpacity(0.5)),
                    ),
                  ));
  }
}
