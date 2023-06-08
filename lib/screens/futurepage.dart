import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmanagement/controller/citi_state_controller.dart';

class IconPage extends StatelessWidget {
  const IconPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Icons List"),
      ),
      body: GetBuilder<CitiesStateController>(
        init: Get.put(CitiesStateController()),
        builder: (controller) {
          return SizedBox(
            height: 200,
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      controller.pickIcon(index);
                    },
                    child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: controller.selectIcon == index
                                ? Colors.blue
                                : null,
                            borderRadius: controller.selectIcon == index
                                ? BorderRadius.circular(10)
                                : null),
                        child: Center(child: Text(index.toString()))),
                  );
                }),
          );
        },
      ),
    );
  }
}
