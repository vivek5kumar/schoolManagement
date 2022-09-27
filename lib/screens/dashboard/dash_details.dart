import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmanagement/controller/dashbordContro.dart';

class StudentDetails extends StatefulWidget {
  String? name;
  StudentDetails({this.name, super.key});

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  final studentDetailsCtrl = Get.put(DashBordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: studentDetailsCtrl.openeDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(widget.name.toString()),
      ),
      body: Column(children: [Text(widget.name.toString())]),
    );
  }
}
