import 'package:flutter_test/flutter_test.dart';
import 'package:tutorial/current_activity/domain/use_case/controller/location_controller.dart';
import 'package:tutorial/current_activity/domain/use_case/location_service.dart';

void main() {
  late LocatorService service;
  late LocationController controller;
  setUp(() {
    service = LocatorService();
  });
  group("Location Service", () {
    test('getDistance returns the distance between two real locations',
        () async {
      final latA = 40.712776;
      final longA = -74.005974;
      final latB = 37.7749;
      final longB = -122.4194;

      final result = await service.getDistance(latA, longA, latB, longB);

      expect(result, closeTo(4133714.389661535, 0.1));
    });
    test('calculateAvgPace returns the correct value', () {
      final duration = Duration(minutes: 30);
      final distance = 5.0;
      final expected = 6.0; // 30 minutes / 5 km = 6 min/km

      final result = service.calculateAvgPace(duration, distance);

      expect(result, equals(expected));
    });
    test('calculateKCal returns the approximate number of calories burned', () {
      final weight = 70.0; // in kilograms
      final distance = 5.0;
      final expected = 262.5; // assuming a factor of 0.75 and a weight of 70

      final result = service.calculateKCal(weight, distance);

      expect(result, equals(expected));
    });
  });
}
