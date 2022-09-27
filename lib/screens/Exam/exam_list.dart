import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmanagement/controller/exam_controller.dart';
import 'package:schoolmanagement/custom_widgets/custom_sizes.dart';
import 'package:schoolmanagement/screens/Exam/exam_viewAllPage.dart';

class ExamList extends StatefulWidget {
  const ExamList({super.key});

  @override
  State<ExamList> createState() => _ExamListState();
}

class _ExamListState extends State<ExamList> {
  final examCtrl = Get.put(ExamController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Exam List"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Align(
                alignment: Alignment.topRight,
                child: InkWell(
                    child: InkWell(
                        onTap: () {
                          Get.to(AllDetails());
                        },
                        child: const Text("View All")))),
          ),
          for (int i = 0; i < 2; i++)
            SizedBox(
                height: 60,
                width: 200,
                child: Card(child: Center(child: Text(examCtrl.cityName[i])))),
          const Divider(
            thickness: 1,
          )
        ],
      ),
    );
  }
}
