import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmanagement/controller/message_controller.dart';
import 'package:schoolmanagement/custom_widgets/colors.dart';

class MessageInbox extends StatelessWidget {
  MessageInbox({super.key});
  final msgController = Get.put(MessageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kDarkBlueColor,
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
                    msgController.showMessageDialog(context, i);
                  },
                  child: Card(
                    color: kDarkBlueColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.message,
                        color: kWhiteColor,
                      ),
                      trailing: Text(
                        msgController.messageList[i]["date"].toString(),
                        style: const TextStyle(color: kWhiteColor),
                      ),
                      title: Text(
                        msgController.messageList[i]["name"],
                        style: const TextStyle(color: kWhiteColor),
                      ),
                      // subtitle: Text(msgController.messageList[i]["msg"]),
                    ),
                  ),
                );
              }),
        ));
  }
}
