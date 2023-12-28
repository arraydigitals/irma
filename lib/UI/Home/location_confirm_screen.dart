import 'dart:async';

import 'package:expand_tap_area/expand_tap_area.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imraapp/Utils/extensions.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../App/locator.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/font_utils.dart';
import '../../Utils/image_utils.dart';
import '../../ViewModels/main_view_model.dart';
import '../../Widgets/bottom_navigation_bar.dart';
import '../../Widgets/page_horizontal_margin.dart';
import '../../Widgets/text_widget.dart';
import 'home_bottombarnav_screen.dart';

class LocationsConfirmScreen extends StatefulWidget {
  const LocationsConfirmScreen({Key? key}) : super(key: key);

  @override
  State<LocationsConfirmScreen> createState() => _LocationsConfirmScreenState();
}

class _LocationsConfirmScreenState extends State<LocationsConfirmScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

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
              backgroundColor: Colors.white,
              body: Container(
                height: double.infinity,
                width: double.infinity,
                //color: Colors.amber,
                child: Stack(
                  // fit: StackFit.loose,
                  // alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset(
                      ImageUtils.fullmap,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 130, left: 20, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            // color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                left: 15,
                                top: 15,
                              ),
                              border: InputBorder.none,
                              hintText: 'Search ',
                              suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.search))),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 530),
                      child: Container(
                        // padding: EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: PageHorizontalMargin(
                          widget: Column(
                            children: [
                              SizedBox(
                                height: 3.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  children: [
                                    Text(
                                      'Is this your location?',
                                      style: TextStyle(
                                          fontFamily: FontUtils.proxima,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              ListTile(
                                leading: Image.asset(ImageUtils.pinmaploc),
                                title: Text(
                                  'University City, University Street \n Sharjah - United Arab Emirates',
                                  style: TextStyle(
                                      fontFamily: FontUtils.proxima,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
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
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType.fade,
                                              child: MyBottomNavBar()
                                              // HomeBottombarNavScreen()

                                              ));
                                    },
                                    child: Text(
                                      "Confirm Location",
                                      style: TextStyle(
                                        fontFamily: FontUtils.interSemiBold,
                                        fontSize: 1.8.t,
                                        color: ColorUtils.white,
                                        // Color.fromRGBO(2, 104, 81, 1)
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }
}
