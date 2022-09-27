import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmanagement/controller/exam_controller.dart';

class AllDetails extends StatelessWidget {
  AllDetails({super.key});
  final examDetailsCtrl = Get.put(ExamController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: ListView.builder(
          itemCount: examDetailsCtrl.cityName.length,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      height: size.height * 0.05,
                      width: size.width * 0.7,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10.0)),
                      child:
                          Center(child: Text(examDetailsCtrl.cityName[index]))),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            );
          }),
    );
  }
}
