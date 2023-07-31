import 'package:flutter/material.dart';
import 'package:flutter_application_6/presenatiton/resources/fonts/app_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  CustomTextField(
      {super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
        hintStyle: AppFonts.w400s15,
        hintText: hintText,
      ),
    );
  }
}
