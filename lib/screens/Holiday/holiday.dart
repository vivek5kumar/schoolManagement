import 'package:flutter/material.dart';

class HolidaysPage extends StatelessWidget {
  const HolidaysPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Holiday List"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [const Text("coming soon...")],
        ),
      ),
    );
  }
}
