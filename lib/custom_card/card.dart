import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyCardPage extends StatelessWidget {
  int? index;
  String? tagName;
  String? child;
  MyCardPage({this.index, this.tagName, this.child, super.key});
  List<String> productName = [
    "Laptop",
    "Shoes",
    "Mobile",
    "Shorts",
    "LedTv",
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productName.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return Card(
            child: Center(child: Text(productName[index])),
          );
        });
  }
}
