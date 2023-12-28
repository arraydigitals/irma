import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:page_transition/page_transition.dart';

import '../../Widgets/bottom_navigation_bar.dart';

class locationScreen extends StatefulWidget {
  const locationScreen({Key? key}) : super(key: key);

  @override
  State<locationScreen> createState() => _locationScreenState();
}

class _locationScreenState extends State<locationScreen> {
  Completer<GoogleMapController> _controller = Completer();
  TextEditingController _searchController = TextEditingController();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.6844, 73.0479),
    zoom: 15.00,
  );
  List<Marker> _marker = [];
  final List<Marker> _list = [
    const Marker(
      markerId: MarkerId('1'),
      position: LatLng(33.6844, 73.0479),
      infoWindow: InfoWindow(title: 'my postion'),
    ),
    const Marker(
      markerId: MarkerId('2'),
      position: LatLng(33.7175, 73.0652),
      infoWindow: InfoWindow(title: 'my postion blue area'),
    ),
    const Marker(
      markerId: MarkerId('3'),
      position: LatLng(33.738045, 73.084488),
      infoWindow: InfoWindow(title: 'my postion E sector'),
    ),
    const Marker(
      markerId: MarkerId('4'),
      position: LatLng(24.9166, 67.0864),
      infoWindow: InfoWindow(title: 'Gulshan karachi'),
    )
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _marker.addAll(_list);
    loadData();
  }

  loadData() {}
  Future<Position> getuserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print('error ' + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  final LatLng _center = const LatLng(33.6844, 73.0479);
  LatLng _selectedLocation = const LatLng(33.6844, 73.0479);
  String _address = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 5.0,
              ),
              onTap: (LatLng p) async {
                List<Placemark> placemarks = await placemarkFromCoordinates(
                  p.latitude,
                  p.longitude,
                );

                if (placemarks.isNotEmpty) {
                  setState(() {
                    _selectedLocation = p;
                    _address = placemarks[0].name! +
                        " " +
                        placemarks[0].subAdministrativeArea! +
                        " " +
                        placemarks[0].street! +
                        " " +
                        placemarks[0].country!;
                    print(_address);
                  });
                }
              },
              markers: Set<Marker>.from([
                Marker(
                  markerId: const MarkerId("selectedLocation"),
                  position: _selectedLocation,
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueRed),
                ),
              ]),
              onMapCreated: (GoogleMapController controller) {
                _controller = controller as Completer<GoogleMapController>;
              },
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(16.0),
                      hintText: "Search for your localisation",
                      suffixIcon: IconButton(
                        onPressed: () async {
                          String searchLocation = _searchController.text;
                          List<Location> locations =
                              await locationFromAddress(searchLocation);
                          if (locations.isNotEmpty) {
                            setState(() {
                              _selectedLocation = LatLng(
                                  locations.first.latitude,
                                  locations.first.longitude);
                              _address = searchLocation;
                              print(_address);
                            });
                          }
                        },
                        icon: const Icon(Icons.search),
                      )
                      // prefixIcon: Icon(Icons.location_on_outlined),
                      ),
                ),
              ),
            ),
            Positioned(
              top: 480,
              child: Container(
                height: 200,
                width: 393,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Text(
                            'Is this your location?',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.pin_drop_sharp,
                        color: Colors.red,
                      ),
                      title: Text(
                        _address,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  child: MyBottomNavBar()
                                  // HomeBottombarNavScreen()

                                  ));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            color: Color(0xFF32C6C3),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: const Text(
                            'Confirm Location',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
