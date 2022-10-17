import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmanagement/controller/loginController.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final loginCtrl = Get.put(LoginController());
  late SharedPreferences prefs;
  bool isLogin = false;

  checkLogin() async {
    prefs = await SharedPreferences.getInstance();
    isLogin = prefs.getBool(
          "isLogin",
        ) ??
        false;
    if (!isLogin) {
      Timer(const Duration(seconds: 3), () => Get.offAllNamed("/userLogin"));
    } else {
      loginCtrl.ctrl[0].text = prefs.getString("email").toString();
      loginCtrl.ctrl[1].text = prefs.getString("password").toString();
      await loginCtrl.login();
      Timer(const Duration(seconds: 3), () => Get.toNamed("/dashBoard"));
    }
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red,
      body: Center(
          child: CircleAvatar(
        maxRadius: 60,
        backgroundImage: AssetImage("assets/images/hello.jpg"),
      )),
    );
  }
}
