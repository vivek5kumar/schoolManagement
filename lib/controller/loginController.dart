import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmanagement/Utils/auth.manager.dart';
import 'package:schoolmanagement/custom_widgets/colors.dart';
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

  loginClear() {
    ctrl[0].clear();
    ctrl[1].clear();
  }

  // login() async {
  //   prefs = await SharedPreferences.getInstance();
  //   setLoading(true);
  //   Map _map = {
  //     "action": "login",
  //     "email": ctrl[0].text.trim(),
  //     "password": ctrl[1].text.trim(),
  //   };
  //   await ApiManager().getLogin(_map).then((value) {
  //     if (value.status == 1) {
  //       prefs.setBool("isLogin", true);
  //       prefs.setString("email", ctrl[0].text);
  //       prefs.setString("password", ctrl[1].text);
  //       isLogin = prefs.getBool("isLogin")!;
  //       Get.off(const DashBoard());
  //       // loginClear();
  //     } else {
  //       Get.snackbar("Error", "Check your username and password!",
  //           backgroundColor: Colors.red, colorText: Colors.white);
  //     }
  //   });
  //   setLoading(false);
  //   // update();
  // }

  logout(context) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLogin", false);
    isLogin = prefs.getBool("isLogin")!;
    Get.offAllNamed("/dashBoard");
    Get.snackbar("Logout", "You have logged out", isDismissible: true);
  }

  showLogDialog(
    BuildContext context,
  ) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text(
              'Are you sure you want to logout ?',
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 40,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      child: const Text(
                        'No',
                        style: TextStyle(color: kWhiteColor),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      child: const Text(
                        'Yes',
                        style: TextStyle(color: kWhiteColor),
                      ),
                      onPressed: () {
                        logout(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }
}
