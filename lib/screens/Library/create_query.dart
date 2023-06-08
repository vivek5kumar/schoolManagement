import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:schoolmanagement/controller/department_controller.dart';

class CityPage extends StatefulWidget {
  const CityPage({super.key});

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  final departmentCtrl = Get.put(DepartmentController());
  @override
  void initState() {
    departmentCtrl.department();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Querys"),
      ),
      body: GetBuilder<DepartmentController>(
          init: Get.put(DepartmentController()),
          builder: (controller) {
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField(
                      isExpanded: true,
                      borderRadius: BorderRadius.circular(10),
                      hint: const Text("Select department"),
                      value: controller.selectDepartment,
                      items: controller.departmentList.map((e) {
                        return DropdownMenuItem(
                            enabled: e.isActive == 1 ? true : false,
                            value: e.name,
                            child: Text(e.name!));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          controller.selectDepartment = value;
                          controller.getSubdepartmet(value.toString());
                        });
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      isExpanded: true,
                      borderRadius: BorderRadius.circular(10),
                      hint: const Text("Select subdepartment"),
                      value: controller.selectSubDepartment,
                      items: controller.subdepartmentList.map((e) {
                        return DropdownMenuItem(
                            value: e.name, child: Text(e.name!));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          controller.selectSubDepartment = value.toString();
                        });
                      }),
                ),
              ],
            );
          }),
    );
  }
}
