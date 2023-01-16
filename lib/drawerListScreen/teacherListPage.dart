import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmanagement/screens/dashboard/dashboard.dart';

class TeacherList extends StatefulWidget {
  const TeacherList({super.key});

  @override
  State<TeacherList> createState() => _TeacherListState();
}

class _TeacherListState extends State<TeacherList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Teacher List"),
      ),
      body: Column(mainAxisSize: MainAxisSize.min, children: [
        Center(
          child: ElevatedButton(
              onPressed: () {
                Get.to(DashBoard());
              },
              child: Text("back")),
        )
      ]),
    );
  }
}
