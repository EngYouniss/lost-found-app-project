import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String textLabel;
  final String hintText;
  final Icon? suffixIcon;
  final Icon? preffixIcon;
  final bool isSecure;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  const CustomFormField({
    Key? key,
    required this.controller,
    required this.textLabel,
    required this.hintText,
    this.suffixIcon,
    this.preffixIcon,
    this.isSecure = false,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: preffixIcon,
        labelText: textLabel,
        hintText: hintText,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(),
      ),
      obscureText: isSecure,
    );
  }
}
