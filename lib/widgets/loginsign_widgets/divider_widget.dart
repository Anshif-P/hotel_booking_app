import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 162,
          height: 1,
          color: const Color(0xFFD1D1D1),
        ),
        const SizedBox(
          width: 5,
        ),
        const Text(
          'Or',
          style: TextStyle(
              color: Color(0xFFA19B9B),
              fontWeight: FontWeight.bold,
              fontSize: 13),
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          color: const Color(0xFFD1D1D1),
          width: 162,
          height: 1,
        ),
        // Divider(
        //   color: Color(0xFFDADADA),
        //   height: 25,
        //   thickness: 1,
        //   indent: 5,
        //   endIndent: 5,
        // ),
      ],
    );
  }
}
