import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:loggy/loggy.dart';
import '../../model/user_location.dart';

class LocatorService {
  StreamSubscription<Position>? _positionStreamSubscription;
  final StreamController<UserLocation> _locationController =
      StreamController<UserLocation>.broadcast();

  Geolocator geolocator = Geolocator();
  Stream<UserLocation> get stream => _locationController.stream;

  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 2,
  );
  Future<void> startStream() async {
    LocationPermission permission = await Geolocator.requestPermission();
    logInfo("startStream with Locator library");
    _positionStreamSubscription =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .handleError((onError) {
      logError("Got error from Geolocator stream");
      return Future.error(onError.toString());
    }).listen((event) {
      _locationController.add(UserLocation.fromPosition(event));
    });
  }

  pauseStream() {
    if (_positionStreamSubscription != null) {
      print("entra1");
      _positionStreamSubscription!.cancel();
    } else {
      logError("stopStream _positionStreamSubscription is null");
    }
  }

  resumeStream() {
    if (_positionStreamSubscription != null) {
      startStream();
    } else {
      logError("stopStream _positionStreamSubscription is null");
    }
  }

  stopStream() {
    if (_positionStreamSubscription != null) {
      _positionStreamSubscription!.cancel();
    } else {
      logError("stopStream _positionStreamSubscription is null");
    }
  }

  Future<double> getDistance(
      double latA, double longA, double latB, double longB) async {
    double distanceBetweenPoints =
        await Geolocator.distanceBetween(latA, longA, latB, longB);
    // print(
    // "******Distancia calculada en 2 puntos: ${distanceBetweenPoints / 1000}");
    return distanceBetweenPoints;
  }

  double calculateAvgPace(double duration, double distance) {
    final avgPace = duration / distance;
    return avgPace;
  }

  double calculateKCal(double weight, double distance) {
    final double FACTOR = 0.75;
    // Convertir segundos a horas
    double caloriesPerKilometer = weight * FACTOR;
    double caloriesBurned = caloriesPerKilometer * distance;
    return caloriesBurned;
  }
}
