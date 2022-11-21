import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoundedTextField extends StatelessWidget {
  String? hint;
  String? heading;
  String? style;
  String? counterText;
  int? maxLength;
  int? maxLine;
  bool? security;
  bool? readOnly;
  Widget? suffix;
  Widget? prefix;
  Widget? onTap;
  Icon? icons;
  TextInputType? input;
  AutovalidateMode? validateMode;
  var validator;
  TextEditingController? controller;

  Color? color;
  RoundedTextField(
      {this.hint,
      this.heading,
      this.style,
      this.counterText,
      this.maxLength,
      this.maxLine,
      this.security,
      this.readOnly,
      this.prefix,
      this.suffix,
      this.onTap,
      this.input,
      this.validateMode,
      this.validator,
      this.controller,
      this.color,
      this.icons,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
          controller: controller,
          readOnly: readOnly ?? false,
          keyboardType: input,
          validator: validator,
          autovalidateMode: validateMode,
          obscureText: security ?? false,
          maxLength: maxLength,
          decoration: InputDecoration(
            icon: icons,
            fillColor: Colors.white,
            filled: true,
            contentPadding: const EdgeInsets.all(10.0),
            hintText: hint,
            labelText: heading,
            suffix: suffix,
            // prefix: preFix,
            prefixIcon: prefix,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
          )),
    );
  }
}
