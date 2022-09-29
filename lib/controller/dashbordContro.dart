import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmanagement/custom_widgets/colors.dart';
import 'package:schoolmanagement/custom_widgets/custom_sizes.dart';
import 'package:schoolmanagement/drawerListScreen/parentsListPage.dart';
import 'package:schoolmanagement/drawerListScreen/studentListPage.dart';
import 'package:schoolmanagement/drawerListScreen/teacherListPage.dart';

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
  List<String> drawerList = [
    "Dashboard",
    "Teacher",
    "Student",
    "Parents",
    "SupportStaff",
    "Subject",
    "Class Routine",
    "Virtual ClassRoom",
    "Exam",
    "Grade",
    "Hostel",
    "Home Work",
    "Fee Payment",
    "Payment",
    "Transport",
    "Notice Board",
    "Message",
    "Holiday",
    "Library",
    "Account",
    "Logout"
  ];

  _onTap(int i) {
    switch (i) {
      case 0:
        {
          Get.back();
          break;
        }
      case 1:
        {
          Get.to(const TeacherList());
          break;
        }
      case 2:
        {
          Get.to(const StudentList());
          break;
        }
      case 3:
        {
          Get.to(const ParentsList());
          break;
        }
      case 4:
        {
          // Get.to(StudentList());
          break;
        }
    }
  }

  openeDrawer() {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            DrawerHeader(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: AppPadding.p14),
              child: Column(
                children: [
                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: Colors.blue,
                  //   ),
                  //   child: Text("School Master"),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const CircleAvatar(
                        maxRadius: 20,
                        child: Text("Hi"),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Student App"),
                          const Text("vivek.yadva@sapple.co.in")
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )),
            Flexible(
              child: ListView.builder(
                  itemCount: drawerList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        _onTap(index);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (index > 0)
                            const Divider(
                              thickness: 1,
                            ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              drawerList[index],
                              style: TextStyle(fontSize: FontSize.s18),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
