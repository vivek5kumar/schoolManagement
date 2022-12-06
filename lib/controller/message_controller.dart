import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  List<Map<String, dynamic>> messageList = [
    {"id": 1, "name": "Vivek Kumar", "msg": "Hey guy", "date": "12/11/2021"},
    {
      "id": 2,
      "name": "mantosh Kumar",
      "msg": "hello guy",
      "date": "12/11/2021"
    },
    {"id": 3, "name": "Garun Kumar", "msg": "Hey guy", "date": "12/11/2021"},
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
              content: SizedBox(
                  height: 75,
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        messageList[i]["date"].toString(),
                        style: const TextStyle(color: Colors.blue),
                      ),
                      Text(messageList[i]["name"]),
                      Text(
                        messageList[i]["msg"],
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                      )
                    ],
                  )),
            ),
          );
        });
  }
}
