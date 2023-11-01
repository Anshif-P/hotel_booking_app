import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DatePickingWidget extends StatelessWidget {
  final String text;
  final String hintText;
  final TextEditingController controller;
  final double widthMedia;

  final FormFieldValidator validator;

  const DatePickingWidget({
    super.key,
    required this.widthMedia,
    required this.text,
    required this.hintText,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: widthMedia * 0.015,
            ),
            Text(text),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          child: TextFormField(
            readOnly: true,
            onEditingComplete: () {
              FocusScope.of(context)
                  .nextFocus(); // Move focus to the next field
            },
            style: GoogleFonts.inter(textStyle: TextStyle(fontSize: 13.6)),
            validator: validator,
            controller: controller,
            decoration: InputDecoration(
              isDense: true,
              constraints: const BoxConstraints(
                maxHeight: 70,
                minHeight: 35,
              ),
              suffixIcon: IconButton(
                  onPressed: () {
                    _showDate1(context, controller);
                  },
                  icon: Icon(Icons.date_range)),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Colors.red), // Set the border color when focused
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Colors.red), // Set the border color when focused
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Colors.black), // Set the border color when focused
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Color(
                        0xFFD1D1D1)), // Set the border color when not focused
                borderRadius: BorderRadius.circular(10.0),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              hintText: hintText,
              hintStyle: const TextStyle(color: Color(0xFF999999)),
            ),
          ),
        ),
      ],
    );
  }

  void _showDate1(BuildContext context, TextEditingController date) async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    ).then((value) {
      if (value == null) {
        return;
      } else {
        date.text = DateFormat('E, d MMM y').format(value);
      }
    });
  }
}
