import 'package:flutter/material.dart';
import 'package:flutter_book_app/theme.dart';
import 'package:provider/provider.dart';
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
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
          return MaterialApp(
            title: 'Flutter Book App',
            debugShowCheckedModeBanner: false,
            theme: notifier.lightTheme ? light : dark,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
