import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/view_model/vendor_controller.dart';
import 'package:hotel_booking_app/widgets/bookings_widgets.dart/booking_history_widget.dart';
import 'package:hotel_booking_app/widgets/bookings_widgets.dart/active_booking_widget.dart';
import 'package:hotel_booking_app/widgets/comman/heading_text.dart';

class ScreenBooking extends StatelessWidget {
  ScreenBooking({super.key});

  final VendorController vendorController = Get.find<VendorController>();
  @override
  Widget build(BuildContext context) {
    double heightMedia = MediaQuery.sizeOf(context).height;
    double widthMedia = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            SizedBox(height: heightMedia * 0.05),
            Row(
              children: [
                SizedBox(
                  width: widthMedia * 0.05,
                ),
                const HeadingTextWidget(text: 'Bookings'),
              ],
            ),
            SizedBox(height: heightMedia * 0.02),
            Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                  tabAlignment: TabAlignment.start,
                  labelStyle: GoogleFonts.inter(
                      textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  )),
                  indicatorColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.label,
                  padding: const EdgeInsets.only(left: 7),
                  isScrollable: true,
                  labelColor: Colors.black,
                  dividerColor: Colors.grey,
                  dividerHeight: 0.5,
                  tabs: const [
                    Tab(
                      text: 'Active',
                    ),
                    Tab(
                      text: 'History',
                    ),
                  ]),
            ),
            Expanded(
                child: TabBarView(children: [
              GetBuilder<VendorController>(
                builder: (controller) => ActiveBookingWidget(
                  bookingList: vendorController.bookingsList,
                  heightMedia: heightMedia,
                  widthMedia: widthMedia,
                ),
              ),
              GetBuilder<VendorController>(
                builder: (controller) => BookingHistoryWidget(
                  bookingList: vendorController.bookingsList,
                  heightMedia: heightMedia,
                  widthMedia: widthMedia,
                ),
              )
            ])),
          ],
        ),
      ),
    );
  }
}
