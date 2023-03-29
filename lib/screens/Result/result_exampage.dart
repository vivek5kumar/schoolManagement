import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmanagement/controller/resultController.dart';
import 'package:schoolmanagement/custom_widgets/colors.dart';
import 'package:schoolmanagement/custom_widgets/custom_sizes.dart';
import 'package:schoolmanagement/screens/Result/graphpage.dart';
import 'package:schoolmanagement/shopping/name_textfield.dart';

import 'package:schoolmanagement/shopping/statecity.dart';

import 'drop_plus.dart';

class ExamResult extends StatefulWidget {
  const ExamResult({super.key});

  @override
  State<ExamResult> createState() => _ExamResultState();
}

class _ExamResultState extends State<ExamResult> {
  final resultCtrl = Get.put(ExamResultController());
  // bool checkValue = false;

  int radioValue = 1;
  int selectedRadioTile = 1;

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  bool checkVal = false;

  hideBtnFun(int index, String name, bool isHide) {}

  List<bool> checkValue = [false, false, false, false, false];
  var btnName = ["Red", "Blue", "Green", "Yellow", "Pink"];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p12),
            child: Icon(Icons.picture_as_pdf_outlined),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p12),
            child: Icon(Icons.notifications),
          )
        ],
        centerTitle: true,
        title: const Text("Exam Result"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                alignment: Alignment.bottomCenter,
                // fit: BoxFit.cover,
                opacity: 1,
                repeat: ImageRepeat.repeat,
                image: NetworkImage(
                  'https://registration.iimsambalpuradmissions.in/exphd/images/background.png',
                ))),
        child: RefreshIndicator(
          color: Colors.red,
          onRefresh: () async {},
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: size.width * 0.4,
                      height: size.height * 0.05,
                      decoration: BoxDecoration(
                          color: Colors.blue[400],
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(
                              10,
                            ),
                            bottomLeft: Radius.circular(
                              10,
                            ),
                          )),
                      // color: Colors.blue[200],
                      child: const Center(
                          child: Text(
                        "Select Sem",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeightManager.bold),
                      )),
                    ),
                    Flexible(
                      flex: 7,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p2),
                        child: DropdownButtonFormField(
                            isDense: true,
                            validator: (value) {
                              if (value == "Select") {
                                return "Select Semester";
                              }
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              contentPadding: const EdgeInsets.all(10),
                            ),
                            value: resultCtrl.selectSem,
                            items: resultCtrl.examSemester.map((items) {
                              return DropdownMenuItem(
                                  value: items, child: Text(items));
                            }).toList(),
                            onChanged: (val) {
                              setState(() {
                                resultCtrl.selectSem = val.toString();
                              });
                            }),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      width: size.width * 0.4,
                      height: size.height * 0.05,
                      decoration: BoxDecoration(
                          color: Colors.blue[400],
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(
                              10,
                            ),
                            bottomLeft: Radius.circular(
                              10,
                            ),
                          )),
                      // color: Colors.blue[200],
                      child: const Center(
                          child: Text(
                        "Select Book",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeightManager.bold),
                      )),
                    ),
                    Flexible(
                      flex: 7,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p2),
                        child: DropdownButtonFormField(
                            validator: (value) {
                              return "Select Book";
                            },
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(12),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            value: resultCtrl.selectBook,
                            items: resultCtrl.semesterBook.map((books) {
                              return DropdownMenuItem(
                                  value: books, child: Text(books));
                            }).toList(),
                            onChanged: resultCtrl.selectSem != "Select"
                                ? (val) {
                                    setState(() {
                                      resultCtrl.selectBook = val.toString();
                                    });
                                  }
                                : null),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  for (int i = 0; i < btnName.length; i++)
                    CheckboxListTile(
                        value: checkValue[i],
                        title: Visibility(
                          visible: checkValue[i],
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(btnName[i]),
                          ),
                        ),
                        checkColor: Colors.red,
                        activeColor: Colors.yellow,
                        onChanged: (val) {
                          setState(() {
                            checkValue[i] = val!;
                          });
                        }),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.to(MyHomePage());
                  },
                  child: const Text("practice page")),
            ],
          ),
        ),
      ),
    );
  }
}
