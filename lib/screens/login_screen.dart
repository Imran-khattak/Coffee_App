import 'dart:async';
import 'package:coffee_app/screens/home_sreen.dart';
import 'package:coffee_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  //Future< bool> islogin = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  bool isObscure = true;
  // @override
  // void initState() {
  //   super.initState();
  //   Timer(Duration(seconds: 10), () {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => SplashScreen()));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.only(top: 100, bottom: 40),
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('images/2.jpg'),
              fit: BoxFit.cover,
              // opacity: 0.9,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Coffee Shop',
              style: GoogleFonts.pacifico(
                fontSize: 50,
                color: Colors.white,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(right: 20, left: 20, bottom: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Username',
                      hintStyle: const TextStyle(color: Colors.white),
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: 'email',
                        hintStyle: const TextStyle(color: Colors.white),
                        prefixIcon: const Icon(Icons.mail, color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
                  child: TextFormField(
                      obscureText: isObscure,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: const TextStyle(color: Colors.white),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                isObscure = !isObscure;
                              });
                            },
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(15),
                          ))),
                )
              ],
            ),
            Column(
              children: [
                const Text(
                  'Feeling Low? Take a Sip of Coffee',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                InkWell(
                  onTap: () async {
                    SharedPreferences sp =
                        await SharedPreferences.getInstance();
                    sp.setString('email', emailController.text.toString());
                    sp.setString('Username', nameController.text.toString());
                    sp.setBool('isLogin', true);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeSreen()));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 15),
                    decoration: BoxDecoration(
                        color: Color(0xffA45C40),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text('Login',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          letterSpacing: 1,
                        )),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
