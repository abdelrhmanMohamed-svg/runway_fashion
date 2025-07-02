import 'package:flutter/material.dart';
import 'package:runway_fashion/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Colors.white
        ,appBarTheme: AppBarTheme(backgroundColor: Colors.white)
        ),
        debugShowCheckedModeBanner: false,
        home: Splash());
  }
}
