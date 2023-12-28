
import 'package:flutter/material.dart';
import 'package:imraapp/Utils/extensions.dart';

class PageHorizontalMargin extends StatelessWidget {

  final Widget? widget;

  PageHorizontalMargin({this.widget, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      child: widget,
    );
  }
}
