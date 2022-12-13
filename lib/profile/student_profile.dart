import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmanagement/Utils/regex.dart';
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
  bool showPass = false;
  bool showPass1 = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: const Text("Account"),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        color: kLightBlueColor,
        onRefresh: () async {},
        child: Container(
          // decoration: const BoxDecoration(
          //     image: DecorationImage(
          //         alignment: Alignment.bottomCenter,
          //         // fit: BoxFit.cover,
          //         opacity: 1,
          //         repeat: ImageRepeat.repeat,
          //         image: NetworkImage(
          //           'https://registration.iimsambalpuradmissions.in/exphd/images/background.png',
          //         ))),
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
                        backgroundColor: kWhiteColor,
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
                          const Text(
                            "User NAme:",
                            style: TextStyle(
                              color: kWhiteColor,
                            ),
                          ),
                          const Text(
                            "Student Name",
                            style: TextStyle(
                              color: kWhiteColor,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "User NAme:",
                            style: TextStyle(
                              color: kWhiteColor,
                            ),
                          ),
                          const Text(
                            "Student Name",
                            style: TextStyle(
                              color: kWhiteColor,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const Divider(
                    color: kWhiteColor,
                    thickness: 1,
                  ),
                  const Text(
                    "Parents Information",
                    style: TextStyle(
                      fontSize: FontSize.s18,
                      fontWeight: FontWeightManager.bold,
                      color: kWhiteColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: kWhiteColor,
                          child: Text("M"),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Mother Name",
                                style: TextStyle(
                                    fontSize: FontSize.s16,
                                    fontWeight: FontWeightManager.bold,
                                    color: kWhiteColor),
                              ),
                              Text(
                                "Mother",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
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
                          backgroundColor: kWhiteColor,
                          child: Text("P"),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Parents Name",
                                style: TextStyle(
                                    fontSize: FontSize.s16,
                                    fontWeight: FontWeightManager.bold,
                                    color: kWhiteColor),
                              ),
                              const Text(
                                "Father",
                                style: TextStyle(color: kWhiteColor),
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
                  const Text(
                    "Account Setting :",
                    style: TextStyle(
                      fontSize: FontSize.s18,
                      fontWeight: FontWeightManager.bold,
                      color: kWhiteColor,
                    ),
                  ),
                  AccountTextField(
                    validateMode: AutovalidateMode.onUserInteraction,
                    controller: accountCtrl.controller[0],
                    security: !showPass,
                    maxLength: 10,
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          showPass = !showPass;
                        });
                      },
                      child: Icon(
                          showPass ? Icons.visibility : Icons.visibility_off),
                    ),
                    hint: "Current Password",
                    validator: (val) {
                      if (val.isEmpty) {
                        return "Required";
                      } else if (!passwordRegex.hasMatch(val)) {
                        return "Password must be 10 digit with alphabat ";
                      }
                    },
                  ),
                  AccountTextField(
                    validateMode: AutovalidateMode.onUserInteraction,
                    controller: accountCtrl.controller[1],
                    security: !showPass1,
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          showPass1 = !showPass1;
                        });
                      },
                      child: Icon(
                          showPass1 ? Icons.visibility : Icons.visibility_off),
                    ),
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
                    "Address :",
                    style: TextStyle(
                      fontSize: FontSize.s16,
                      fontWeight: FontWeightManager.bold,
                      color: kWhiteColor,
                    ),
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
                      fontWeight: FontWeightManager.bold,
                      color: kWhiteColor,
                    ),
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
                      fontWeight: FontWeightManager.bold,
                      color: kWhiteColor,
                    ),
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
                      fontWeight: FontWeightManager.bold,
                      color: kWhiteColor,
                    ),
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
                      fontWeight: FontWeightManager.bold,
                      color: kWhiteColor,
                    ),
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
                        const EdgeInsets.symmetric(horizontal: AppPadding.p10),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(20, 40),
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
