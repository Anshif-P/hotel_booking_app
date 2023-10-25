import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/constance/colors.dart';
import 'package:hotel_booking_app/widgets/hotel_details_widgets/hotel_details_text_widget.dart';

class RoomInfoWidget extends StatelessWidget {
  final double widthMedia;
  final double heightMedia;
  const RoomInfoWidget(
      {super.key, required this.heightMedia, required this.widthMedia});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: heightMedia * 0.09,
                //  color: Colors.yellow,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HotelDetailsTextWidget(text: 'Property type :Hotel'),
                      SizedBox(
                        height: heightMedia * 0.01,
                      ),
                      HotelDetailsTextWidget(text: 'Capacity : 3'),
                      SizedBox(
                        height: heightMedia * 0.01,
                      ),
                      Row(
                        children: [
                          HotelDetailsTextWidget(text: 'Adult rate :'),
                          Text(
                            ' ₹400',
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                              color: CustomColors.greenColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            )),
                          ),
                        ],
                      )
                    ]),
              ),
            ),
            Container(
              width: 1,
              height: heightMedia * 0.09,
              color: CustomColors.lightGreyColor,
            ),
            Expanded(
                child: Container(
              height: heightMedia * 0.1,
              //  color: Colors.red,
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                HotelDetailsTextWidget(text: 'Property type :Hotel'),
                SizedBox(
                  height: heightMedia * 0.01,
                ),
                HotelDetailsTextWidget(text: 'Capacity : 3'),
                SizedBox(
                  height: heightMedia * 0.01,
                ),
                HotelDetailsTextWidget(text: 'Adult rate :400')
              ]),
            ))
          ],
        ),
        SizedBox(
          height: heightMedia * 0.01,
        ),
        Divider(
          color: CustomColors.lightGreyColor,
          thickness: 0.5,
        ),
        SizedBox(
          height: heightMedia * 0.01,
        ),
        HotelDetailsTextWidget(text: 'State : Tamil Nadu'),
        SizedBox(
          height: heightMedia * 0.01,
        ),
        HotelDetailsTextWidget(text: 'City : India, Kerala,Kozhikode'),
        SizedBox(
          height: heightMedia * 0.01,
        ),
        Row(
          children: [
            HotelDetailsTextWidget(text: 'Zip :'),
            Text(
              ' 647393',
              style: GoogleFonts.inter(
                  textStyle: TextStyle(
                color: CustomColors.blueColor,
                fontSize: 14,
              )),
            ),
          ],
        ),
        SizedBox(
          height: heightMedia * 0.01,
        ),
        Row(
          children: [
            HotelDetailsTextWidget(text: 'Price :'),
            Text(
              ' ₹1200',
              style: GoogleFonts.inter(
                  textStyle: TextStyle(
                color: CustomColors.greenColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              )),
            ),
          ],
        ),
        SizedBox(
          height: heightMedia * 0.04,
        ),
      ],
    );
  }
}
