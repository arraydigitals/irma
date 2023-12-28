import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../Utils/color_utils.dart';
import '../Utils/font_utils.dart';
import '../Utils/image_utils.dart';
import '../ViewModels/main_view_model.dart';
import '../app/locator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onViewModelReady: (model) {
        model.goToLogin(context);
      },
      builder: (context, model, child) {
        return SafeArea(
          top: false,
          bottom: false,
          child: Scaffold(
              // backgroundColor: Color.fromRGBO(2, 104, 81, 1),
              //ColorUtils.green,
              body: Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              ImageUtils.splashscreen,
              fit: BoxFit.cover,
            ),
          )),
        );
      },
    );
  }
}
