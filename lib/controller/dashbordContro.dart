import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:schoolmanagement/drawerListScreen/teacherListPage.dart';
import 'package:schoolmanagement/screens/ClassRoutine/class_time.dart';

import 'package:schoolmanagement/screens/Exam/exam_list.dart';
import 'package:schoolmanagement/screens/Fee%20Payment/fee_payment.dart';
import 'package:schoolmanagement/screens/Holiday/holiday.dart';
import 'package:schoolmanagement/screens/Homework/homework.dart';
import 'package:schoolmanagement/screens/Library/book_libraryList.dart';
import 'package:schoolmanagement/screens/NoticeBoard/notice_boardpage.dart';
import 'package:schoolmanagement/profile/student_accountpage.dart';

import '../screens/Result/result_exampage.dart';
import '../screens/message/messagePage.dart';

class DashBordController extends GetxController {
  List<String> dashBordName = [
    "Profile",
    "Class Routine",
    "Exam",
    "Message",
    "Result",
    "Attendance",
    "Notice Board",
    "Holiday",
    "Homework",
    "Fee Payment",
    "Library"
  ];

  var dashboardIconList = [
    Icons.person,
    Icons.date_range_outlined,
    Icons.subject_outlined,
    Icons.mail_outline,
    Icons.assignment_outlined,
    Icons.check_circle,
    Icons.notifications_outlined,
    Icons.time_to_leave_sharp,
    Icons.account_balance_outlined,
    Icons.credit_card_outlined,
    Icons.library_books_outlined,
  ];

  onTap(int i) {
    if (i == 0) {
      Get.to(const StudentAccount());
    } else if (i == 1) {
      Get.to(const ClassTimeTable());
    } else if (i == 2) {
      Get.to(const ExamList());
    } else if (i == 3) {
      Get.to(const MessageInbox());
    } else if (i == 4) {
      Get.to(const ExamResult());
    } else if (i == 5) {
      Get.to(NoticeBoard());
    } else if (i == 6) {
      Get.to(NoticeBoard());
    } else if (i == 7) {
      Get.to(const HolidaysPage());
    } else if (i == 8) {
      Get.to(const HomeworkPage());
    } else if (i == 9) {
      Get.to(const FeePaymentPage());
    } else if (i == 10) {
      Get.to(BookLibrary());
    }
  }
}
