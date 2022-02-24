import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData light = ThemeData(
  primarySwatch: MaterialColor(0xff775447, color),
  primaryColor: const Color(0xff775447),
  brightness: Brightness.light,
  primaryColorLight: const Color(0xffa78172),
  primaryColorDark: const Color(0xff4a2b20),
  cardColor: Colors.white,
);

ThemeData dark = ThemeData(
  primarySwatch: MaterialColor(0xff775447, color),
  primaryColor: Colors.white,
  hintColor: Colors.white38,
  textTheme: const TextTheme(
    subtitle1: TextStyle(color: Colors.white),
    bodyText2: TextStyle(color: Colors.white),
  ),
  dialogBackgroundColor: const Color(0xffa78172),
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(color: Colors.white38),
    fillColor: Colors.white,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white38,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white38,
      ),
    ),
  ),
  appBarTheme: const AppBarTheme(color: Color(0xffa78172)),
  scaffoldBackgroundColor: const Color(0xff4a2b20),
  primaryColorLight: const Color(0xffa78172),
  primaryColorDark: const Color(0xffa78172),
  cardColor: const Color(0xffa78172),
);

//for hex color to material color
Map<int, Color> color = {
  50: const Color.fromRGBO(119, 84, 71, .1),
  100: const Color.fromRGBO(119, 84, 71, .2),
  200: const Color.fromRGBO(119, 84, 71, .3),
  300: const Color.fromRGBO(119, 84, 71, .4),
  400: const Color.fromRGBO(119, 84, 71, .5),
  500: const Color.fromRGBO(119, 84, 71, .6),
  600: const Color.fromRGBO(119, 84, 71, .7),
  700: const Color.fromRGBO(119, 84, 71, .8),
  800: const Color.fromRGBO(119, 84, 71, .9),
  900: const Color.fromRGBO(119, 84, 71, 1),
};

class ThemeNotifier extends ChangeNotifier {
  final String key = 'theme';
   SharedPreferences ?_prefs;
  late bool _lightTheme;

  bool get lightTheme => _lightTheme;

  ThemeNotifier() {
    _lightTheme = true;
    _loadFromPrefs();
  }

  toggleTheme() {
    _lightTheme = !_lightTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    if (_prefs == null) 
    _prefs = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _lightTheme = _prefs!.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _prefs!.setBool(key, _lightTheme);
  }

}
