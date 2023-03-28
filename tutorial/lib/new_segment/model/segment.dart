import 'package:google_maps_flutter/google_maps_flutter.dart';

class Segment {
  late LatLng initialPoint;
  late LatLng finalPoint;
  late String nameOfSegment;

  Segment(
      {required this.nameOfSegment,
      required this.initialPoint,
      required this.finalPoint});
}
