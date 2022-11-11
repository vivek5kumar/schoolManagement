import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmanagement/controller/loginController.dart';
import 'package:schoolmanagement/no_internate.dart';
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

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  initConnectivity() async {
    ConnectivityResult? result;
    try {
      result = await _connectivity.checkConnectivity();
    } catch (e) {
      print(e.toString());
    }
    return _updateConnectionStatus(result!);
  }

  _updateConnectionStatus(ConnectivityResult result) {
    try {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        checkLogin();
        Get.snackbar(
          "connected",
          "Internate Connected !",
          backgroundColor: Colors.green,
        );
      } else {
        Get.snackbar("Disconnect", "No Internate connection",
            colorText: Colors.red, backgroundColor: Colors.white);
        Get.to(const InternateChecking());
      }
    } catch (e) {
      print(e.toString());
    }
  }

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
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
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
