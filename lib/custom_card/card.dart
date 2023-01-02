import 'package:flutter/material.dart';
import 'package:schoolmanagement/custom_widgets/colors.dart';

class MyCardPage extends StatelessWidget {
  String? name;
  String? qualificatin;
  var age;
  String? address;
  bool? isShow;

  MyCardPage(
      {this.name,
      this.qualificatin,
      this.age,
      this.address,
      this.isShow,
      super.key});

  @override
  Widget build(BuildContext context) {
    int showValue = 1;
    return SizedBox(
      height: 120,
      child: Card(
        color: kDarkBlueColor,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name :",
                    style: TextStyle(color: kWhiteColor),
                  ),
                  Text(
                    "Qualification :",
                    style: TextStyle(color: kWhiteColor),
                  ),
                  Text(
                    "Age :",
                    style: TextStyle(color: kWhiteColor),
                  ),
                  Text(
                    "Address :",
                    style: TextStyle(color: kWhiteColor),
                  ),
                ],
              ),
              SizedBox(
                width: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name.toString(),
                    style: TextStyle(color: kWhiteColor),
                  ),
                  Text(
                    qualificatin.toString(),
                    style: TextStyle(color: kWhiteColor),
                  ),
                  Text(
                    age.toString(),
                    style: TextStyle(color: kWhiteColor),
                  ),
                  Text(
                    address.toString(),
                    style: TextStyle(color: kWhiteColor),
                  ),
                  // Switch(value:isShow , onChanged: (value){})
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
