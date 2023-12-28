import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:imraapp/UI/profilescreen/newprofile%20screen.dart';
import 'package:imraapp/Utils/extensions.dart';
import 'package:imraapp/Utils/whole_loader.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/font_utils.dart';
import '../../Utils/image_utils.dart';
import '../../ViewModels/main_view_model.dart';
import '../../Widgets/bottom_navigation_bar.dart';
import '../../Widgets/page_horizontal_margin.dart';
import '../../Widgets/text_widget.dart';
import '../../app/locator.dart';
import '../profilescreen/user_profile_screen1.dart';
import '../searchScreen/search_screen2.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import 'location_screen.dart';

class HomeMapViewScreen extends StatefulWidget {
  const HomeMapViewScreen({Key? key}) : super(key: key);

  @override
  State<HomeMapViewScreen> createState() => _HomeMapViewScreenState();
}

class _HomeMapViewScreenState extends State<HomeMapViewScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  final TextEditingController searchText = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
    searchText.addListener(() {
      _onChanged();
    });
  }

//final _controller = TextEditingController();
  var uuid = new Uuid();
  String _sessionToken = '1234567890';
  List<dynamic> _placeList = [];

  _onChanged() {
    if (_sessionToken == null) {
      setState(() {
        _sessionToken = uuid.v4();
      });
    }
    getSuggestion(searchText.text);
  }

  void getSuggestion(String input) async {
    String kPLACES_API_KEY = "AIzaSyDIVIR1pR0UXt5oLbJtJhQIPoJ9jCdefLc";
    String type = '(regions)';

    try {
      String baseURL =
          'https://maps.googleapis.com/maps/api/place/autocomplete/json';
      String request =
          '$baseURL?input=$input&key=$kPLACES_API_KEY&sessiontoken=$_sessionToken';
      var response = await http.get(Uri.parse(request));
      var data = json.decode(response.body);
      print('mydata');
      print(data);
      if (response.statusCode == 200) {
        setState(() {
          _placeList = json.decode(response.body)['predictions'];
        });
      } else {
        throw Exception('Failed to load predictions');
      }
    } catch (e) {
      // toastMessage('success');
    }
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.6910, 72.98072),
    zoom: 15,
  );

  // List<String> images = [
  //   ImageUtils.marker,
  //   ImageUtils.marker,
  //   ImageUtils.marker,
  //   ImageUtils.marker,
  //   ImageUtils.marker,
  //   ImageUtils.marker
  // ];

  final List<Map<String, dynamic>> markerData = [
    {
      'image': ImageUtils.marker,
      'hospitalName': 'Seha Emirates Hospital',
      'location': const LatLng(33.6941, 72.9734),
    },
    {
      'image': ImageUtils.marker,
      'hospitalName': 'Gargash Hospital',
      'location': const LatLng(33.7008, 72.9682),
    },
    {
      'image': ImageUtils.marker,
      'hospitalName': 'Emirates Hospital Jumeirah',
      'location': const LatLng(33.6992, 72.9744),
    },
    // {
    //   'image': ImageUtils.marker,
    //   'hospitalName': 'Hospital 2',
    //   'location': const LatLng(33.6939, 72.9771),
    // },
  ];

  Uint8List? markerImage;
  final List<Marker> _markers = <Marker>[];

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  loadData() async {
    for (int i = 0; i < markerData.length; i++) {
      final Uint8List markerIcon =
          await getBytesFromAsset(markerData[i]['image'], 100);
      final hospitalName = markerData[i]['hospitalName'];
      final location = markerData[i]['location'];

      _markers.add(Marker(
        markerId: MarkerId(i.toString()),
        position: location,
        icon: BitmapDescriptor.fromBytes(markerIcon),
        infoWindow: InfoWindow(title: hospitalName),
      ));
    }
    setState(() {});
  }

  Future<Position> getuserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print('error ' + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) async {
        model.gettingHosptial(context, model.prefService.userID.toString());
      },
      builder: (context, model, child) {
        return model.hospitalLoader == true
            ? WholePageLoader()
            : SafeArea(
                top: false,
                bottom: false,
                child: Scaffold(
                  // backgroundColor: ColorUtils.tuple,
                  body: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: ColorUtils.tuple,
                        gradient:
                            LinearGradient(begin: Alignment.topCenter, colors: [
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
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(ImageUtils.logopic),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType.fade,
                                              child: const newprofile()));
                                    },
                                    child: model
                                            .prefService.userAvatar!.isNotEmpty
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            child: Image.network(
                                              model.avatar.toString(),
                                              width: 10.w,
                                              height: 10.w,
                                              //fit: BoxFit.cover
                                            ),
                                          )
                                        //: Image.asset(ImageUtils.personimg)
                                        : const Icon(
                                            Icons.person,
                                            size: 40,
                                            color: Colors.grey,
                                          ),
                                    //  Image.asset(
                                    //   // model.avatar.toString(),
                                    //   ImageUtils.personimg,
                                    //   width: 10.w,
                                    //   height: 10.w,
                                    // ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextField(
                                  controller: searchText,
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.only(
                                        left: 15,
                                        top: 15,
                                      ),
                                      border: InputBorder.none,
                                      hintText: 'Search ',
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                PageTransition(
                                                    type:
                                                        PageTransitionType.fade,
                                                    child:
                                                        const SeachScreen2()));
                                          },
                                          icon: const Icon(Icons.search))),
                                ),
                                // SvgPicture.asset(
                                //       ImageUtils.search,
                                //       width: 10,
                                //       height: 10,
                                //       fit: BoxFit.cover,
                                //     ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30))),
                            child: Column(
                              children: [
                                // Expanded(
                                //     child: ListView.builder(
                                //         physics: NeverScrollableScrollPhysics(),
                                //         shrinkWrap: true,
                                //         itemCount: _placeList.length,
                                //         itemBuilder: (context, index) {
                                //           return ListTile(
                                //             title: Text(_placeList[index]
                                //                 ["description"]),
                                //           );
                                //         })),
                                Expanded(
                                  child: Stack(
                                    children: [
                                      GoogleMap(
                                        initialCameraPosition: _kGooglePlex,
                                        mapType: MapType.normal,
                                        myLocationButtonEnabled: true,
                                        myLocationEnabled: true,
                                        markers: Set<Marker>.of(_markers),
                                        onMapCreated:
                                            (GoogleMapController controller) {
                                          _controller.complete(controller);
                                        },
                                      ),
                                      // Image.asset(
                                      //   ImageUtils.fullmap,
                                      //   width: double.infinity,
                                      //   fit: BoxFit.cover,
                                      // ),
                                      Positioned(
                                        top: 30,
                                        left: 70.w,
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                PageTransition(
                                                    type:
                                                        PageTransitionType.fade,
                                                    child: MyBottomNavBar(
                                                        //index: 1,
                                                        )

                                                    //HomeBottombarNavScreen()

                                                    ));
                                            //
                                          },
                                          child: Container(
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.white),
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                      ImageUtils.vectoricon),
                                                  SizedBox(
                                                    width: 3.w,
                                                  ),
                                                  Text(
                                                    'List View',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontFamily:
                                                            FontUtils.proxima,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            ColorUtils.tuple),
                                                  ),
                                                ],
                                              )),
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 250,
                                        ),
                                        child: SizedBox(
                                          height: 20.h,
                                          child: ListView.builder(
                                            physics:
                                                const BouncingScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return Row(
                                                children: [
                                                  Container(
                                                    //  height: 50,
                                                    width: 80.w,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            // color: Color(0xFF9399A6)
                                                            color: ColorUtils
                                                                .grayf),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: Colors.white),
                                                    child: Column(
                                                      children: [
                                                        ListTile(
                                                          leading: Image
                                                              .network(model
                                                                  .hospital![
                                                                      index]
                                                                  .avatar
                                                                  .toString()),
                                                          title: TextWidget(
                                                            textValue: model
                                                                .hospital![
                                                                    index]
                                                                .fullname
                                                                .toString(),
                                                            fontFamily:
                                                                FontUtils
                                                                    .proxima,
                                                            fontSize: 2.3.t,
                                                            textColor:
                                                                ColorUtils
                                                                    .black,
                                                          ),
                                                          subtitle: Row(
                                                            children: [
                                                              // ignore: prefer_const_constructors
                                                              Icon(
                                                                Icons.star,
                                                                color: Colors
                                                                    .yellow,
                                                                size: 20,
                                                              ),
                                                              SizedBox(
                                                                width: 2.w,
                                                              ),
                                                              TextWidget(
                                                                textValue:
                                                                    "4.5 |  2.7 km",
                                                                fontFamily:
                                                                    FontUtils
                                                                        .proxima,
                                                                fontSize: 2.2.t,
                                                                textColor:
                                                                    ColorUtils
                                                                        .black,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Row(
                                                            // mainAxisAlignment:
                                                            //     MainAxisAlignment.spaceAround,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Container(
                                                                      padding: const EdgeInsets
                                                                          .all(
                                                                          13),
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                              9),
                                                                          color: const Color
                                                                              .fromRGBO(
                                                                              50,
                                                                              198,
                                                                              195,
                                                                              0.09)),
                                                                      child: Image.asset(
                                                                          ImageUtils
                                                                              .save)),
                                                                  SizedBox(
                                                                    width: 3.w,
                                                                  ),
                                                                  InkWell(
                                                                    onTap: () {
                                                                      _shareModalBottomSheet(
                                                                          context);
                                                                    },
                                                                    child: Container(
                                                                        padding: const EdgeInsets
                                                                            .all(
                                                                            13),
                                                                        decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(
                                                                                9),
                                                                            color: const Color.fromRGBO(
                                                                                50,
                                                                                198,
                                                                                195,
                                                                                0.09)),
                                                                        child: Image.asset(
                                                                            ImageUtils.share)),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                width: 8.2.w,
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  Navigator.push(
                                                                      context,
                                                                      PageTransition(
                                                                          type: PageTransitionType
                                                                              .fade,
                                                                          child:
                                                                              locationScreen()));
                                                                },
                                                                child:
                                                                    Container(
                                                                  padding: const EdgeInsets
                                                                      .only(
                                                                      left: 15,
                                                                      top: 10,
                                                                      bottom:
                                                                          10,
                                                                      right:
                                                                          15),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    color: const Color(
                                                                        0xFF32C6C3),
                                                                  ),
                                                                  child:
                                                                      TextWidget(
                                                                    textValue:
                                                                        "Get Direction",
                                                                    fontFamily:
                                                                        FontUtils
                                                                            .interMedium,
                                                                    fontSize:
                                                                        2.t,
                                                                    textColor:
                                                                        ColorUtils
                                                                            .white,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                ],
                                              );
                                            },
                                            itemCount:
                                                model.hospital?.length ?? 0,
                                          ),
                                        ),
                                      ),

                                      // Padding(
                                      //   padding:
                                      //       const EdgeInsets.only(left: 10, top: 200),
                                      //   child: SizedBox(
                                      //     height: 24.h,
                                      //     child: ListView(
                                      //       scrollDirection: Axis.horizontal,
                                      //       children: [
                                      //         SizedBox(
                                      //           width: 3.w,
                                      //         ),
                                      //         Container(
                                      //           //  height: 50,
                                      //           width: 90.w,
                                      //           decoration: BoxDecoration(
                                      //               border: Border.all(
                                      //                   // color: Color(0xFF9399A6)
                                      //                   color: ColorUtils.grayf),
                                      //               borderRadius:
                                      //                   BorderRadius.circular(20),
                                      //               color: Colors.white),
                                      //           child: Column(
                                      //             children: [
                                      //               ListTile(
                                      //                 leading:
                                      //                     Image.asset(ImageUtils.img),
                                      //                 title: TextWidget(
                                      //                   textValue:
                                      //                       "Emirates Hospital Jumeirah",
                                      //                   fontFamily: FontUtils.proxima,
                                      //                   fontSize: 2.6.t,
                                      //                   textColor: ColorUtils.black,
                                      //                 ),
                                      //                 subtitle: Row(
                                      //                   children: [
                                      //                     // ignore: prefer_const_constructors
                                      //                     Icon(
                                      //                       Icons.star,
                                      //                       color: Colors.yellow,
                                      //                       size: 20,
                                      //                     ),
                                      //                     SizedBox(
                                      //                       width: 2.w,
                                      //                     ),
                                      //                     TextWidget(
                                      //                       textValue:
                                      //                           "4.5 |  2.7 km",
                                      //                       fontFamily:
                                      //                           FontUtils.proxima,
                                      //                       fontSize: 2.2.t,
                                      //                       textColor:
                                      //                           ColorUtils.black,
                                      //                     ),
                                      //                   ],
                                      //                 ),
                                      //               ),
                                      //               Padding(
                                      //                 padding:
                                      //                     const EdgeInsets.all(8.0),
                                      //                 child: Row(
                                      //                   // mainAxisAlignment:
                                      //                   //     MainAxisAlignment.spaceAround,
                                      //                   children: [
                                      //                     Row(
                                      //                       children: [
                                      //                         Container(
                                      //                             padding:
                                      //                                 const EdgeInsets
                                      //                                     .all(13),
                                      //                             decoration: BoxDecoration(
                                      //                                 borderRadius:
                                      //                                     BorderRadius
                                      //                                         .circular(
                                      //                                             9),
                                      //                                 color: const Color
                                      //                                     .fromRGBO(
                                      //                                     50,
                                      //                                     198,
                                      //                                     195,
                                      //                                     0.09)),
                                      //                             child: Image.asset(
                                      //                                 ImageUtils
                                      //                                     .save)),
                                      //                         SizedBox(
                                      //                           width: 3.w,
                                      //                         ),
                                      //                         InkWell(
                                      //                           onTap: () {
                                      //                             _shareModalBottomSheet(
                                      //                                 context);
                                      //                           },
                                      //                           child: Container(
                                      //                               padding:
                                      //                                   const EdgeInsets
                                      //                                       .all(13),
                                      //                               decoration: BoxDecoration(
                                      //                                   borderRadius:
                                      //                                       BorderRadius
                                      //                                           .circular(
                                      //                                               9),
                                      //                                   color: const Color
                                      //                                       .fromRGBO(
                                      //                                       50,
                                      //                                       198,
                                      //                                       195,
                                      //                                       0.09)),
                                      //                               child: Image.asset(
                                      //                                   ImageUtils
                                      //                                       .share)),
                                      //                         ),
                                      //                       ],
                                      //                     ),
                                      //                     SizedBox(
                                      //                       width: 8.2.w,
                                      //                     ),
                                      //                     Container(
                                      //                       padding:
                                      //                           const EdgeInsets.only(
                                      //                               left: 15,
                                      //                               top: 10,
                                      //                               bottom: 10,
                                      //                               right: 15),
                                      //                       decoration: BoxDecoration(
                                      //                         borderRadius:
                                      //                             BorderRadius
                                      //                                 .circular(10),
                                      //                         color: const Color(
                                      //                             0xFF32C6C3),
                                      //                       ),
                                      //                       child: TextWidget(
                                      //                         textValue:
                                      //                             "Get Direction",
                                      //                         fontFamily: FontUtils
                                      //                             .interMedium,
                                      //                         fontSize: 2.t,
                                      //                         textColor:
                                      //                             ColorUtils.white,
                                      //                       ),
                                      //                     )
                                      //                   ],
                                      //                 ),
                                      //               )
                                      //             ],
                                      //           ),
                                      //         ),
                                      //       ],
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                )
                              ],
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

// share modelBOttom sheet
void _shareModalBottomSheet(context) {
  showModalBottomSheet(
      backgroundColor: Colors.grey,
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: 40.w,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: PageHorizontalMargin(
            widget: Column(
              children: <Widget>[
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    TextWidget(
                      textValue: "Share",
                      fontFamily: FontUtils.interMedium,
                      fontSize: 2.3.t,
                      textColor: ColorUtils.black,
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(ImageUtils.messanger),
                    Image.asset(ImageUtils.whatapp1),
                    Image.asset(ImageUtils.mail),
                    Image.asset(ImageUtils.skype),
                    Image.asset(ImageUtils.moreh),
                  ],
                )
              ],
            ),
          ),
        );
      });
}
