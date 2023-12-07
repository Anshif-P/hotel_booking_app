import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/constance/colors.dart';
import 'package:hotel_booking_app/view_model/vendor_controller.dart';
import 'package:hotel_booking_app/widgets/homewidgets/text_booking_widget.dart';
import 'package:intl/intl.dart';

class RecentBookingWidget extends StatelessWidget {
  final double screenHeight;
  final double widthMedia;
  VendorController vendorController = Get.find<VendorController>();

  RecentBookingWidget(
      {super.key, required this.screenHeight, required this.widthMedia});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VendorController>(builder: (controller) {
      if (vendorController.bookingsList.isNotEmpty) {
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 2,
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
          itemBuilder: (context, index) {
            final data = vendorController
                .bookingsList[vendorController.bookingsList.length - index - 1];
            String checkIn = DateFormat('E, d MMM yyy').format(data.checkIn);
            String checkOut = DateFormat('E, d MMM yyy').format(data.checkOut);

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                constraints: const BoxConstraints(minHeight: 97),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    )),
                height: screenHeight * 0.127,
                width: widthMedia * 0.919,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(7),
                                  bottomLeft: Radius.circular(7))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15, top: 15, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextBookingWidget(
                                    text: 'Booking ID : ${data.id}'),
                                const SizedBox(height: 6),
                                TextBookingWidget(
                                  text: 'Customer : ${data.userId.name}',
                                  sizeColorCheck: true,
                                ),
                                const SizedBox(height: 6),
                                const TextBookingWidget(text: 'Check-in'),
                                const SizedBox(height: 6),
                                TextBookingWidget(
                                    text: checkIn, sizeColorCheck: true),
                              ],
                            ),
                          ),
                        )),
                    SizedBox(
                      width: 10,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Container(
                              color: CustomColors.lightGreyColor,
                              height: screenHeight * 0.127 / 2 - 20,
                              width: 1,
                            ),
                          ),
                          Positioned(
                            bottom: screenHeight * 0.127 / 2 - 25,
                            child: Container(
                              alignment: Alignment.center,
                              width: 10,
                              height: 7,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFF2F2F2),
                                  borderRadius: BorderRadius.circular(2)),
                              child: Text(
                                '2N',
                                style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 4,
                                )),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(7),
                                  bottomRight: Radius.circular(7))),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20, top: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '₹${data.roomPrice}',
                                  style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                    color: Color(0xFF1AB65C),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  )),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                const TextBookingWidget(text: 'Check-out'),
                                const SizedBox(
                                  height: 6,
                                ),
                                TextBookingWidget(
                                    text: checkOut, sizeColorCheck: true),
                              ],
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            );
          },
        );
      }
      return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Text(
              'No Booking Found',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      );
    });
  }
}
