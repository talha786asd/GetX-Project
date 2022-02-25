import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var data;

  Future checkLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = await preferences.getString('token');
    setState(() {
      data = token;
    });
  }

  @override
  void initState() {
    checkLogin().whenComplete(() async {
      Timer(const Duration(seconds: 3),
          () => Get.offAndToNamed(data == null ? '/Login' : '/Home'));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Splash",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
