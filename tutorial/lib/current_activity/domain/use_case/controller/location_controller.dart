import 'dart:async';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:collection/collection.dart';
import '../../../model/user_location.dart';
import '../location_service.dart';

class LocationController extends GetxController {
  final userLocation = UserLocation(latitude: 0, longitude: 0).obs;
  var _allPositions = <UserLocation>[].obs;
  List<UserLocation> get allPositions => _allPositions;
  var errorMsg = "".obs;
  var _liveUpdate = false.obs;
  var _pauseLocation = false.obs;
  var _indexPositionList = 0.obs;

  RxDouble _distance = (0.0).obs;
  RxDouble _kCal = (0.0).obs;
  RxDouble _avgPace = (0.0).obs;
  StreamSubscription<UserLocation>? _positionStreamSubscription;
  LocatorService service = Get.put(LocatorService());
  bool get liveUpdate => _liveUpdate.value;
  bool get isPaused => _pauseLocation.value;
  double get getDistance => _distance.value;
  double get getKcal => _kCal.value;
  double get getAvgPace => _avgPace.value;

  suscribeLocationUpdates() async {
    _liveUpdate.value = true;
    logInfo('suscribeLocationUpdates');
    await service.startStream().onError((error, stackTrace) {
      //Empezamos a stremear location
      logError("Controller got the error ${error.toString()}");
      return;
    });

    _positionStreamSubscription = service.stream.listen((event) {
      userLocation.value = event;

      //Descartar ubicaciones repetidas
      try {
        // print(
        //     "Entrooooo en el last ${_allPositions.lastOrNull?.latitude} y ${event.latitude}");
        if (_allPositions.lastOrNull?.latitude != event.latitude &&
            _allPositions.lastOrNull?.longitude != event.longitude) {
          _allPositions.add(UserLocation(
              latitude: event.latitude, longitude: event.longitude));
          if (_allPositions.length >= 2) calculateDistance();
        } else {
          print("son igualesssssssssss");
        }
        calculateKcalories();
        // calculateAvgPace();
      } catch (e) {
        print("Erroor presentado es $e");
      }
    });
  }

  unSuscribeLocationUpdates() async {
    logInfo('unSuscribeLocationUpdates');
    _liveUpdate.value = false;
    service.stopStream();
    if (_positionStreamSubscription != null) {
      _positionStreamSubscription?.cancel();
      _distance.value = 0;
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

  calculateDistance() {
    for (int i = _indexPositionList.value; i < _allPositions.length - 1; i++) {
      Future<double> distanceBetweenPoints = service
          .getDistance(_allPositions[i].latitude, _allPositions[i].longitude,
              _allPositions[i + 1].latitude, _allPositions[i + 1].longitude)
          .then(
              (distanceBetween) => _distance.value += (distanceBetween / 1000));

      _indexPositionList.value = i;
    }
    // print("distanciaaa $_distance");
  }

  Duration convertDuration(durationString) {
    List<String> durationParts = durationString.split(":");
    int hours = int.parse(durationParts[0]);
    int minutes = int.parse(durationParts[1]);
    List<String> secondsParts = durationParts[2].split(".");
    int seconds = int.parse(secondsParts[0]);
    Duration duration = Duration(
      hours: hours,
      minutes: minutes,
      seconds: seconds,
    );
    return duration;
  }

  void calculateKcalories() {
    double kCalService = service.calculateKCal(90, _distance.value);
    _kCal.value += kCalService;
    // print("El valorrrrrrrrr de las calorias es${_kCal.value}");
  }

  // void calculateAvgPace() {
  //   double avgP = service.calculateAvgPace(_d, distance)
  // }

  void resetAll() {
    _allPositions.clear();
    _avgPace.value = 0.0;
    _distance.value = 0.0;
    _kCal.value = 0.0;
    _liveUpdate.value = false;
    _pauseLocation.value = false;
    _indexPositionList.value = 0;
    unSuscribeLocationUpdates();
  }
}
