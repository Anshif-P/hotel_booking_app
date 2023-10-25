import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextBookingWidget extends StatelessWidget {
  final String text;
  final bool sizeColorCheck;
  const TextBookingWidget(
      {super.key, required this.text, this.sizeColorCheck = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
          textStyle: TextStyle(
        color: sizeColorCheck ? Color(0xFF787878) : Colors.black,
        fontSize: sizeColorCheck ? 10 : 12,
      )),
    );
  }
}
