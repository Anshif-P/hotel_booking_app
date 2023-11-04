import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/constance/colors.dart';
import 'package:hotel_booking_app/view_model/vendor_controller.dart';

class EditNameEmailTextFeild extends StatelessWidget {
  final TextEditingController controller;
  final double screenHeight;
  final double screenwidth;
  final FormFieldValidator validation;
  final VendorController vendorController;
  final String hintText;

  const EditNameEmailTextFeild({
    super.key,
    required this.vendorController,
    required this.validation,
    required this.screenHeight,
    required this.screenwidth,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          // key: vendorController.editProfileDetailsFormKey,
          style: GoogleFonts.inter(
              textStyle: TextStyle(fontSize: 14, color: Colors.black)),
          validator: validation,
          decoration: InputDecoration(
            errorStyle: TextStyle(color: Colors.red),
            border: InputBorder.none,
            isDense: true,
            constraints: const BoxConstraints(maxHeight: 70, minHeight: 35),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
            hintText: hintText,
            hintStyle: const TextStyle(color: Color(0xFF999999)),
          ),
          controller: controller,
        ),
        Divider(
          height: 0,
          thickness: 1,
          color: CustomColors.lightGreyColor,
        )
      ],
    );
  }
}
