import 'package:flutter/material.dart';
import 'package:schoolmanagement/custom_widgets/colors.dart';

class TabViewPage extends StatelessWidget {
  const TabViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
          text: const TextSpan(
              text: "Hello",
              style: TextStyle(color: kDarkBlueColor),
              children: [
            TextSpan(
              text: " Welcome to mypage",
              style: TextStyle(color: kRedColor, fontSize: 16),
            ),
          ])),
    );
  }
}
