import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/constance/colors.dart';

import 'card_text_widget.dart';

class RoomCardWidget extends StatelessWidget {
  final double widthMedia;
  final double heightMedia;
  const RoomCardWidget(
      {super.key, required this.heightMedia, required this.widthMedia});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: widthMedia * 0.9,

            // height: 120,
            height: heightMedia * 0.15,
            decoration: BoxDecoration(
                // color: Colors.yellow,
                borderRadius: BorderRadius.circular(9),
                border: Border.all(color: CustomColors.lightGreyColor)),
            child: Row(children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    //  color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.blue[900],
                              borderRadius: BorderRadius.circular(7)),
                          width: widthMedia * 0.24,
                          height: heightMedia * 0.12,
                        ),
                      ],
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: widthMedia * 0.12,
                    //  color: Colors.yellow,
                    height: heightMedia * 0.12,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: heightMedia * 0.006,
                          ),
                          Text(
                            'Greeny',
                            style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600)),
                          ),
                          SizedBox(
                            height: heightMedia * 0.006,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Color(0xFFCB102F),
                                size: 16,
                              ),
                              Text(
                                'Kerala , India',
                                style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                  color: Color(0xFFA19B9B),
                                  fontSize: 12,
                                )),
                              )
                            ],
                          ),
                          SizedBox(
                            height: heightMedia * 0.006,
                          ),
                          const CardText(
                              text1: 'Property type', text2: "Hotel"),
                          SizedBox(
                            height: heightMedia * 0.006,
                          ),
                          const CardText(text1: 'Category', text2: "Classic"),
                          SizedBox(
                            height: heightMedia * 0.006,
                          ),
                          Row(
                            children: [
                              Text(
                                'Price : ',
                                style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                )),
                              ),
                              Text(
                                '₹1200',
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                  color: CustomColors.greenColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: widthMedia * 0.12,
                    //    color: Colors.green,
                    height: heightMedia * 0.14,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: heightMedia * 0.016,
                            ),
                            Icon(
                              Icons.delete,
                              color: CustomColors.mainColor,
                              size: 20,
                            ),
                            SizedBox(
                              height: heightMedia * 0.016,
                            ),
                            Text(
                              'View',
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
                                fontSize: 9,
                              )),
                            ),
                            SizedBox(
                              height: heightMedia * 0.01,
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                minimumSize:
                                    MaterialStateProperty.all(Size(10, 25)),
                                backgroundColor: MaterialStateProperty.all(
                                    CustomColors.greenColor),
                              ),
                              onPressed: () {},
                              child: Text(
                                'Edit',
                                style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 9,
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ))
            ])),
      ],
    );
  }
}
