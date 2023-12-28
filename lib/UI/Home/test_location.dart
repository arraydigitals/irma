
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:imraapp/Utils/location_service.dart';

import '../../Utils/size_config.dart';
import '../../model/location_model.dart';
import 'textfiled_listerner.dart';




class LocationSelectScreen extends StatefulWidget {
  LocationModel? currentLocation;
  final BuildContext parentContext;
  final bool createAddress;
  final bool isBusy;
  final void Function(BuildContext context, LocationModel selectedLocation)
      onLocationSelection;
  LocationSelectScreen(this.parentContext, this.onLocationSelection,
      {this.currentLocation,
      this.createAddress = false,
      this.isBusy = false,
      super.key});

  @override
  State<LocationSelectScreen> createState() => _LocationSelectScreenState();
}

class _LocationSelectScreenState extends State<LocationSelectScreen> {
  final _searchTextController = TextEditingController();
  final _titleTextController = TextEditingController();
 
  final _locationService = LocationService();
  LatLng? startLocation;
  GoogleMapController? mapPickerController;
  CameraPosition? cameraPosition;

  @override
  Widget build(BuildContext context) {
  
    return FutureBuilder(
        future: getCurrentLocation(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              widget.currentLocation != null) {
            startLocation = LatLng(
                widget.currentLocation?.coordinates.latitude ?? 0.0,
                widget.currentLocation?.coordinates.longitude ?? 0.0);
            _searchTextController.text = widget.currentLocation?.address ?? '';
            return Scaffold(
              extendBodyBehindAppBar: true,
           
              body: Stack(
                alignment: Alignment.center,
                children: [
                  TextFieldListener(
                    child: Stack(
                      children: [
                        GoogleMap(
                          myLocationButtonEnabled: false,
                          //Map widget from google_maps_flutter package
                          zoomGesturesEnabled:
                              true, //enable Zoom in, out on map
                          zoomControlsEnabled: false,

                          initialCameraPosition: CameraPosition(
                            //innital position in map
                            target: startLocation!, //initial position
                            zoom: 14.0, //initial zoom level
                          ),
                          mapType: MapType.normal, //map type
                          onMapCreated: (controller) {
                            //method called when map is created
                            //   setState(() {
                            mapPickerController = controller;
                            

                            //  });
                          },
                          onCameraMove: (CameraPosition tempCameraPosition) {
                            cameraPosition =
                                tempCameraPosition; //when map is dragging
                          },
                          onCameraIdle: () async {
                            //when map drag stops
                            var address = await _locationService
                                .getAddressFromCoordinates(LatLng(
                                    cameraPosition!.target.latitude,
                                    cameraPosition!.target.longitude));
                            widget.currentLocation!.address = address;
                            //  setState(() {
                            _searchTextController.text = address;
                            //});
                          },
                        ),
                       
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return  Container();
        });
  }

  

  Future<void> getCurrentLocation() async {
    var loc = await _locationService.getCurrentLocation();
    widget.currentLocation = LocationModel(
      title: _titleTextController.text,
      loc.address,
      LatLng(loc.coordinates.latitude, loc.coordinates.longitude),
    );
  }

 
}
