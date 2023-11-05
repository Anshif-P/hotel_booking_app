import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constance/colors.dart';

class RoomStatusWidget extends StatelessWidget {
  const RoomStatusWidget(
      {super.key,
      required this.heightMedia,
      required this.widthMedia,
      required this.text});
  final double widthMedia;
  final double heightMedia;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: widthMedia * 0.14,
      height: heightMedia * 0.02,
      decoration: BoxDecoration(
          color: CustomColors.greenColor,
          borderRadius: BorderRadius.circular(3)),
      child: Text(
        text,
        style: GoogleFonts.inter(
            textStyle: TextStyle(
          color: Colors.white,
          fontSize: 10,
        )),
      ),
    );
  }
}
