import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tutorial/current_activity/current_activity_widget.dart';

void main() {
  group('CurrentActivityWidget', () {
    testWidgets('displays the correct type', (WidgetTester tester) async {
      // Create a widget testbed with the CurrentActivityWidget
      // and the desired type.
      await tester.pumpWidget(
          GetMaterialApp(home: CurrentActivityWidget(type: 'Running')));

      // Find the Text widget that displays the activity type.
      final activityTypeTextFinder = find.text('Running');

      // Verify that the Text widget displays the correct activity type.
      expect(activityTypeTextFinder, findsOneWidget);
    });
  });
}
