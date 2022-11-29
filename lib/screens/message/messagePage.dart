import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmanagement/controller/message_controller.dart';

class MessageInbox extends StatelessWidget {
  MessageInbox({super.key});
  final msgController = Get.put(MessageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Inbox"),
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
          child: ListView.builder(
              itemCount: msgController.messageList.length,
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () {
                    msgController.showMessageDia(context, i);
                  },
                  child: Card(
                    color: Colors.red[100],
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.message),
                      trailing:
                          Text(msgController.messageList[i]["date"].toString()),
                      title: Text(msgController.messageList[i]["name"]),
                      // subtitle: Text(msgController.messageList[i]["msg"]),
                    ),
                  ),
                );
              }),
        ));
  }
}
