import 'package:flutter/material.dart';

class AccountTextField extends StatelessWidget {
  String? hint;
  String? heading;
  String? style;
  String? counterText;
  int? maxLength;
  int? maxLine;
  TextInputType? input;
  AutovalidateMode? validateMode;
  TextEditingController? controller;
  Color? color;
  var validator;
  AccountTextField(
      {this.heading,
      this.hint,
      this.maxLength,
      this.maxLine,
      this.counterText,
      this.style,
      this.input,
      this.validateMode,
      this.controller,
      this.validator,
      this.color,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        maxLength: maxLength,
        // style: TextStyle(),
        style: const TextStyle(),
        controller: controller,
        validator: validator,
        autovalidateMode: validateMode,
        decoration: InputDecoration(
            counterText: "",
            fillColor: Colors.white,
            filled: true,
            contentPadding: const EdgeInsets.all(10.0),
            hintText: hint,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
