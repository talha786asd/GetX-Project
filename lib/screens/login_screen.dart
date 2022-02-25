import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Form(
            key: loginController.globalKey,
            child: Column(
              children: [
                Container(
                  height: 70,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.email,
                      color: Color(0xffae231c),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Email",
                      style: TextStyle(
                        color: Theme.of(context).iconTheme.color,
                        fontFamily: "Roboto",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: loginController.econtroller,
                  validator: (val) {
                    return loginController.validateEmail(val);
                  },
                  style: TextStyle(color: Theme.of(context).iconTheme.color),
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffae231c)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffae231c)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.lock,
                      color: Color(0xffae231c),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Password",
                      style: TextStyle(
                        color: Theme.of(context).iconTheme.color,
                        fontFamily: "Roboto",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: true,
                  controller: loginController.pcontroller,
                  validator: (val) {
                    return loginController.validatePassword(val);
                  },
                  style: TextStyle(color: Theme.of(context).iconTheme.color),
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffae231c),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffae231c),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Obx(() => loginController.isLoading.value == true
                    ? CircularProgressIndicator()
                    : Text('')),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          loginController.postLogin();
                        },
                        child: const Text('Login')),
                    const Spacer(
                      flex: 1,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Get.toNamed('/Signup');
                        },
                        child: const Text('Sign up'))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
