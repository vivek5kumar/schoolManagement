import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmanagement/custom_widgets/colors.dart';

class MessageController extends GetxController {
  List<Map<String, dynamic>> messageList = [
    {"id": 1, "name": "Vivek Kumar", "msg": "Hey guy", "date": "12/11/2021"},
    {
      "id": 2,
      "name": "mantosh Kumar",
      "msg": "hello guy",
      "date": "12/11/2021"
    },
    {
      "id": 3,
      "name": "Garun Kumar",
      "msg": "hello garun,how r you",
      "date": "12/11/2021"
    },
    {"id": 4, "name": "Manish Kumar", "msg": "Hey guy", "date": "12/11/2021"},
    {"id": 5, "name": "Nishant Kumar", "msg": "Hey guy", "date": "12/11/2021"},
    {"id": 6, "name": "Akash Kumar", "msg": "Hey guy", "date": "12/11/2021"},
    {"id": 7, "name": "Vaibhav Kumar", "msg": "Hey guy", "date": "12/11/2021"},
    {"id": 8, "name": "Ankit Kumar", "msg": "Hey guy", "date": "12/11/2021"},
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
              backgroundColor: kLightYellowColor,
              content: SizedBox(
                  height: 75,
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      messageList[i].containsKey("msg")
                          ? Text(
                              messageList[i]["date"].toString(),
                              style: const TextStyle(color: kWhiteColor),
                            )
                          : Text("no data"),
                      Text(
                        messageList[i]["name"],
                        style: const TextStyle(color: kWhiteColor),
                      ),
                      Visibility(
                        visible: messageList[i]["msg"] != "",
                        child: Row(
                          children: [
                            Text("SMS :"),
                            Text(
                              messageList[i]["msg"],
                              style: const TextStyle(color: kWhiteColor),
                            ),
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
