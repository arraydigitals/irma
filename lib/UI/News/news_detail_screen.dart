import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imraapp/Utils/extensions.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/font_utils.dart';
import '../../Utils/image_utils.dart';
import '../../ViewModels/main_view_model.dart';
import '../../Widgets/custom_text_field.dart';
import '../../Widgets/customtextfield.dart';
import '../../Widgets/page_horizontal_margin.dart';
import '../../Widgets/text_widget.dart';
import '../../Widgets/textfiled_widget.dart';
import '../../app/locator.dart';

class NewsDetailsScreen extends StatefulWidget {
  const NewsDetailsScreen({Key? key}) : super(key: key);

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
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
                    height: 60,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Image.asset(ImageUtils.back)),
                            SizedBox(
                              width: 4.2.w,
                            ),
                            TextWidget(
                              textValue: "News Details",
                              fontFamily: FontUtils.interMedium,
                              fontSize: 2.t,
                              textColor: ColorUtils.white,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: SingleChildScrollView(
                        child: PageHorizontalMargin(
                          widget: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Image.asset(ImageUtils.hospital)),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Lorem ipsum dolor sit amet consectetur. Amet aenean in dui vel nibh mus faucibus sit orci. Feugiat lacus arcu ut mattis.",
                                      style: TextStyle(
                                          fontFamily: FontUtils.proxima,
                                          fontSize: 16,
                                          //color: Color(0xFF898C94),
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "25 Dec, 08:00PM",
                                      style: TextStyle(
                                        fontFamily: FontUtils.proxima,
                                        fontSize: 12,
                                        color: Color(0xFF9399A6),
                                        //fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Divider(
                                thickness: 1,
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Lorem ipsum dolor sit amet consectetur. Nulla potenti montes vitae ac ornare. Pulvinar urna elementum sed consectetur dictumst et. Pretium sapien mauris amet pharetra a pharetra. Dolor tellus sed quam dui. Ante vulputate semper sit velit ac auctor. Morbi orci tempor viverra pulvinar. \n \n  In sit sed lobortis ullamcorper mi vitae.Pellentesque vestibulum at massa posuere mollis. Nunc sapien senectus quis sed eget vel quis curabitur. Nulla volutpat mollis in ut sed. Gravida nec mattis fames id ultrices elementum pharetra montes. Nulla sed vulputate amet tempor gravida cursus. Ultrices quis ornare orci adipiscing. Quam egestas enim sem sed sed proin bibendum. Lectus elit et pellentesque ut. Elit id mattis id vel neque arcu massa et amet. Dolor ut integer nisl sagittis placerat turpis commodo id sagittis. In quisque tincidunt id vulputate at orci. Aliquam bibendum lectus amet volutpat. Lacus aliquet eu hendrerit eget.Egestas nisi rutrum interdum pretium integer amet integer. Sollicitudin molestie mattis dui pharetra sed sed rhoncus dui tempor. Ullamcorper bibendum blandit tempor porttitor lorem lectus sit at egestas. Commodo justo dolor aenean ut libero nisi vitae quis. At dui non et ipsum. Nisl nibh congue massa euismod nunc lectus aliquam ut vitae. Dictumst quisque diam ac sapien lorem sem bibendum consectetur. Interdum dui habitant morbi et cum. Praesent amet sed mauris turpis faucibus posuere in. In semper enim sit quisque sit amet. Eget enim dui est mi cum tellus. Tristique maecenas feugiat.",
                                      style: TextStyle(
                                        fontFamily: FontUtils.proxima,
                                        fontSize: 13,
                                        color: Color(0xFF898C94),
                                        //  fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5.h,
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
