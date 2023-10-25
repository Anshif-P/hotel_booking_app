import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CouponTextWidget extends StatelessWidget {
  final String text;
  const CouponTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
          textStyle: const TextStyle(
        color: Colors.black,
        fontSize: 14,
      )),
    );
  }
}
