import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/constance/colors.dart';
import 'package:hotel_booking_app/widgets/comman/heading_text.dart';
import 'package:hotel_booking_app/widgets/comman/location_text_widget.dart';
import 'package:hotel_booking_app/widgets/details_booking_widgets/checkin_date_day_widget.dart';
import 'package:hotel_booking_app/widgets/details_booking_widgets/details_text_widget.dart';
import 'package:hotel_booking_app/widgets/details_booking_widgets/text_cusomerinfo.dart';

class ScreenBookingDetails extends StatelessWidget {
  const ScreenBookingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    double heightMedia = MediaQuery.sizeOf(context).height;
    double widthMedia = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: heightMedia * 0.04,
                ),
                Row(
                  children: [
                    Container(
                      //  color: Colors.red,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_back),
                      ),
                    ),
                    // Container(color: Colors.red, child: Icon(Icons.arrow_back)),
                    SizedBox(
                      width: widthMedia * 0.1,
                    ),
                    HeadingTextWidget(text: 'Booking Details'),
                  ],
                ),
                SizedBox(
                  height: heightMedia * 0.03,
                ),
                Container(
                  // width: widthMedia * 0.89,
                  height: heightMedia * 0.19,
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(7)),
                ),
                SizedBox(
                  height: heightMedia * 0.023,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Classic Hotel',
                      style: GoogleFonts.inter(
                          fontSize: 19, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star_rate_rounded,
                          color: CustomColors.mainColor,
                          size: 18,
                        ),
                        BookingDetailsTextWidget(
                          text: '(4.0)',
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: heightMedia * 0.005,
                ),
                LocationTextWidget(text1: 'Kerala', text2: 'India'),
                SizedBox(
                  height: heightMedia * 0.015,
                ),
                BookingDetailsTextWidget(text: 'Booking ID : 67399395'),
                SizedBox(
                  height: heightMedia * 0.015,
                ),
                Row(
                  children: [
                    BookingDetailsTextWidget(text: 'Room Rate :'),
                    Text(
                      ' ₹1200',
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: CustomColors.greenColor,
                        fontSize: 14,
                      )),
                    ),
                  ],
                ),
                SizedBox(
                  height: heightMedia * 0.015,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BookingDetailsTextWidget(text: 'Status :'),
                    Container(
                      alignment: Alignment.center,
                      width: widthMedia * 0.14,
                      height: heightMedia * 0.02,
                      decoration: BoxDecoration(
                          color: CustomColors.greenColor,
                          borderRadius: BorderRadius.circular(3)),
                      child: Text(
                        'Active',
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: heightMedia * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BookingDetailsTextWidget(
                          text: 'Check-in',
                          sizeCheck: true,
                        ),
                        SizedBox(
                          height: heightMedia * 0.015,
                        ),
                        Text(
                          'Wed, 8 Now 2023',
                          style: GoogleFonts.inter(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          )),
                        ),
                      ],
                    ),
                    //===========//
                    SizedBox(
                      //color: Colors.yellow,
                      width: 20,
                      height: heightMedia * 0.056,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 1,
                            height: heightMedia * 0.056,
                            color: const Color(0xFFD1D1D1),
                          ),
                          Positioned(
                            child: Container(
                              alignment: Alignment.center,
                              width: 15,
                              height: 7,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFF2F2F2),
                                  borderRadius: BorderRadius.circular(2)),
                              child: Text(
                                '2N',
                                style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 5,
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        BookingDetailsTextWidget(
                          text: 'Check-in',
                          sizeCheck: true,
                        ),
                        SizedBox(
                          height: heightMedia * 0.015,
                        ),
                        Text(
                          'Wed, 8 Now 2023',
                          style: GoogleFonts.inter(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          )),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: heightMedia * 0.01,
                ),
                Divider(
                  thickness: 0.5,
                  color: CustomColors.lightGreyColor,
                ),
                SizedBox(
                  height: heightMedia * 0.01,
                ),
                CheckinDayTotalRoomInfoWidget(
                  heightMedia: heightMedia,
                  widthMedia: widthMedia,
                  adult: '3',
                  days: '2',
                  roomType: 'Classic',
                  totalRoom: '3',
                ),
                BookingDetailsTextWidget(
                  text: 'Cusomer Information',
                  sizeCheck: true,
                ),
                SizedBox(
                  height: heightMedia * 0.015,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              //  height: heightMedia * 0.22,
              alignment: Alignment.topCenter,
              color: CustomColors.extraLightGrey,
              child: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7)),
                  height: heightMedia * 0.17,
                  width: widthMedia * 0.9,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: heightMedia * 0.02,
                        ),
                        CusomerInfoTextWidget(
                            text1: 'Name        :', text2: '  Anshif'),
                        SizedBox(
                          height: heightMedia * 0.015,
                        ),
                        CusomerInfoTextWidget(
                          text1: 'Mobile No :',
                          text2: '  +91 7356951342',
                          colorCheck: true,
                        ),
                        SizedBox(
                          height: heightMedia * 0.015,
                        ),
                        CusomerInfoTextWidget(
                            text1: 'Address     :',
                            text2: '  Anshif thayyil(H) malappuram areecode'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
