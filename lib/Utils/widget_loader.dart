import 'package:flutter/material.dart';
import 'package:imraapp/Utils/extensions.dart';

class WidgetLoader extends StatelessWidget {
  const WidgetLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SizedBox(
          height: 5.i,
          width: 5.i,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.white.withOpacity(.6)),
          ),
        ),
      ),
    );
  }
}
