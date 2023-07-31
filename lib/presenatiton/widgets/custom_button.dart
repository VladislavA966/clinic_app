import 'package:flutter/material.dart';
import 'package:flutter_application_6/presenatiton/resources/fonts/app_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: AppFonts.w600s18.copyWith(
            color: Color(0xffffffff),
          ),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff4A86CC),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      ),
    );
  }
}
