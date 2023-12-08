import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/constance/colors.dart';
import 'package:hotel_booking_app/model/booking_model.dart';
import 'package:hotel_booking_app/widgets/comman/heading_text.dart';
import 'package:hotel_booking_app/widgets/comman/location_text_widget.dart';
import 'package:hotel_booking_app/widgets/details_booking_widgets/checkin_date_day_widget.dart';
import 'package:hotel_booking_app/widgets/details_booking_widgets/details_text_widget.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import '../widgets/bookings_widgets.dart/amount_text_widget.dart';
import '../widgets/bookings_widgets.dart/checkin_checkout_widget.dart';
import '../widgets/bookings_widgets.dart/customer_information.dart';
import '../widgets/bookings_widgets.dart/room_status_widget.dart';

// ignore: must_be_immutable
class ScreenBookingDetails extends StatelessWidget {
  ScreenBookingDetails(
      {super.key, required this.data, this.activeCheck = false});
  final BookingModel data;
  bool activeCheck;

  @override
  Widget build(BuildContext context) {
    double heightMedia = MediaQuery.sizeOf(context).height;
    double widthMedia = MediaQuery.sizeOf(context).width;
    String checkIn = DateFormat('E, d MMM').format(data.checkIn);
    String checkOut = DateFormat('E, d MMM').format(data.checkOut);

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
              ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: CachedNetworkImage(
                  width: double.maxFinite,
                  height: heightMedia * 0.19,
                  fit: BoxFit.cover,
                  imageUrl: data.roomId.img[0],
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                        height: heightMedia * 0.19,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(data.roomId.img[0]),
                                fit: BoxFit.cover),
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(7))),
                  ),
                ),
              ),
              SizedBox(height: heightMedia * 0.023),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('${data.roomId.propertyType} ',
                    style: GoogleFonts.inter(
                        fontSize: 19, fontWeight: FontWeight.w600)),
                // Row(children: [
                //   Icon(Icons.star_rate_rounded,
                //       color: CustomColors.mainColor, size: 18),
                //   const BookingDetailsTextWidget(
                //     text: '(${data.roomId.})',
                //   ),
                // ])
              ]),
              SizedBox(height: heightMedia * 0.005),
              LocationTextWidget(text1: '${data.place}', text2: 'India'),
              SizedBox(height: heightMedia * 0.015),
              BookingDetailsTextWidget(text: 'Booking ID : ${data.id}'),
              SizedBox(height: heightMedia * 0.015),
              Row(children: [
                const BookingDetailsTextWidget(text: 'Room Rate :'),
                AmountText(
                  text: data.roomPrice.toString(),
                )
              ]),
              SizedBox(height: heightMedia * 0.015),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const BookingDetailsTextWidget(text: 'Status :'),
                RoomStatusWidget(
                    heightMedia: heightMedia,
                    widthMedia: widthMedia,
                    text: activeCheck ? 'Active' : 'Deactive')
              ]),
              SizedBox(height: heightMedia * 0.02),
              CheckInCheckOutWidget(
                checkInData: checkIn,
                checkOutData: checkOut,
                heightMedia: heightMedia,
                widthMedia: widthMedia,
              ),
              SizedBox(height: heightMedia * 0.01),
              Divider(thickness: 0.5, color: CustomColors.lightGreyColor),
              SizedBox(height: heightMedia * 0.01),
              CheckinDayTotalRoomInfoWidget(
                heightMedia: heightMedia,
                widthMedia: widthMedia,
                adult: data.adult.toString(),
                days: data.days.toString(),
                roomType: 'Classic',
                totalRoom: data.rooms.toString(),
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
            address: data.address,
            mobNo: data.phone.toString(),
            name: data.userId.name,
          ),
        ),
      ]),
    );
  }
}
