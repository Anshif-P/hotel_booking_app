import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardText extends StatelessWidget {
  final String text2;
  final String text1;
  final bool colorCheck;
  const CardText(
      {super.key,
      required this.text1,
      required this.text2,
      this.colorCheck = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text1 : $text2',
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.inter(
          textStyle: TextStyle(
        color: colorCheck ? const Color(0xFFA19B9B) : Colors.black,
        fontSize: 10,
      )),
    );
  }
}
