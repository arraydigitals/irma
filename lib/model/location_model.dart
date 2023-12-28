import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationModel {
  String title;
  String address;
  LatLng coordinates;
  LocationModel(this.address, this.coordinates, {this.title = 'Address'});
}
