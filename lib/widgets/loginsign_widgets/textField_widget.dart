import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String text;
  final String hintText;
  final TextEditingController controller;
  final IconData icon;
  final bool textFieldSizeCheck;
  final FormFieldValidator validator;

  const TextFieldWidget(
      {super.key,
      required this.text,
      required this.hintText,
      required this.controller,
      required this.icon,
      required this.validator,
      this.textFieldSizeCheck = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          // height: 48,
          // width: textFieldSizeCheck ? 162 : null,
          child: TextFormField(
            onEditingComplete: () {
              FocusScope.of(context)
                  .nextFocus(); // Move focus to the next field
            },
            validator: validator,
            controller: controller,
            decoration: InputDecoration(
              isDense: true,
              constraints: const BoxConstraints(maxHeight: 70, minHeight: 35),
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
              prefixIcon: Icon(
                icon,
                color: text != 'Property Location'
                    ? const Color(0xFFE5E5E5)
                    : const Color(0xFFCB102F),
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
}
