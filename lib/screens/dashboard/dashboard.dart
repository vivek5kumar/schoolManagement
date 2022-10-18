import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmanagement/controller/dashbordContro.dart';
import 'package:schoolmanagement/controller/loginController.dart';
import 'package:schoolmanagement/screens/ClassRoutine/class_time.dart';
import 'package:schoolmanagement/screens/Exam/exam_list.dart';
import 'package:schoolmanagement/screens/Library/book_libraryList.dart';
import 'package:schoolmanagement/screens/NoticeBoard/notice_boardpage.dart';
import 'package:schoolmanagement/screens/Result/result_exampage.dart';
import 'package:schoolmanagement/screens/message/messagePage.dart';
import 'package:schoolmanagement/screens/profile/student_accountpage.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final dashBordCtrl = Get.put(DashBordController());
  final dashCtrl = Get.put(LoginController());

  onTap(int index) {
    switch (index) {
      case 0:
        {
          Get.to(const StudentAccount());
          break;
        }
      case 1:
        {
          Get.to(const ClassTimeTable());
          break;
        }
      case 2:
        {
          Get.to(const ExamList());
          break;
        }
      case 3:
        {
          Get.to(const MessageInbox());
          break;
        }
      case 4:
        {
          Get.to(const ExamResult());
          break;
        }
      case 5:
        {
          Get.to(NoticeBoard());
          break;
        }
      case 6:
        {
          // Get.to(BookLibrary());
          break;
        }
      case 7:
        {
          // Get.to(ExamResult());
          break;
        }
      case 8:
        {
          // Get.to(ExamResult());
          break;
        }
      case 9:
        {
          // Get.to(ExamResult());
          break;
        }
      case 10:
        {
          Get.to(BookLibrary());
          break;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: dashBordCtrl.openeDrawer(),
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: () => dashCtrl.logout(context),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.logout),
              ))
        ],
        centerTitle: true,
        title: const Text("DashBoard"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          // physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            // childAspectRatio: 19 / 12,
            mainAxisSpacing: 15.0,
            crossAxisSpacing: 15.0,
          ),
          itemCount: 11,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                onTap(index);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                      maxRadius: 40,
                      child: GridTile(child: Text(index.toString()))),
                  Text(dashBordCtrl.dashBordName[index]),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
