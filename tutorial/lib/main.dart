import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial/backend/data/login/Local_preference_login.dart';
import 'package:tutorial/home_page/home_page_model.dart';
import 'package:tutorial/login/login_model.dart';
import 'backend/firebase/firebase_config.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/internationalization.dart';
import 'index.dart';

bool isLogged = false; 


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  var userInfo = prefs.getString("user");
  log("hola primero: ${userInfo}");

  await autolog();
  log("hola segundo: ${isLogged}");

  prefs.clear(); // linea que borra los preference, para poder iniciar sesion, se borra al reiniciar la app por 2 vez

  await FlutterFlowTheme.initialize();

  runApp(MyApp());
}

autolog() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool logged = prefs.getBool("storedUser") ?? false;
    if (logged != false){ 
        isLogged = logged;
    }
  return;
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home : isLogged ? HomePageWidget() : LoginWidget(),
    );
  } 
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key? key, this.initialPage, this.page}) : super(key: key);

  final String? initialPage;
  final Widget? page;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'HomePage';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'HomePage': HomePageWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);
    return Scaffold(
      body: _currentPage ?? tabs[_currentPageName],
      // La línea siguiente ha sido eliminada para quitar el BottomNavigationBar
      // bottomNavigationBar: ...
    );
  }
}