import 'package:flutter/material.dart';
import 'package:flutter_application_6/app_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Color color;
  const CustomButton({
    super.key,
    required this.text,
    required this.width,
    required this.height,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(text, style: AppFonts.w600s18),
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      ),
    );
  }
}
