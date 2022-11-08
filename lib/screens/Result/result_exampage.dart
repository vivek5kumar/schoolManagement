import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmanagement/controller/resultController.dart';
import 'package:schoolmanagement/custom_widgets/colors.dart';
import 'package:schoolmanagement/custom_widgets/custom_sizes.dart';

class ExamResult extends StatefulWidget {
  const ExamResult({super.key});

  @override
  State<ExamResult> createState() => _ExamResultState();
}

class _ExamResultState extends State<ExamResult> {
  final resultCtrl = Get.put(ExamResultController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p12),
            child: Icon(Icons.picture_as_pdf_outlined),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p12),
            child: Icon(Icons.notifications),
          )
        ],
        centerTitle: true,
        title: const Text("Exam Result"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width * 0.4,
                  height: size.height * 0.05,
                  decoration: BoxDecoration(
                      color: Colors.blue[400],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(
                          10,
                        ),
                        bottomLeft: Radius.circular(
                          10,
                        ),
                      )),
                  // color: Colors.blue[200],
                  child: const Center(
                      child: Text(
                    "Select Exam",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeightManager.bold),
                  )),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p2),
                  child: Container(
                    width: size.width * 0.4,
                    height: size.height * 0.05,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 1),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(
                            10,
                          ),
                          bottomRight: Radius.circular(
                            10,
                          ),
                        )),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          value: resultCtrl.selectExamType,
                          items: resultCtrl.examSemester.map((items) {
                            return DropdownMenuItem(
                                value: items,
                                child: Padding(
                                  padding: const EdgeInsets.all(AppPadding.p8),
                                  child: Text(items),
                                ));
                          }).toList(),
                          onChanged: (val) {
                            setState(() {
                              resultCtrl.selectExamType = val.toString();
                            });
                          }),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
