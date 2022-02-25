import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/controllers/signup_controller.dart';

class SignupScreen extends StatelessWidget {
  final SignupController signupController = Get.put(SignupController());

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
            key: signupController.globalKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.people,
                      color: Color(0xffae231c),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "First Name",
                      style: TextStyle(
                        color: Theme.of(context).iconTheme.color,
                        fontFamily: "Roboto",
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  controller: signupController.fController,
                  validator: (val) {
                    return signupController.validateFirstName(val);
                  },
                  style: TextStyle(color: Theme.of(context).iconTheme.color),
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffae231c)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffae231c)),
                    ),
                  ),
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.people,
                      color: Color(0xffae231c),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Last Name",
                      style: TextStyle(
                        color: Theme.of(context).iconTheme.color,
                        fontFamily: "Roboto",
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  controller: signupController.lController,
                  validator: (val) {
                    return signupController.validateLastName(val);
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
                  height: 20,
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
                      "Email Address",
                      style: TextStyle(
                        color: Theme.of(context).iconTheme.color,
                        fontFamily: "Roboto",
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  controller: signupController.eController,
                  validator: (val) {
                    return signupController.validateEmail(val);
                  },
                  style: TextStyle(color: Theme.of(context).iconTheme.color),
                  keyboardType: TextInputType.emailAddress,
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
                  height: 20,
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
                TextFormField(
                  controller: signupController.pController,
                  validator: (val) {
                    return signupController.validatePassword(val);
                  },
                  style: TextStyle(color: Theme.of(context).iconTheme.color),
                  keyboardType: TextInputType.name,
                  obscureText: true,
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
                  height: 20,
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
                      "Confirm Password",
                      style: TextStyle(
                          color: Theme.of(context).iconTheme.color,
                          fontFamily: "Roboto"),
                    ),
                  ],
                ),
                TextFormField(
                  controller: signupController.cPController,
                  validator: (val) {
                    return signupController.validateConfirmPassword(val);
                  },
                  style: TextStyle(color: Theme.of(context).iconTheme.color),
                  keyboardType: TextInputType.name,
                  obscureText: true,
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
                  height: 45,
                ),
                Obx(
                  () => signupController.isLoading.value == true
                      ? const CircularProgressIndicator()
                      : const Text(''),
                ),
                ElevatedButton(
                  onPressed: () {
                    signupController.postSignup();
                  },
                  child: const Text('Sign up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
