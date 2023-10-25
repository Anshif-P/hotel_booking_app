import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/constance/colors.dart';

class BookingTextWidget extends StatelessWidget {
  final String text2;
  final String text1;
  final bool colorCheck;
  const BookingTextWidget(
      {super.key,
      required this.text1,
      required this.text2,
      this.colorCheck = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text1 : $text2',
      style: GoogleFonts.inter(
          textStyle: TextStyle(
        color: colorCheck ? const Color(0xFFA19B9B) : CustomColors.blueColor,
        fontSize: 10,
      )),
    );
  }
}
