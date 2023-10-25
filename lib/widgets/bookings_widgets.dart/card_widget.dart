import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hotel_booking_app/constance/colors.dart';
import 'package:hotel_booking_app/widgets/bookings_widgets.dart/booking_text_widget.dart';

class BookingCardWidget extends StatelessWidget {
  final double widthMedia;
  final double heightMedia;
  const BookingCardWidget(
      {super.key, required this.heightMedia, required this.widthMedia});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: CustomColors.lightGreyColor)),
          width: widthMedia * 0.9,
          height: heightMedia * 0.15,
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blue[900],
                            borderRadius: BorderRadius.circular(10)),
                        width: widthMedia * 0.24,
                        height: heightMedia * 0.12,
                      ),
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                      //  color: Colors.yellow,
                      child: SizedBox(
                    width: widthMedia * 0.12,
                    //  color: Colors.yellow,
                    height: heightMedia * 0.12,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: heightMedia * 0.006,
                          ),
                          Text(
                            'Booking ID : 583028',
                            style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            )),
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
                          const BookingTextWidget(
                              colorCheck: true, text1: 'Name', text2: "Anshif"),
                          SizedBox(
                            height: heightMedia * 0.006,
                          ),
                          const BookingTextWidget(
                              text1: 'Wed, 8 Now', text2: " Fri, 10 Nov"),
                          SizedBox(
                            height: heightMedia * 0.006,
                          ),
                          const BookingTextWidget(
                              text1: 'Room 1', text2: 'Adult 2')
                        ],
                      ),
                    ),
                  ))),
              Expanded(
                  flex: 1,
                  child: Container(
                      //  color: Colors.blue,
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
                            Text(
                              'Day : 1',
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              )),
                            ),
                            SizedBox(
                              height: heightMedia * 0.005,
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                minimumSize:
                                    MaterialStateProperty.all(Size(10, 25)),
                                backgroundColor: MaterialStateProperty.all(
                                    CustomColors.mainColor),
                              ),
                              onPressed: () {},
                              child: Text(
                                'View',
                                style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 9,
                                )),
                              ),
                            ),
                            SizedBox(
                              height: heightMedia * 0.006,
                            ),
                            Text(
                              '₹1200',
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: CustomColors.greenColor,
                                fontSize: 12,
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ))),
            ],
          ),
        ),
      ],
    );
  }
}
