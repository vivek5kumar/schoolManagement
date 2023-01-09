import 'package:flutter/material.dart';

import 'package:schoolmanagement/custom_card/card.dart';
import 'package:schoolmanagement/custom_widgets/colors.dart';
import 'package:schoolmanagement/screens/Result/cyclecpage.dart';
import 'package:schoolmanagement/screens/Result/pan_verify_page.dart';

class PracticePage extends StatefulWidget {
  const PracticePage({super.key});

  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  var showDataList = [];
  List<Map<String, dynamic>> userDetails = [
    {
      "id": 1,
      "name": "Vivek Kumar",
      "qualification": "Graduate",
      "age": "12/11/2021",
      "address": "allahabad"
    },
    {
      "id": 2,
      "name": "mantosh Kumar",
      "qualification": "Graduate",
      "age": "12/11/2021",
      "address": "allahabad"
    },
    {
      "id": 3,
      "name": "Garun Kumar",
      "qualification": "Graduate",
      "age": "12/11/2021",
      "address": "allahabad"
    },
    {
      "id": 4,
      "name": "Manish Kumar",
      "qualification": "Graduate",
      "age": "12/11/2021",
      "address": "allahabad"
    },
    {
      "id": 5,
      "name": "Nishant Kumar",
      "qualification": "Graduate",
      "age": "12/11/2021",
      "address": "allahabad"
    },
    {"id": 6, "name": "Akash Kumar", "msg": "Hey guy", "date": "12/11/2021"},
    {
      "id": 7,
      "name": "Vaibhav Kumar",
      "qualification": "Graduate",
      "age": "12/11/2021",
      "address": "allahabad"
    },
    {"id": 8, "name": "Ankit Kumar", "msg": "Hey guy", "date": "12/11/2021"},
    {
      "id": 10,
      "name": "Abhishek Kumar",
      "msg": "Hey guy",
      "date": "12/11/2021"
    },
    {
      "id": 11,
      "name": "Bablu Kumar",
      "qualification": "Graduate",
      "age": "12/11/2021",
      "address": "allahabad"
    },
    {
      "id": 12,
      "name": "Bablu Kumar",
      "qualification": "Graduate",
      "age": "12/11/2021",
      "address": "allahabad"
    },
    {
      "id": 13,
      "name": "Bablu Kumar",
      "qualification": "Graduate",
      "age": "12/11/2021",
      "address": "allahabad"
    },
  ];

  switchFun(int index) {
    setState(() {
      if (!showDataList.contains(index)) {
        showDataList.add(index);
      } else {
        showDataList.removeWhere((element) => element == index);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < userDetails.length; i++) {
      showDataList.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            // backgroundColor: kGreyColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kDarkBlueColor,
              title: const Text("Verification Page"),
              centerTitle: true,
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(25)),
                  child: TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    indicator: BoxDecoration(
                        color: Colors.green[300],
                        borderRadius: BorderRadius.circular(25)),
                    tabs: [
                      Tab(
                        text: "EMAIL",
                      ),
                      Tab(
                        text: "PAN",
                      ),
                      Tab(
                        text: "BANK",
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      ListView.builder(
                          itemCount: userDetails.length,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Switch(
                                    activeColor: kDarkBlueColor,
                                    value: showDataList.contains(index),
                                    onChanged: (val) {
                                      switchFun(
                                        index,
                                      );
                                    }),
                                showDataList.contains(index)
                                    ? MyCardPage(
                                        name: userDetails[index]["name"],
                                        qualificatin: userDetails[index]
                                                .containsKey("qualification")
                                            ? userDetails[index]
                                                ["qualification"]
                                            : userDetails[index]["msg"],
                                        age: userDetails[index]["age"],
                                        address: userDetails[index]["address"],
                                      )
                                    : const Text(""),
                              ],
                            );
                          }),
                      PanVerifyPage(),
                      TrackingPage()
                    ],
                  ),
                ),
              ],
            )));
  }
}