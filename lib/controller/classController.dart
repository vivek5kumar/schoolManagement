import 'package:get/get.dart';
import 'package:schoolmanagement/models/department.dart';

class ClassController extends GetxController {
  int index = 0;
  var weekName = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun",
  ];

// for forword and backword of week function

  weekFun(isIncrease) {
    if (isIncrease ? (index < 6) : (index > 0)) {
      isIncrease ? index++ : index--;
    }
    // update();
  }
}
