import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFeildAddRoomWidget extends StatelessWidget {
  final String text;
  final String hintText;
  final double widthMedia;
  final double heightMedia;
  final FormFieldValidator validationFunction;
  final TextEditingController controller;
  final bool descriptionSizeCheck;
  final bool textFieldSizeCheck;

  const TextFeildAddRoomWidget(
      {super.key,
      required this.validationFunction,
      required this.text,
      required this.hintText,
      required this.controller,
      required this.heightMedia,
      required this.widthMedia,
      this.textFieldSizeCheck = false,
      this.descriptionSizeCheck = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: GoogleFonts.inter(
              textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 12,
          )),
        ),
        const SizedBox(
          height: 6,
        ),
        Container(
          constraints: BoxConstraints(minHeight: 45),
          // color: Colors.yellow,
          height:
              descriptionSizeCheck ? heightMedia * 0.14 : heightMedia * 0.054,
          width: textFieldSizeCheck ? widthMedia * 0.41 : widthMedia * 0.889,
          child: TextFormField(
            onEditingComplete: () {
              FocusScope.of(context).nextFocus();
            },
            validator: validationFunction,
            maxLines: descriptionSizeCheck ? 5 : 1,
            controller: controller,
            decoration: InputDecoration(
              constraints: const BoxConstraints(maxHeight: 70, minHeight: 35),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Colors.red), // Set the border color when focused
                borderRadius: BorderRadius.circular(4),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Colors.red), // Set the border color when focused
                borderRadius: BorderRadius.circular(4),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Colors.black), // Set the border color when focused
                borderRadius: BorderRadius.circular(4),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Color(
                        0xFFD1D1D1)), // Set the border color when not focused
                borderRadius: BorderRadius.circular(4),
              ),
              contentPadding: descriptionSizeCheck
                  ? const EdgeInsets.only(top: 20, left: 15)
                  : const EdgeInsets.only(
                      left: 10,
                    ),
              hintText: hintText,
              hintStyle: GoogleFonts.inter(
                  textStyle: const TextStyle(
                color: Color(0xFF999999),
                fontSize: 14,
              )),
            ),
          ),
        )
      ],
    );
  }
}
