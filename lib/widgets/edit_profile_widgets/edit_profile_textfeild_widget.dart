import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/constance/colors.dart';

class EditProfileTextFeildWdiget extends StatelessWidget {
  final TextEditingController controller;
  final double screenHeight;
  final double screenwidth;
  final FormFieldValidator validation;
  final String text;
  final String hintText;
  final bool feildControll;
  final bool dividerCheck;
  const EditProfileTextFeildWdiget(
      {super.key,
      required this.validation,
      this.dividerCheck = false,
      required this.screenHeight,
      required this.screenwidth,
      required this.controller,
      this.feildControll = false,
      required this.hintText,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //  height: screenHeight * 0.064,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                //color: Colors.yellow,
                child: Text(
                  text,
                  style: GoogleFonts.inter(
                      textStyle: TextStyle(fontSize: 14, color: Colors.black)),
                ),
              )),
              Expanded(
                child: TextFormField(
                  style: GoogleFonts.inter(
                      textStyle: TextStyle(fontSize: 14, color: Colors.black)),
                  validator: validation,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintTextDirection: TextDirection.rtl,
                    isDense: true,
                    constraints:
                        const BoxConstraints(maxHeight: 70, minHeight: 35),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                    hintText: hintText,
                    hintStyle: const TextStyle(color: Color(0xFF999999)),
                  ),
                  controller: controller,
                ),
              ),
            ],
          ),
          dividerCheck
              ? SizedBox()
              : Divider(
                  thickness: 1,
                  color: CustomColors.lightGreyColor,
                ),
        ],
      ),
    );
  }
}
