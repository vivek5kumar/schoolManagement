import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmanagement/Utils/auth.manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  late SharedPreferences prefs;
  RxBool showPasswor = false.obs;
  List<TextEditingController> ctrl = [
    for (int i = 0; i < 10; i++) TextEditingController()
  ];
  RxBool isLoading = false.obs;

  setLoading(bool val) {
    isLoading.value = val;
    update();
  }

  login() async {
    prefs = await SharedPreferences.getInstance();
    setLoading(true);
    Map _map = {
      "action": "login",
      "email": ctrl[0].text.trim(),
      "password": ctrl[1].text.trim(),
    };
    await ApiManager().getLogin(_map).then((value) {
      if (value.status == 1) {
        prefs.setBool("isLogin", true);
        prefs.setString("email", ctrl[0].text);
        prefs.setString("password", ctrl[1].text);
        Get.offAllNamed("/dashBoard");
      }
    });
    setLoading(false);
    // update();
  }

  logout(context) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLogin", false);
    Get.offAllNamed("/userLogin");
  }
}
