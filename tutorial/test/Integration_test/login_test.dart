import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:integration_test/integration_test.dart';
import 'package:tutorial/backend/firebase/firebase_config.dart';
import 'package:tutorial/flutter_flow/flutter_flow_theme.dart';
import 'package:tutorial/flutter_flow/flutter_flow_widgets.dart';
import 'package:tutorial/flutter_flow/internationalization.dart';
import 'package:tutorial/home_page/home_page_widget.dart';
import 'package:tutorial/index.dart';
import 'package:tutorial/login/login_widget.dart';
import 'package:tutorial/main.dart';

void main() {

  group('integration test', () {
    
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized() as IntegrationTestWidgetsFlutterBinding;
    
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
      testWidgets('Flujo de autenticacion login con usuario no creado', (tester) async{
        Widget w = await createHomeScreen();
        await tester.pumpWidget(w);

        await tester.tap(find.byKey(Key('loginbutton')));
        await tester.pump();
        await tester.pump(const Duration(seconds: 2));

        expect(find.text("Error al inicir sesion,verificar los datos e intente nuevamente"), findsOneWidget);
        await tester.tap(find.text('ok'));
        await tester.pump();
        await tester.pump(const Duration(seconds: 1));

        await tester.enterText(find.widgetWithText(TextFormField, 'Enter your email...' ), 'admin@outlook.com');
        await tester.pump();
        await tester.pump(const Duration(seconds: 1));

        await tester.enterText(find.widgetWithText(TextFormField, 'Please enter your password...' ), 'adminpasw');
        await tester.pump();
        await tester.pump(const Duration(seconds: 1));

        await tester.tap(find.byKey(Key('loginbutton')));
        await tester.pump();
        await tester.pump(const Duration(seconds: 2));

        expect(find.text("Sesion iniciada correctamente"), findsOneWidget);
        await tester.tap(find.text('ok'));
        await tester.pump();
        await tester.pump(const Duration(seconds: 2));

        expect(find.byType(HomePageWidget),findsOneWidget);
        await tester.pump();
        await tester.pump(const Duration(seconds: 2));

      });

      testWidgets('Flujo de autenticacion login creando usuario', (tester) async{
        Widget w = await createHomeScreen();
        await tester.pumpWidget(w);

        await tester.tap(find.byKey(Key('signinbutton')));
        await tester.pump();
        await tester.pump(const Duration(seconds: 2));

        expect(find.byType(SigninWidget),findsOneWidget);
        await tester.pump();
        await tester.pump(const Duration(seconds: 1));

        await tester.enterText(find.widgetWithText(TextFormField, 'Enter your email...' ), 'pepe@outlook.com');
        await tester.pump();
        await tester.pump(const Duration(seconds: 1));

        await tester.enterText(find.byKey(Key('password')),'pepepasw');
        await tester.pump();
        await tester.pump(const Duration(seconds: 1));

        await tester.enterText(find.byKey(Key('Confirm Password')),'pepepasw');
        await tester.pump();
        await tester.pump(const Duration(seconds: 1));

        await tester.tap(find.byKey(Key('createbutton')));
        await tester.pump();
        await tester.pump(const Duration(seconds: 2));

        expect(find.text("Cuenta creada"), findsOneWidget);
        await tester.tap(find.text('ok'));
        await tester.pump();
        await tester.pump(const Duration(seconds: 2));

        expect(find.byType(LoginWidget),findsOneWidget);
        await tester.pump();
        await tester.pump(const Duration(seconds: 2));
      
        await tester.enterText(find.widgetWithText(TextFormField, 'Enter your email...' ), 'pepe@outlook.com');
        await tester.pump();
        await tester.pump(const Duration(seconds: 1));

        await tester.enterText(find.widgetWithText(TextFormField, 'Please enter your password...' ), 'pepepasw');
        await tester.pump();
        await tester.pump(const Duration(seconds: 1));

        await tester.tap(find.byKey(Key('loginbutton')));
        await tester.pump();
        await tester.pump(const Duration(seconds: 2));

        expect(find.text("Sesion iniciada correctamente"), findsOneWidget);
        await tester.tap(find.text('ok'));
        await tester.pump();
        await tester.pump(const Duration(seconds: 2));

        expect(find.byType(HomePageWidget),findsOneWidget);
        await tester.pump();
        await tester.pump(const Duration(seconds: 2));
      });

      testWidgets('Flujo de autenticacion login usuario anteriormente creado', (tester) async{
        Widget w = await createHomeScreen();
        await tester.pumpWidget(w);

        await tester.tap(find.byKey(Key('signinbutton')));
        await tester.pump();
        await tester.pump(const Duration(seconds: 2));

        expect(find.byType(SigninWidget),findsOneWidget);
        await tester.pump();
        await tester.pump(const Duration(seconds: 1));

        await tester.enterText(find.widgetWithText(TextFormField, 'Enter your email...' ), 'reind@outlook.com');
        await tester.pump();
        await tester.pump(const Duration(seconds: 1));

        await tester.enterText(find.byKey(Key('password')),'reindpasw');
        await tester.pump();
        await tester.pump(const Duration(seconds: 1));

        await tester.enterText(find.byKey(Key('Confirm Password')),'reindpasw');
        await tester.pump();
        await tester.pump(const Duration(seconds: 1));

        await tester.tap(find.byKey(Key('createbutton')));
        await tester.pump();
        await tester.pump(const Duration(seconds: 2));

        expect(find.text("Cuenta creada"), findsOneWidget);
        await tester.tap(find.text('ok'));
        await tester.pump();
        await tester.pump(const Duration(seconds: 2));

        expect(find.byType(LoginWidget),findsOneWidget);
        await tester.pump();
        await tester.pump(const Duration(seconds: 2));

        await tester.enterText(find.widgetWithText(TextFormField, 'Enter your email...' ), 'pepe@outlook.com');
        await tester.pump();
        await tester.pump(const Duration(seconds: 1));

        await tester.enterText(find.widgetWithText(TextFormField, 'Please enter your password...' ), 'pepepasw');
        await tester.pump();
        await tester.pump(const Duration(seconds: 1));

        await tester.tap(find.byKey(Key('loginbutton')));
        await tester.pump();
        await tester.pump(const Duration(seconds: 2));

        expect(find.text("Sesion iniciada correctamente"), findsOneWidget);
        await tester.tap(find.text('ok'));
        await tester.pump();
        await tester.pump(const Duration(seconds: 2));

        expect(find.byType(HomePageWidget),findsOneWidget);
        await tester.pump();
        await tester.pump(const Duration(seconds: 2));
      });

  });
  
}


Future<Widget> createHomeScreen() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();
  await FlutterFlowTheme.initialize();
  return GetMaterialApp(
      title: 'tutorial',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: LoginWidget(),
    );
  }