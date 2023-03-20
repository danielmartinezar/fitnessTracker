import 'dart:async';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../../../model/user_location.dart';
import '../location_service.dart';

class LocationController extends GetxController {
  final userLocation = UserLocation(latitude: 0, longitude: 0).obs;
  var _allPositions = <UserLocation>[].obs;
  List<UserLocation> get allPositions => _allPositions;

  var errorMsg = "".obs;
  var _liveUpdate = false.obs;
  var _pauseLocation = false.obs;
  StreamSubscription<UserLocation>? _positionStreamSubscription;
  LocatorService service = Get.put(LocatorService());
  bool get liveUpdate => _liveUpdate.value;
  bool get isPaused => _pauseLocation.value;
  suscribeLocationUpdates() async {
    _liveUpdate.value = true;
    logInfo('suscribeLocationUpdates');
    await service.startStream().onError((error, stackTrace) {
      //Empezamos a stremear location
      logError("Controller got the error ${error.toString()}");
      return;
    });

    _positionStreamSubscription = service.stream.listen((event) {
      logInfo("Controller event ${event.latitude}");
      userLocation.value = event;
      _allPositions.add(
          UserLocation(latitude: event.latitude, longitude: event.longitude));
    });
  }

  unSuscribeLocationUpdates() async {
    logInfo('unSuscribeLocationUpdates');
    _liveUpdate.value = false;
    service.stopStream();
    if (_positionStreamSubscription != null) {
      _positionStreamSubscription?.cancel();
    } else {
      logError("Controller _positionStreamSubscription is null");
    }
  }

  pauseLocationUpdates() async {
    service.pauseStream();
    if (_positionStreamSubscription != null && _pauseLocation.value == false) {
      _positionStreamSubscription?.pause();
      _pauseLocation.value = true;
      print("pauseddd!!!");
    } else {
      logError("Controller _positionStreamSubscription is null");
    }
  }

  resumeLocationUpdates() async {
    service.resumeStream();
    if (_positionStreamSubscription != null && _pauseLocation.value) {
      _positionStreamSubscription?.resume();
      _pauseLocation.value = false;
      print("Resumed!!");
    } else {
      logError("Controller _positionStreamSubscription is null");
    }
  }
}
