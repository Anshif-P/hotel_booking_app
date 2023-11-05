// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RevenueCustomerBookingsTextfielWidget extends StatelessWidget {
  final BuildContext contextHome;
  final IconData icon;
  final String text;
  final String value;
  final bool sizeCheck;
  const RevenueCustomerBookingsTextfielWidget({
    super.key,
    required this.contextHome,
    required this.icon,
    required this.text,
    required this.value,
    this.sizeCheck = false,
  });
  //  width: widthMedia * 0.37,
  // height: heightMedia * 0.054,

  @override
  Widget build(BuildContext context) {
    double widthMedia = MediaQuery.sizeOf(contextHome).width;
    double heightMedia = MediaQuery.sizeOf(contextHome).height;

    return Container(
      width: sizeCheck ? widthMedia * 0.885 : widthMedia * 0.405,
      height: heightMedia * 0.065,
      constraints: const BoxConstraints(minHeight: 50),
      // width: 160,4AA
      // height: 51,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(7))),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Row(
                children: [
                  const SizedBox(
                    width: 12,
                  ),
                  Icon(icon),
                  SizedBox(
                    width: widthMedia * 0.028,
                  ),
                  Container(
                    width: 1,
                    height: heightMedia * 0.055,
                    color: const Color(0xFFD1D1D1),
                  )
                ],
              )),
          Expanded(
              flex: sizeCheck ? 5 : 2,
              child: Container(
                  // color: Colors.green,
                  child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 7),
                child: Column(
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
                      height: 3,
                    ),
                    sizeCheck
                        ? Row(
                            children: [
                              Text(
                                'total : ',
                                style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                )),
                              ),
                              Text(
                                '₹' + value,
                                style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                )),
                              ),
                            ],
                          )
                        : Text(
                            'total : ' + value,
                            style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            )),
                          ),
                  ],
                ),
              ))),
        ],
      ),
    );
  }
}
