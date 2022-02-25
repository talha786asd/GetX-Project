import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/models/request_signup_model.dart';
import 'package:getx_app/services/remote_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupController extends GetxController {
  var isLoading = false.obs;
  final globalKey = GlobalKey<FormState>();
  final fController = TextEditingController();
  final lController = TextEditingController();
  final eController = TextEditingController();
  final pController = TextEditingController();
  final cPController = TextEditingController();

  @override
  void onInit() {
    fController;
    lController;
    eController;
    pController;
    cPController;
    super.onInit();
  }

  @override
  void dispose() {
    fController.dispose();
    lController.dispose();
    eController.dispose();
    pController.dispose();
    cPController.dispose();
    super.dispose();
  }

  String? validateFirstName(value) {
    if (value.isEmpty) {
      return "Please enter firstName";
    }
    return null;
  }

  String? validateLastName(value) {
    if (value.isEmpty) {
      return "Please enter lastName";
    }
    return null;
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

  String? validateConfirmPassword(value) {
    if (value.isEmpty) {
      return "Please enter confirmPassword";
    } else if (pController.text != cPController.text) {
      return "Password and confirm password does not match";
    }
    return null;
  }

  postSignup() async {
    if (globalKey.currentState!.validate()) {
      isLoading(true);
      try {
        var request = RequestSignupModel(
          fName: fController.text,
          lName: lController.text,
          email: eController.text,
          password: pController.text,
          cPassword: cPController.text,
        );
        var data = await RemoteServices.postSignup(request);
        if (data != null) {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          await preferences.setString('token', data.token.toString());
          Get.offAndToNamed('/Home');
        }
      } finally {
        isLoading(false);
      }
    }
  }
}
