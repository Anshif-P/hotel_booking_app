import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/constance/colors.dart';
import 'package:hotel_booking_app/widgets/comman/heading_text.dart';
import 'package:hotel_booking_app/widgets/comman/location_text_widget.dart';
import 'package:hotel_booking_app/widgets/details_booking_widgets/checkin_date_day_widget.dart';
import 'package:hotel_booking_app/widgets/details_booking_widgets/details_text_widget.dart';
import '../widgets/bookings_widgets.dart/amount_text_widget.dart';
import '../widgets/bookings_widgets.dart/checkin_checkout_widget.dart';
import '../widgets/bookings_widgets.dart/customer_information.dart';
import '../widgets/bookings_widgets.dart/room_status_widget.dart';

class ScreenBookingDetails extends StatelessWidget {
  const ScreenBookingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    double heightMedia = MediaQuery.sizeOf(context).height;
    double widthMedia = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Column(children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: heightMedia * 0.04),
              Row(children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back)),
                SizedBox(width: widthMedia * 0.1),
                const HeadingTextWidget(text: 'Booking Details')
              ]),
              SizedBox(height: heightMedia * 0.03),
              Container(
                  height: heightMedia * 0.19,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage(
                            'lib/image/Rectangle 3822.png',
                          ),
                          fit: BoxFit.cover),
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(7))),
              SizedBox(height: heightMedia * 0.023),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('Classic Hotel',
                    style: GoogleFonts.inter(
                        fontSize: 19, fontWeight: FontWeight.w600)),
                Row(children: [
                  Icon(Icons.star_rate_rounded,
                      color: CustomColors.mainColor, size: 18),
                  const BookingDetailsTextWidget(
                    text: '(4.0)',
                  ),
                ])
              ]),
              SizedBox(height: heightMedia * 0.005),
              const LocationTextWidget(text1: 'Kerala', text2: 'India'),
              SizedBox(height: heightMedia * 0.015),
              const BookingDetailsTextWidget(text: 'Booking ID : 67399395'),
              SizedBox(height: heightMedia * 0.015),
              const Row(children: [
                BookingDetailsTextWidget(text: 'Room Rate :'),
                AmountText(
                  text: '1200',
                )
              ]),
              SizedBox(height: heightMedia * 0.015),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const BookingDetailsTextWidget(text: 'Status :'),
                RoomStatusWidget(
                    heightMedia: heightMedia,
                    widthMedia: widthMedia,
                    text: 'Active')
              ]),
              SizedBox(height: heightMedia * 0.02),
              CheckInCheckOutWidget(
                checkInData: 'Web, 8 Now 2023',
                checkOutData: 'Web, 8 Now 2023',
                heightMedia: heightMedia,
                widthMedia: widthMedia,
              ),
              SizedBox(height: heightMedia * 0.01),
              Divider(thickness: 0.5, color: CustomColors.lightGreyColor),
              SizedBox(height: heightMedia * 0.01),
              CheckinDayTotalRoomInfoWidget(
                heightMedia: heightMedia,
                widthMedia: widthMedia,
                adult: '3',
                days: '2',
                roomType: 'Classic',
                totalRoom: '3',
              ),
              const BookingDetailsTextWidget(
                text: 'Cusomer Information',
                sizeCheck: true,
              ),
              SizedBox(height: heightMedia * 0.015),
            ])),
        Expanded(
            child: CustomerInformationWidget(
          heightMedia: heightMedia,
          widthMedia: widthMedia,
          address: 'Anshif thayyil(H) malappuram areecode',
          mobNo: '+91 7356951345',
          name: 'Anshif',
        )),
      ]),
    );
  }
}
