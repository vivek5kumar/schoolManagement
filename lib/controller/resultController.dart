// ignore: file_names
import 'package:get/get.dart';

class ExamResultController extends GetxController {
  String selectSem = "Select";
  String selectBook = "Select";
  List examSemester = [
    "Select",
    "First Sem",
    "Second Sem",
    "Third Sem",
    "Forth Sem"
  ];

  List semesterBook = [
    "Select",
    "mathematics",
    "Enviromental",
    "Electroni",
    "Electical",
    "Communication"
  ];

  _refresh() {
    examSemester.clear();
  }
}
