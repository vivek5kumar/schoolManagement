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
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Exam List"),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                alignment: Alignment.bottomCenter,
                // fit: BoxFit.cover,
                opacity: 1,
                repeat: ImageRepeat.repeat,
                image: NetworkImage(
                  'https://registration.iimsambalpuradmissions.in/exphd/images/background.png',
                ))),
        child: Column(
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
                  child:
                      Card(child: Center(child: Text(examCtrl.userName[i])))),
            const Divider(
              thickness: 1,
            ),
            // Row(
            //   children: [
            //     Text("follow the instruction"),
            //     Checkbox(
            //         value: _value,
            //         onChanged: (value) {
            //           setState(() {
            //             _value = value!;
            //           });
            //         })
            //   ],
            // ),
            // ElevatedButton(
            //     onPressed: _value == true ? () {} : null,
            //     child: Text("Show Button"))
          ],
        ),
      ),
    );
  }
}
