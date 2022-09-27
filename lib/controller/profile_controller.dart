import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  List<TextEditingController> controller = [
    for (int i = 0; i < 10; i++) TextEditingController()
  ];
}
