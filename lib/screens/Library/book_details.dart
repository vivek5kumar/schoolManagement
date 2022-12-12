import 'package:flutter/material.dart';
import 'package:schoolmanagement/custom_widgets/colors.dart';

class BookDetailsPage extends StatelessWidget {
  String? name;
  BookDetailsPage({this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: kDarkBlueColor, 
        appBar: AppBar(
          title: const Text("Book Details"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [Text("Book Name:${name.toString()}")],
          ),
        ));
  }
}
