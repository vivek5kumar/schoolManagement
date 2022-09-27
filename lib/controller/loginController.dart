import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  bool showPasswor = false;
  List<TextEditingController> ctrl = [
    for (int i = 0; i < 10; i++) TextEditingController()
  ];
}
