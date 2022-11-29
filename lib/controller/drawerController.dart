import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmanagement/controller/loginController.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../drawerListScreen/parentsListPage.dart';
import '../drawerListScreen/studentListPage.dart';
import '../drawerListScreen/teacherListPage.dart';

class DrawerListController extends GetxController {
  final logCtrl = Get.put(LoginController());
  // bool isLogin = false;
  bool isLogin = false; // for check is user login or not
  late SharedPreferences prefs;

  List<String> drawerList = [
    "Dashboard",
    "Teacher",
    "Student",
    "Parents",
    "SupportStaff",
    "Subject",
    "Logout"
    // "Virtual ClassRoom",
    // "Exam",
    // "Grade",
    // "Hostel",
    // "Home Work",
    // "Fee Payment",
    // "Payment",
    // "Transport",
    // "Notice Board",
    // "Message",
    // "Holiday",
    // "Library",
    // "Account",
    // "Logout"
  ];
  var iconList = [
    Icons.search,
    Icons.saved_search,
    Icons.receipt_long,
    Icons.restaurant,
    Icons.emoji_objects,
    Icons.account_circle,
    // FontAwesomeIcons.ticketAlt,
    // FontAwesomeIcons.ticketAlt,
    Icons.logout
  ];

  drawerFun(i, context) {
    if (i == 0) {
      Get.back();
    } else if (i == 1) {
      Get.to(const TeacherList());
    } else if (i == 2) {
      Get.to(const StudentList());
    } else if (i == 3) {
      Get.to(const ParentsList());
    } else if (i == 4) {
      // Get.to(supp());
    } else if (i == 5) {
      // Get.to(());
    } else if (i == 5) {
      // Get.to(());
    } else if (i == 6) {
      logCtrl.showLogDialog(context);
    }
  }
}
