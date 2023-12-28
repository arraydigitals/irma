import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewerMarker {
  final String id;
  final LatLng position;
  final String icon;

  MapViewerMarker({
    required this.id,
    required this.position,
    required this.icon,
  });
}
