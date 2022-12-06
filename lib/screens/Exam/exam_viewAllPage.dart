import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmanagement/controller/exam_controller.dart';
import 'package:schoolmanagement/custom_widgets/colors.dart';

class AllDetails extends StatefulWidget {
  AllDetails({super.key});

  @override
  State<AllDetails> createState() => _AllDetailsState();
}

class _AllDetailsState extends State<AllDetails> {
  final examDetailsCtrl = Get.put(ExamController());
  var value = [for (int i = 0; i <= 5; i++) false];
  List<bool> buttonHide = [for (int i = 0; i < 8; i++) false];
  var colorsList = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: ListView.builder(
          itemCount: examDetailsCtrl.userName.length,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      colorsList.clear();
                      colorsList.add(index);
                      setState(() {});
                    },
                    child: Container(
                        height: size.height * 0.05,
                        width: size.width * 0.7,
                        decoration: BoxDecoration(
                            color: colorsList.contains(index)
                                ? Colors.blue[100]
                                : null,
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              examDetailsCtrl.userName[index],
                            ),
                          ],
                        ))),
                  ),
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
