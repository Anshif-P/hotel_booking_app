import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hotel_booking_app/constance/colors.dart';
import 'package:hotel_booking_app/model/booking_model.dart';
import 'package:hotel_booking_app/view/screen_detail_booking.dart';
import 'package:hotel_booking_app/widgets/bookings_widgets.dart/booking_text_widget.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class BookingCardWidget extends StatelessWidget {
  final double widthMedia;
  final double heightMedia;
  final BookingModel data;
  bool activeDeactiveCheck;
  BookingCardWidget(
      {super.key,
      this.activeDeactiveCheck = false,
      required this.heightMedia,
      required this.widthMedia,
      required this.data});

  @override
  Widget build(BuildContext context) {
    String checkIn = DateFormat('E, d MMM').format(data.checkIn);
    String checkOut = DateFormat('E, d MMM').format(data.checkOut);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: () => Get.to(ScreenBookingDetails(
          activeCheck: activeDeactiveCheck,
          data: data,
        )),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: CustomColors.lightGreyColor),
              borderRadius: BorderRadius.circular(8)),
          width: double.maxFinite,
          height: 130,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                    flex: 5,
                    child: Container(
                      decoration: const BoxDecoration(
                          // color: Colors.blue,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8))),
                      height: double.maxFinite,
                      padding:
                          const EdgeInsets.only(right: 10, top: 10, bottom: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          imageUrl: data.roomId.img[0],
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(data.roomId.img[0]),
                                      fit: BoxFit.cover),
                                  // color: Colors.blue[900],
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ),
                      ),
                    )),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 6,
                    child: Container(
                        alignment: Alignment.center,
                        //     color: Colors.green,
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: heightMedia * 0.019,
                                ),
                                Text(
                                  'Booking ID : ${data.id}',
                                  style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
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
                                      '${data.roomId.location} , India',
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
                                BookingTextWidget(
                                    colorCheck: true,
                                    text1: 'Name',
                                    text2: data.userId.name),
                                SizedBox(
                                  height: heightMedia * 0.006,
                                ),
                                BookingTextWidget(
                                    text1: checkIn, text2: checkOut),
                                SizedBox(
                                  height: heightMedia * 0.006,
                                ),
                                BookingTextWidget(
                                    text1: 'Room ${data.rooms.toString()}',
                                    text2: 'Adult ${data.adult.toString()}')
                              ],
                            ),
                          ),
                        ))),
                Expanded(
                    flex: 1,
                    child: Container(
                      decoration: const BoxDecoration(
                          // color: Colors.green,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8))),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
