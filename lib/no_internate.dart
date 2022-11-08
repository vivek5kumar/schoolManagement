import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InternateChecking extends StatelessWidget {
  const InternateChecking({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red,
      body: Center(
          child: Text(
        "No Internate",
        style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
      )),
    );
  }
}
