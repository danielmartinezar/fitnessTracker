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
  group('ActividadesController', () {
    test('agregarActividad should add a new activity', () {
      expect(actividadesController.actividades.length, 2);

      actividadesController.agregarActividad(
          tipo: 'Running',
          cronometro: Duration(minutes: 20),
          km: 3.0,
          kcal: 200,
          avgPace: 6.5,
          estado: true,
          fecha: DateTime(2023, 4, 15),
          puntos: []);

      expect(actividadesController.actividades.length, 3);
    });

    test('eliminarActividad should remove an activity', () {
      expect(actividadesController.actividades.length, 2);

      final actividad = actividadesController.actividades[0];
      actividadesController.eliminarActividad(actividad);

      expect(actividadesController.actividades.length, 1);
    });

    test('modificarActividad should update an activity', () {
      final actividad = actividadesController.actividades[0];
      final nuevaActividad = Actividad(
          tipo: 'Cycling',
          cronometro: Duration(minutes: 30),
          km: 10.0,
          kcal: 500,
          avgPace: 7.5,
          estado: true,
          fecha: DateTime(2023, 4, 20),
          puntos: []);

      actividadesController.modificarActividad(0, nuevaActividad);

      expect(actividadesController.actividades[0].tipo, 'Cycling');
      expect(actividadesController.actividades[0].km, 10.0);
    });
  });
}
