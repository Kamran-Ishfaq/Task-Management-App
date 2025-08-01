import 'package:flutter/material.dart';
import 'package:task_app/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
  theme: ThemeData.dark().copyWith(
  primaryColor: Colors.purple, // High-theme color like the images you shared
  scaffoldBackgroundColor: Colors.black, // Black background to match dark mode
  cardColor: Colors.purpleAccent,
  textTheme: TextTheme(
  headlineMedium: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
  bodyMedium: TextStyle(color: Colors.white, fontSize: 14),
  ),
  ),
  home: SplashScreen(),
  debugShowCheckedModeBanner: false,
  );
  }
  }
