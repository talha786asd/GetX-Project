import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/models/request_login_model.dart';
import 'package:getx_app/services/remote_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  final globalKey = GlobalKey<FormState>();
  final econtroller = TextEditingController();
  final pcontroller = TextEditingController();

  @override
  void onInit() {
    econtroller;
    pcontroller;
    super.onInit();
  }

  @override
  void dispose() {
    econtroller.dispose();
    pcontroller.dispose();
    super.dispose();
  }

  String? validateEmail(value) {
    if (value.isEmpty) {
      return "Please enter Email";
    } else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
        .hasMatch(value)) {
      return 'Please a valid Email';
    }
    return null;
  }

  String? validatePassword(value) {
    if (value.isEmpty) {
      return "Please enter Password";
    }
    return null;
  }

  postLogin() async {
    if (globalKey.currentState!.validate()) {
      isLoading(true);
      try {
        var request = RequestLoginModel(
          email: econtroller.text,
          password: pcontroller.text,
        );
        var data = await RemoteServices.postLogin(request);
        if (data != null) {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          await preferences.setString(
            'token',
            data.token.toString(),
          );
          Get.offAndToNamed('/Home');
        }
      } finally {
        isLoading(false);
      }
    }
  }
}
