import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmanagement/custom_widgets/colors.dart';

class MessageController extends GetxController {
  List<Map<String, dynamic>> messageList = [
    {"id": 1, "name": "Vivek Kumar", "msg": "hi vivek kumar", "date": ""},
    {
      "id": 2,
      "name": "mantosh Kumar",
      "msg": "hi mantosh how r you",
      "date": ""
    },
    {"id": 3, "name": "Garun Kumar", "msg": "", "date": "12/11/2021"},
    {"id": 4, "name": "Manish Kumar", "msg": "Hey guy", "date": "12/11/2021"},
    {"id": 5, "name": "Nishant Kumar", "msg": "", "date": "12/11/2021"},
    {"id": 6, "name": "Akash Kumar", "msg": "Hey guy", "date": "12/11/2021"},
    {"id": 7, "name": "Vaibhav Kumar", "msg": "Hey guy", "date": "12/11/2021"},
    {"id": 8, "name": "Ankit Kumar", "msg": "", "date": "12/11/2021"},
    {
      "id": 10,
      "name": "Abhishek Kumar",
      "msg": "Hey guy",
      "date": "12/11/2021"
    },
    {"id": 11, "name": "Bablu Kumar", "msg": "Hey guy", "date": "12/11/2021"},
    {"id": 12, "name": "Bablu Kumar", "msg": "Hey guy", "date": "12/11/2021"},
    {"id": 13, "name": "Bablu Kumar", "msg": "Hey guy", "date": "12/11/2021"},
  ];

  showMessageDialog(context, i) {
    return showDialog(
        context: context,
        builder: (
          context,
        ) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: AlertDialog(
              backgroundColor: kRedColor,
              content: SizedBox(
                  height: 75,
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      messageList[i].containsKey("date") && messageList[i] != ""
                          ? Text(
                              messageList[i]["date"].toString(),
                              style: const TextStyle(color: kWhiteColor),
                            )
                          : const Text("no data",
                              style: const TextStyle(color: kWhiteColor)),
                      Text(
                        messageList[i]["name"],
                        style: const TextStyle(color: kWhiteColor),
                      ),
                      Visibility(
                        visible: messageList[i]["msg"] != "" &&
                            messageList[i].containsKey("msg"),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Text("SMS :"),
                                Text(
                                  messageList[i]["msg"],
                                  style: const TextStyle(color: kWhiteColor),
                                ),
                              ],
                            ),
                            InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const AlertDialog(
                                          actions: [Text("hi")],
                                        );
                                      });
                                },
                                child: const Text("more"))
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          );
        });
  }
}
