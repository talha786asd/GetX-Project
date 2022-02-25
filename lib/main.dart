import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/screens/home_screen.dart';
import 'package:getx_app/screens/login_screen.dart';
import 'package:getx_app/screens/signup_screen.dart';
import 'package:getx_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter GetX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: '/Login',
          page: () => LoginScreen(),
        ),
        GetPage(
          name: '/Signup',
          page: () => SignupScreen(),
        ),
        GetPage(
          name: '/Home',
          page: () => HomeScreen(),
        ),
      ],
    );
  }
}
