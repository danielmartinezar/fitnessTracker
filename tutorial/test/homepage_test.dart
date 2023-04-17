import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:tutorial/home_page/home_page_widget.dart';
import 'package:tutorial/home_page/actividades_controller.dart';
import 'package:tutorial/home_page/actividad.dart';

void main() {
  late ActividadesController actividadesController;
  setUp(() {
    actividadesController = ActividadesController();
  });
  setUpAll(() {
    Get.testMode = true;
  });

  tearDownAll(() {
    Get.reset();
  });

  testWidgets('HomePageWidget displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(GetMaterialApp(home: HomePageWidget()));

    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
  });

  testWidgets('HomePageWidget displays activity cards',
      (WidgetTester tester) async {
    await tester.pumpWidget(GetMaterialApp(home: HomePageWidget()));
    await tester.pump();

    expect(find.text('Running'), findsOneWidget);
    expect(find.text('Cycling'), findsOneWidget);
  });

  testWidgets('HomePageWidget displays AlertDialog on FAB press',
      (WidgetTester tester) async {
    await tester.pumpWidget(GetMaterialApp(home: HomePageWidget()));
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Elige una opción'), findsOneWidget);
    expect(find.text('¿Quieres trotar o andar en bicicleta?'), findsOneWidget);
  });
}
