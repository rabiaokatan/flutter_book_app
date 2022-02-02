import 'package:flutter/material.dart';
import 'package:flutter_book_app/theme.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Book App',
      debugShowCheckedModeBanner: false,
      theme: light,
      home:const HomeScreen(),
    );
  }
}

