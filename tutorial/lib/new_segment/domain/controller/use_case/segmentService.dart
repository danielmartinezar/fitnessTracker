import 'package:get/get.dart';

import '../../../../flutter_flow/flutter_flow_google_map.dart';

class SegmentService {
  late DateTime bestTime;
  getbestTime(DateTime newTime) {
    if (newTime.isBefore(bestTime)) {
      bestTime = newTime;
    }
  }

  verifyPoints(List<LatLng> route, LatLng pointA, LatLng pointB) {
    route.any((element) =>
        element.latitude == pointA.latitude &&
        element.longitude == pointA.longitude);
  }
}
