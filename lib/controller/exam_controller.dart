import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ExamController extends GetxController {
  TextEditingController dateCtrl = TextEditingController();
  // DateTime dateTime = DateTime.now();
  List userName = [
    "vivek",
    "rohan",
    "vaibhav",
    "garun",
    "mantosh",
    "akash",
    "anand",
    "aman"
  ];

  showDate(context) {
    return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 1),
        selectableDayPredicate: (DateTime val) =>
            val.weekday == 6 || val.weekday == 7 ? false : true).then((date) {
      if (date != null) {
        dateCtrl.text = DateFormat('yyyy-MM-dd').format(date);
      }
    });
  }
}
