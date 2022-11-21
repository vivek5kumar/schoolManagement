import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schoolmanagement/controller/signup_controller.dart';
import 'package:schoolmanagement/custom_widgets/text_formfield.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final signCtrl = Get.put(SignUpController());
  bool disableButton = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign-Up"),
        centerTitle: true,
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
        child: Form(
          key: signCtrl.signUpKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/profile.jpg"),
                    maxRadius: ScreenUtil().radius(55.r)),
              ),
              SizedBox(
                height: 30.h,
              ),
              ExpansionTile(
                title: Text(
                  "Personal Information",
                  style: TextStyle(fontSize: 18.sp),
                ),
                children: <Widget>[
                  Focus(
                      onFocusChange: (value) {
                        if (!value) {
                          setState(() {
                            signCtrl.nameAutoValidate = true;
                          });
                        }
                      },
                      child: Column(
                        children: [
                          RoundedTextField(
                            hint: "First Name*",
                            controller: signCtrl.signUpCtrl[0],
                            validateMode: AutovalidateMode.onUserInteraction,
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Required";
                              }
                            },
                          ),
                          RoundedTextField(
                            controller: signCtrl.signUpCtrl[1],
                            hint: "Middle Name",
                            validateMode: AutovalidateMode.onUserInteraction,
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Required";
                              }
                            },
                          ),
                          RoundedTextField(
                            controller: signCtrl.signUpCtrl[2],
                            hint: "Last Name",
                            validateMode: AutovalidateMode.onUserInteraction,
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Required";
                              }
                            },
                          ),
                          RoundedTextField(
                            hint: "Genter",
                            validateMode: AutovalidateMode.onUserInteraction,
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Required";
                              }
                            },
                          ),
                          RoundedTextField(
                            controller: signCtrl.signUpCtrl[3],
                            hint: "Date Of Birth",
                            validateMode: AutovalidateMode.onUserInteraction,
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Required";
                              }
                            },
                          ),
                          RoundedTextField(
                            controller: signCtrl.signUpCtrl[4],
                            hint: "State",
                            validateMode: AutovalidateMode.onUserInteraction,
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Required";
                              }
                            },
                          ),
                        ],
                      )),
                ],
              ),
              ExpansionTile(
                title: Text(
                  "Contact Information",
                  style: TextStyle(fontSize: 18.sp),
                ),
                children: [
                  Focus(
                      onFocusChange: (val) {
                        if (!val) {
                          setState(() {
                            signCtrl.addressAutoValidate = val;
                          });
                        }
                      },
                      child: Column(
                        children: [
                          RoundedTextField(
                            controller: signCtrl.signUpCtrl[5],
                            hint: "Address*",
                            validateMode: AutovalidateMode.onUserInteraction,
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Required";
                              }
                            },
                          ),
                          RoundedTextField(
                            controller: signCtrl.signUpCtrl[6],
                            hint: "City",
                            validateMode: AutovalidateMode.onUserInteraction,
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Required";
                              }
                            },
                          ),
                          RoundedTextField(
                            controller: signCtrl.signUpCtrl[7],
                            hint: "Zip Code",
                            validateMode: AutovalidateMode.onUserInteraction,
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Required";
                              }
                            },
                          ),
                          RoundedTextField(
                            controller: signCtrl.signUpCtrl[8],
                            hint: "Mobile Number",
                            validateMode: AutovalidateMode.onUserInteraction,
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Required";
                              }
                            },
                          ),
                          RoundedTextField(
                            controller: signCtrl.signUpCtrl[9],
                            hint: "Alternate Number",
                            validateMode: AutovalidateMode.onUserInteraction,
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Required";
                              }
                            },
                          ),
                          RoundedTextField(
                            controller: signCtrl.signUpCtrl[10],
                            hint: "xyz123346@gmail.com",
                            validateMode: AutovalidateMode.onUserInteraction,
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Required";
                              }
                            },
                          ),
                        ],
                      ))
                ],
              ),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // primary: kpurpleColor,

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      minimumSize: Size(100, 40),
                    ),
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (signCtrl.signUpKey.currentState!.validate()) {
                        signCtrl.clearField();
                      }
                    },
                    child: const Text("Submit")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
