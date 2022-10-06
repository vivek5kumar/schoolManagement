import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmanagement/controller/loginController.dart';
import 'package:schoolmanagement/custom_widgets/colors.dart';
import 'package:schoolmanagement/custom_widgets/text_formfield.dart';
import 'package:schoolmanagement/screens/dashboard/dashboard.dart';

class StudentLoginPage extends StatefulWidget {
  String? userName;
  StudentLoginPage({this.userName, super.key});
  @override
  State<StudentLoginPage> createState() => _StudentLoginPageState();
}

class _StudentLoginPageState extends State<StudentLoginPage> {
  final loginCtrl = Get.put(LoginController());
  bool showPassword = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                // SizedBox(
                //   height: size.height * 0.1,
                //   width: size.width * 0.5,
                //   child: const CircleAvatar(
                //     child: Icon(Icons.person),
                //   ),
                // ),
                Image.asset(
                  "assets/images/login-removebg-preview.png",
                ),

                // ignore: prefer_const_constructors
                Center(
                  child: Text(
                    "  Login",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                RoundedTextField(
                  prefix: const Icon(
                    Icons.call,
                    color: kPrimaryColor,
                  ),
                  controller: loginCtrl.ctrl[0],
                  validateMode: AutovalidateMode.onUserInteraction,
                  hint: "user_id....",
                  validator: (val) {
                    if (val.isEmpty) {
                      return "Required";
                    }
                  },
                ),
                RoundedTextField(
                  prefix: const Icon(
                    Icons.lock,
                    color: kPrimaryColor,
                  ),
                  controller: loginCtrl.ctrl[1],
                  validateMode: AutovalidateMode.onUserInteraction,
                  security: !showPassword,
                  suffix: InkWell(
                    onTap: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    child: Icon(
                        showPassword ? Icons.visibility : Icons.visibility_off),
                  ),
                  heading: "password..",
                  validator: (val) {
                    if (val.isEmpty) {
                      return "Required";
                    }
                  },
                ),
                // TextButton(
                //     onPressed: () {},
                //     child: const Text(
                //       "Forgot Password?",
                //       style:
                //           TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                //     )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: kpurpleColor,
                        fixedSize: const Size(50, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                      loginCtrl.login();
                    },
                    child: const Text(
                      "LOGIN",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 60.0),
                //   child: Row(
                //     children: [
                //       const Text(
                //         "Don't have account?",
                //         style: TextStyle(color: kPrimaryLightColor),
                //       ),
                //       TextButton(onPressed: () {}, child: const Text("Sign Up"))
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
