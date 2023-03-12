import 'package:flutter/material.dart';
import 'package:wave_header/pages/home/home.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.green,
          textTheme: const TextTheme(
            headlineLarge: TextStyle(
                color: Colors.white,
                fontSize: 26,
                letterSpacing: 3.8,
                wordSpacing: 10.8),
            headlineMedium: TextStyle(
                color: Colors.white38,
                fontSize: 18,
                letterSpacing: 3.8,
                wordSpacing: 10.8),
            bodyLarge: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 2.5),
            bodyMedium: TextStyle(
                color: Colors.black54,
                fontSize: 12,
                )
          )),
      home: const HomePage(),
    );
  }
}
