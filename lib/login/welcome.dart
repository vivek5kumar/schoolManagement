import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmanagement/login/user_login.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    List userName = ["Admin", "Parents", "Student"];
    return Scaffold(
      body: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: userName.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () => Get.to(StudentLoginPage(
                        userName: userName[index],
                      )),
                  child: Container(
                      color: Colors.blue,
                      width: 150,
                      height: 50,
                      child: Text(userName[index]))),
            );
          }),
    );
  }
}
