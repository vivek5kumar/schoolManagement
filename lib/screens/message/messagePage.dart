import 'package:flutter/material.dart';

class MessageInbox extends StatelessWidget {
  const MessageInbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Inbox"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Coming soon...",
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
