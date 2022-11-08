import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmanagement/Utils/auth.manager.dart';
import 'package:schoolmanagement/screens/dashboard/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  late SharedPreferences prefs;
  RxBool showPasswor = false.obs;
  bool isLogin = false;
  var datetime = DateTime.now();
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
        isLogin = prefs.getBool("isLogin")!;
        // ignore: prefer_const_constructors
        Get.offAll(DashBoard());
      } else {
        Get.snackbar("Error", "Check your username and password!",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    });
    setLoading(false);
    // update();
  }

  logout(context) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLogin", false);
    isLogin = prefs.getBool("isLogin")!;
    Get.offAllNamed("/dashBoard");
    Get.snackbar("Logout", "You have logged out");
  }

  showLogDialog(
    BuildContext context,
  ) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text(
              'Are you sure you want to log out!',
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: const Text('Yes'),
                    onPressed: () {
                      logout(context);
                    },
                  ),
                  ElevatedButton(
                    child: const Text('No'),
                    onPressed: () {
                      Get.back();
                    },
                  )
                ],
              ),
            ],
          );
        });
  }
}
