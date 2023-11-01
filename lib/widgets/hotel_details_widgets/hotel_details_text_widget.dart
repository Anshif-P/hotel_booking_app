import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/constance/colors.dart';

class HotelDetailsTextWidget extends StatelessWidget {
  final String text;
  final bool sizeCheck;
  final bool colorCheck;
  const HotelDetailsTextWidget(
      {super.key,
      required this.text,
      this.sizeCheck = false,
      this.colorCheck = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.inter(
          textStyle: TextStyle(
        color: colorCheck ? CustomColors.lightGreyColor : Colors.black,
        fontSize: sizeCheck ? 20 : 14,
      )),
    );
  }
}
