import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imraapp/Utils/extensions.dart';

import '../Utils/image_utils.dart';
import 'components_heightwidth.dart';

class ForwardButtonBlack extends StatelessWidget {

  final VoidCallback? onArrowTapped;

  const ForwardButtonBlack({this.onArrowTapped, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandTapWidget(
      onTap: onArrowTapped!,
      tapPadding:EdgeInsets.all(ComponentsWidthHeight.tapArea),
      child: Padding(
        padding: EdgeInsets.only(left: 4.w),
        child: SvgPicture.asset(ImageUtils.forwardIcon,
          width:ComponentsWidthHeight.forwardIconWidth,
          height: ComponentsWidthHeight.forwardIconHeight,
        ),
      ),
    );
  }
}
