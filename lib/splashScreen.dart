import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:schoolmanagement/login/welcome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () => Get.off(const Welcome()));
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
