import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SignUpController extends GetxController {
  final accountkey = GlobalKey<FormState>();
  List<TextEditingController> signUpCtrl = [
    for (int i = 0; i < 20; i++) TextEditingController()
  ];
  final signUpKey = GlobalKey<FormState>();
  bool active = false;
  bool nameAutoValidate = false;
  bool addressAutoValidate = false;

  clearField() {
    signUpCtrl[0].clear();
    signUpCtrl[1].clear();
    signUpCtrl[2].clear();
    signUpCtrl[3].clear();
    signUpCtrl[4].clear();
    signUpCtrl[4].clear();
    signUpCtrl[6].clear();
    signUpCtrl[7].clear();
    signUpCtrl[8].clear();
    signUpCtrl[9].clear();
    signUpCtrl[10].clear();
    // signUpCtrl[0].clear();
    // signUpCtrl[0].clear();
    // signUpCtrl[0].clear();
  }

  // selectDate(context) {
  //   return showDatePicker(
  //       context: context,
  //       initialDate: DateTime.now(),
  //       firstDate: DateTime.now(),
  //       lastDate: DateTime(DateTime.now().year + 1),
  //       selectableDayPredicate: (DateTime val) =>
  //           val.weekday == 5 || val.weekday == 6 ? false : true).then((date) {
  //     if (date != null) {
  //       signUpCtrl[3].text = DateFormat('yyyy-MM-dd').format(date);
  //     }
  //   });
  // }
}
