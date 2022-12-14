import 'dart:async';
import 'package:coffee_app/screens/home_sreen.dart';
import 'package:coffee_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool('isLogin') ?? false;

    if (isLogin) {
      Timer(Duration(seconds: 4), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeSreen()));
      });
    } else {
      Timer(Duration(seconds: 4), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      padding: const EdgeInsets.only(top: 100, bottom: 40),
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('images/4.jpg'),
            fit: BoxFit.cover,
            // opacity: 0.9,
          )),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          'Enjoy Coffee',
          style: TextStyle(
            fontSize: 50,
            color: Colors.white,
          ),
        ),
      ]),
    ));
  }
}
