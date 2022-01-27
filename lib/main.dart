import 'package:flutter/material.dart';

import 'models/book.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

ThemeData _lightTheme = ThemeData(
  primarySwatch: MaterialColor(0xff775447, color),
  primaryColor: const Color(0xff775447),
  brightness: Brightness.light,
  primaryColorLight: const Color(0xffa78172),
  primaryColorDark: const Color(0xff4a2b20),
);

// ThemeData _darkTheme = ThemeData(
//   primarySwatch: MaterialColor(0xff775447, color),
//   primaryColor: const Color(0xff775447),
//   //brightness: Brightness.dark,
//  // backgroundColor:  const Color(0xff775447),
//   primaryColorLight: const Color(0xffa78172),
//   primaryColorDark: const Color(0xff4a2b20),
// );

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Book App',
      debugShowCheckedModeBanner: false,
      theme: _lightTheme,
      home: HomeScreen(),
    );
  }
}

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
