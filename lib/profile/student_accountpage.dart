import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmanagement/controller/profile_controller.dart';
import 'package:schoolmanagement/custom_widgets/account_textfield.dart';
import 'package:schoolmanagement/custom_widgets/colors.dart';
import 'package:schoolmanagement/custom_widgets/custom_sizes.dart';

class StudentAccount extends StatefulWidget {
  const StudentAccount({super.key});

  @override
  State<StudentAccount> createState() => _StudentAccountState();
}

class _StudentAccountState extends State<StudentAccount> {
  final accountCtrl = Get.put(ProfileController());
  final accountKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      // backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: const Text("Account"),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        color: kLightBlueColor,
        onRefresh: () async {},
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  alignment: Alignment.bottomCenter,
                  // fit: BoxFit.cover,
                  opacity: 1,
                  repeat: ImageRepeat.repeat,
                  image: NetworkImage(
                    'https://registration.iimsambalpuradmissions.in/exphd/images/background.png',
                  ))),
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Form(
              key: accountKey,
              child: ListView(
                // physics: NeverScrollableScrollPhysics(),
                children: [
                  Column(
                    children: [
                      const CircleAvatar(
                        child: Text("Hi"),
                      ),
                      const Text("Student App"),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("User NAme:"),
                          const Text("Student Name")
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("User NAme:"),
                          const Text("Student Name")
                        ],
                      ),
                    ],
                  ),
                  const Divider(
                    color: kPrimaryColor,
                    thickness: 1,
                  ),
                  const Text(
                    "Parents Information",
                    style: TextStyle(
                        fontSize: FontSize.s18,
                        fontWeight: FontWeightManager.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          child: Text("M"),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Mother Name",
                                style: TextStyle(
                                    fontSize: FontSize.s16,
                                    fontWeight: FontWeightManager.bold),
                              ),
                              const Text(
                                "Mother",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          child: Text("P"),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Parents Name",
                                style: TextStyle(
                                    fontSize: FontSize.s16,
                                    fontWeight: FontWeightManager.bold),
                              ),
                              Text("Father"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  const Text(
                    "Account Setting",
                    style: TextStyle(
                        fontSize: FontSize.s18,
                        fontWeight: FontWeightManager.bold),
                  ),
                  AccountTextField(
                    validateMode: AutovalidateMode.onUserInteraction,
                    controller: accountCtrl.controller[0],
                    hint: "Current Password",
                    validator: (val) {
                      if (val.isEmpty) {
                        return "Required";
                      }
                    },
                  ),
                  AccountTextField(
                    validateMode: AutovalidateMode.onUserInteraction,
                    controller: accountCtrl.controller[1],
                    hint: "New password",
                    validator: (val) {
                      if (val.isEmpty) {
                        return "Required";
                      }
                    },
                  ),
                  AccountTextField(
                    validateMode: AutovalidateMode.onUserInteraction,
                    controller: accountCtrl.controller[2],
                    hint: "Confirm Password",
                    validator: (val) {
                      if (val.isEmpty) {
                        return "Required";
                      }
                    },
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  const Text(
                    "Address",
                    style: TextStyle(
                        fontSize: FontSize.s16,
                        fontWeight: FontWeightManager.bold),
                  ),
                  AccountTextField(
                    validateMode: AutovalidateMode.onUserInteraction,
                    controller: accountCtrl.controller[3],
                    hint: "address",
                    validator: (val) {
                      if (val.isEmpty) {
                        return "Required";
                      }
                    },
                  ),
                  const Text(
                    "City",
                    style: TextStyle(
                        fontSize: FontSize.s16,
                        fontWeight: FontWeightManager.bold),
                  ),
                  AccountTextField(
                    validateMode: AutovalidateMode.onUserInteraction,
                    controller: accountCtrl.controller[4],
                    hint: "city",
                    validator: (val) {
                      if (val.isEmpty) {
                        return "Required";
                      }
                    },
                  ),
                  const Text(
                    "State",
                    style: TextStyle(
                        fontSize: FontSize.s16,
                        fontWeight: FontWeightManager.bold),
                  ),
                  AccountTextField(
                    validateMode: AutovalidateMode.onUserInteraction,
                    controller: accountCtrl.controller[5],
                    hint: "state",
                    validator: (val) {
                      if (val.isEmpty) {
                        return "Required";
                      }
                    },
                  ),
                  const Text(
                    "Phone",
                    style: TextStyle(
                        fontSize: FontSize.s16,
                        fontWeight: FontWeightManager.bold),
                  ),
                  AccountTextField(
                    validateMode: AutovalidateMode.onUserInteraction,
                    controller: accountCtrl.controller[6],
                    maxLength: 10,
                    hint: "phone",
                    validator: (val) {
                      if (val.isEmpty) {
                        return "Required";
                      }
                    },
                  ),
                  const Text(
                    "Email",
                    style: TextStyle(
                        fontSize: FontSize.s16,
                        fontWeight: FontWeightManager.bold),
                  ),
                  AccountTextField(
                    validateMode: AutovalidateMode.onUserInteraction,
                    controller: accountCtrl.controller[7],
                    hint: "bdfjnc@123gamil.com",
                    validator: (val) {
                      if (val.isEmpty) {
                        return "Required";
                      }
                    },
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (accountKey.currentState!.validate()) {}
                        },
                        child: const Text("Submit")),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
