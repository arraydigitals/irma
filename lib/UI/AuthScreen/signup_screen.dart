import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imraapp/UI/AuthScreen/login_screen.dart';
import 'package:imraapp/Utils/extensions.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/font_utils.dart';
import '../../Utils/image_utils.dart';
import '../../Utils/widget_loader.dart';
import '../../ViewModels/main_view_model.dart';
import '../../Widgets/customtextfield.dart';
import '../../Widgets/page_horizontal_margin.dart';
import '../../Widgets/text_widget.dart';
import '../../Widgets/textfiled_widget.dart';
import '../../app/locator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool  _acc = false;
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
            body: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: ColorUtils.tuple,
                  gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                    ColorUtils.tuple,
                    ColorUtils.tuple,
                    ColorUtils.tuple,
                    // Colors.orange,
                    // Colors.orange
                  ])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 35,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Image.asset(ImageUtils.logopic)],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: PageHorizontalMargin(
                        widget: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              const SizedBox(
                                height: 3,
                              ),
                              TextWidget(
                                textValue: "Sign Up",
                                fontFamily: FontUtils.poppinsBold,
                                fontSize: 5.t,
                                textColor: ColorUtils.black,
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              // ignore: prefer_const_constructors
                              // CustomTextFiledForm(
                              //   controller: model.signupNameController,
                              //   hintText: "Full Name",
                              //   prefixicon: ImageUtils.person,
                              // ),
                              CustomTextFiledForm(
                                  controller: model.signupNameController,
                                  hintText: "Name",
                                  prefixicon: ImageUtils.person),
                              SizedBox(
                                height: 2.h,
                              ),
                              CustomTextFiledForm(
                                controller: model.signupEmailController,
                                hintText: "Email",
                                prefixicon: ImageUtils.email2,
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              CustomTextFiledForm(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                // maxLength: 11,
                                textInputType: TextInputType.phone,
                                controller: model.signupPhoneController,
                                hintText: "Phone",
                                prefixicon: ImageUtils.call,
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              TextFormFieldCustom(
                                controller: model.signupPasswordController,
                                hintText: "Password",
                                // prefixicon: ImageUtils.keyicon,
                                // sufixicon: ImageUtils.key1icon,
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              TextFormFieldCustom(
                                controller:
                                    model.signupConfirmPasswordController,
                                hintText: " Confirm Password",
                                // prefixicon: ImageUtils.keyicon,
                                // sufixicon: ImageUtils.key1icon,
                              ),

                              SizedBox(
                                height: 1.h,
                              ),

                              Row(
                                children: [
                                  Checkbox(
                                      value:model.acceptTerms,
                                      onChanged: (value) {
                                        setState(() {
                                         model. acceptTerms = value!;
                                        });
                                      }),
                                  //SvgPicture.asset(ImageUtils.checkbox),
                                  // SizedBox(width: 1.w),
                                  TextWidget(
                                    textValue: "I accept terms & conditions",
                                    fontFamily: FontUtils.proxima,
                                    fontSize: 1.6.t,
                                    textColor: ColorUtils.textcolor,
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 2.h,
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
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      onPressed: () async {
                                        model.loadingWidget == true
                                            ? () {}
                                            : await model.doUserSignup(
                                                context,
                                                model.signupNameController.text,
                                                model
                                                    .signupEmailController.text,
                                                model
                                                    .signupPhoneController.text,
                                                model.signupPasswordController
                                                    .text,
                                                model
                                                    .signupConfirmPasswordController
                                                    .text);
                                        // Navigator.push(
                                        //     context,
                                        //     PageTransition(
                                        //         type: PageTransitionType.fade,
                                        //         child: const ProfileScreen1()));
                                      },
                                      child: model.loadingWidget == false
                                          ? Text(
                                              "Sign Up",
                                              style: TextStyle(
                                                fontFamily:
                                                    FontUtils.interSemiBold,
                                                fontSize: 1.8.t,
                                                color: ColorUtils.white,
                                                // Color.fromRGBO(2, 104, 81, 1)
                                              ),
                                            )
                                          : WidgetLoader()),
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextWidget(
                                    textValue: "Already have an account?",
                                    fontFamily: FontUtils.interMedium,
                                    fontSize: 1.8.t,
                                    textColor: ColorUtils.textcolor,
                                  ),
                                  // SizedBox(
                                  //   width: 1.w,
                                  // ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType.fade,
                                              child: const Login()));
                                    },
                                    child: TextWidget(
                                      textValue: "Login",
                                      fontFamily: FontUtils.interMedium,
                                      fontSize: 1.8.t,
                                      textColor: ColorUtils.tuple,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                            ],
                          ),
                        ),
                      ),
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
