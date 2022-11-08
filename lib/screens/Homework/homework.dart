import 'package:flutter/material.dart';

class HomeworkPage extends StatelessWidget {
  const HomeworkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homework List"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text("coming soon...")],
        ),
      ),
    );
  }
}
