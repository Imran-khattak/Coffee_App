import 'package:coffee_app/screens/home_sreen.dart';
import 'package:coffee_app/screens/login_screen.dart';
import 'package:coffee_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
