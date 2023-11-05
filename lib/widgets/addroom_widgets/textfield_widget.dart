import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/view_model/addroom_controller.dart';

class TextFeildAddRoomWidget extends StatelessWidget {
  final String text;
  final String hintText;
  final double widthMedia;
  final double heightMedia;
  final FormFieldValidator validationFunction;
  final TextEditingController controller;
  final bool descriptionSizeCheck;
  final bool textFieldSizeCheck;
  final bool keyboardType;

  const TextFeildAddRoomWidget(
      {super.key,
      this.keyboardType = false,
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
          // color: Colors.yellow,
          height:
              descriptionSizeCheck ? heightMedia * 0.14 : heightMedia * 0.056,
          width: textFieldSizeCheck ? widthMedia * 0.41 : widthMedia * 0.889,
          child: GetBuilder<AddRoomController>(
            builder: (controllers) => TextFormField(
              onEditingComplete: () {
                FocusScope.of(context).nextFocus();
              },
              validator: validationFunction,
              maxLines: descriptionSizeCheck ? 5 : 1,
              controller: controller,
              keyboardType: keyboardType ? TextInputType.number : null,
              decoration: InputDecoration(
                isDense: true,
                constraints: descriptionSizeCheck != true
                    ? const BoxConstraints(maxHeight: 45, minHeight: 35)
                    : null,
                // focusedErrorBorder: OutlineInputBorder(
                //   borderSide: const BorderSide(color: Colors.red),
                //   borderRadius: BorderRadius.circular(4),
                // ),

                // errorBorder: OutlineInputBorder(
                //   borderSide: const BorderSide(color: Colors.red),
                //   borderRadius: BorderRadius.circular(4),
                // ),

                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(4),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFFD1D1D1)),
                  borderRadius: BorderRadius.circular(4),
                ),
                contentPadding: descriptionSizeCheck
                    ? const EdgeInsets.only(
                        top: 20,
                        left: 15,
                      )
                    : const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                hintText: hintText,
                hintStyle: GoogleFonts.inter(
                    textStyle: const TextStyle(
                  color: Color(0xFF999999),
                  fontSize: 14,
                )),
              ),
            ),
          ),
        )
      ],
    );
  }
}
