import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/constance/colors.dart';
import 'package:hotel_booking_app/model/get_rooms_model.dart';
import 'package:hotel_booking_app/view_model/vendor_controller.dart';
import 'package:hotel_booking_app/widgets/hotel_details_widgets/hotel_details_text_widget.dart';

class RoomInfoWidget extends StatelessWidget {
  final double widthMedia;
  final double heightMedia;
  final VendorRoomModel data;
  const RoomInfoWidget(
      {super.key,
      required this.heightMedia,
      required this.widthMedia,
      required this.data});

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
                      HotelDetailsTextWidget(
                          text: 'Property type : ${data.propertyType}'),
                      SizedBox(
                        height: heightMedia * 0.01,
                      ),
                      HotelDetailsTextWidget(
                          text: 'Capacity : ${data.capacity}'),
                      SizedBox(
                        height: heightMedia * 0.01,
                      ),
                      Row(
                        children: [
                          HotelDetailsTextWidget(text: 'Adult rate :'),
                          Text(
                            ' ₹${data.adultRate}',
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
              height: heightMedia * 0.09,
              //  color: Colors.red,
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                HotelDetailsTextWidget(
                    text: 'Room Category : ${data.category}'),
                SizedBox(
                  height: heightMedia * 0.01,
                ),
                HotelDetailsTextWidget(text: 'Total room : ${data.totalRoom}'),
                SizedBox(
                  height: heightMedia * 0.01,
                ),
                HotelDetailsTextWidget(text: 'Extra : Parking')
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
        HotelDetailsTextWidget(text: 'State : ${data.state}'),
        SizedBox(
          height: heightMedia * 0.01,
        ),
        HotelDetailsTextWidget(text: 'City : ${data.city}'),
        SizedBox(
          height: heightMedia * 0.01,
        ),
        Row(
          children: [
            HotelDetailsTextWidget(text: 'Zip :'),
            Text(
              ' ${data.zip}',
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
              ' ₹${data.price}',
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
