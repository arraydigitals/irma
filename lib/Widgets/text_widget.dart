import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {

  final String? textValue;
  final String? fontFamily;
  final double? fontSize;
  final Color? textColor;

  TextWidget({this.textValue, this.fontFamily, this.fontSize, this.textColor, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue!,
     // textAlign: TextAlign.center,
      style: TextStyle(
          fontFamily: fontFamily!,
          fontSize: fontSize!,
          color: textColor!
      ),
    );
  }
}
