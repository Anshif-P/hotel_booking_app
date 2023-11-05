import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/constance/colors.dart';
import 'package:hotel_booking_app/view_model/vendor_controller.dart';

class EditProfileTextFeildWdiget extends StatelessWidget {
  final TextEditingController textEditingController;
  final double screenHeight;
  final double screenwidth;
  final FormFieldValidator validation;
  final String text;
  final String hintText;
  final bool feildControll;
  final bool dividerCheck;
  final VendorController vendorController;
  const EditProfileTextFeildWdiget(
      {super.key,
      required this.vendorController,
      required this.validation,
      this.dividerCheck = false,
      required this.screenHeight,
      required this.screenwidth,
      required this.textEditingController,
      this.feildControll = false,
      required this.hintText,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Text(
              text,
              style: GoogleFonts.inter(
                  textStyle:
                      const TextStyle(fontSize: 14, color: Colors.black)),
            )),
            Expanded(
              child: GetBuilder<VendorController>(
                builder: (controller) => TextFormField(
                  controller: textEditingController,
                  style: GoogleFonts.inter(
                      textStyle:
                          const TextStyle(fontSize: 14, color: Colors.black)),
                  validator: validation,
                  decoration: InputDecoration(
                    // errorBorder: InputBorder.none,
                    //  errorStyle: const TextStyle(color: Colors.red),

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
                  // textAlign: TextAlign.end,
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
          ],
        ),
        dividerCheck
            ? const SizedBox()
            : Divider(
                thickness: 1,
                color: CustomColors.lightGreyColor,
              ),
      ],
    );
  }
}
