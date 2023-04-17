import 'package:geolocator/geolocator.dart';

class UserLocation {
  final double latitude;
  final double longitude;

  UserLocation({required this.latitude, required this.longitude});

  static UserLocation fromPosition(Position position) {
    return UserLocation(
        latitude: position.latitude, longitude: position.longitude);
  }

  // Añadir método fromJson
  factory UserLocation.fromJson(Map<String, dynamic> json) {
    return UserLocation(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  // Añadir método toJson
  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
