import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constance/colors.dart';

class BottomNavigationTextWidget extends StatelessWidget {
  final String text;
  final bool colorCheck;
  const BottomNavigationTextWidget(
      {super.key, required this.text, required this.colorCheck});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
          textStyle: TextStyle(
        color: colorCheck ? CustomColors.lightGreyColor : Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 10,
      )),
    );
  }
}
