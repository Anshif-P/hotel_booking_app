import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/constance/colors.dart';

class HeadingTextWidget extends StatelessWidget {
  final text;
  final bool sizeCheck;
  HeadingTextWidget({super.key, required this.text, this.sizeCheck = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
          textStyle: TextStyle(
        color: sizeCheck ? CustomColors.mainColor : Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: sizeCheck ? 20 : 25,
      )),
    );
  }
}
