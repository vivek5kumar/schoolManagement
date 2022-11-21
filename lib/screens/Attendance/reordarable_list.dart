import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Reordarable extends StatelessWidget {
  Reordarable({super.key});
  // final reordCtrl = Get.to(ExamController());
  List<String> userName = [
    "vivek",
    "rohan",
    "vaibhav",
    "garun",
    "mantosh",
    "akash",
    "anand",
    "jav jha"
  ].obs;

  void reorder(newIndex, oldIndex) {
    if (newIndex > oldIndex) {
      newIndex = -1;
    }
    final items = userName.removeAt(oldIndex);
    userName.insert(newIndex, items);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Reorder List"),
          centerTitle: true,
        ),
        body: Obx(
          () => ReorderableListView(
              // ignore: sort_child_properties_last
              children: userName
                  .map((e) => Container(
                        margin:
                            const EdgeInsets.only(left: 16, right: 16, top: 8),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(e),
                      ))
                  .toList(),
              onReorder: ((
                newIndex,
                oldIndex,
              ) {
                reorder(newIndex, oldIndex);
              })),
        ));
  }
}
