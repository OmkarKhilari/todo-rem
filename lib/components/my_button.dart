import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  MyButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Color(0xff4B33A9).withOpacity(0.1),
      child: Text(text, style: GoogleFonts.rubik(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color(0xffBABABA)
      ),),
    );
  }
}