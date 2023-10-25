import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/widgets/bookings_widgets.dart/cancelled_widget.dart';
import 'package:hotel_booking_app/widgets/bookings_widgets.dart/history_widget.dart';

import 'package:hotel_booking_app/widgets/comman/heading_text.dart';

class ScreenBooking extends StatelessWidget {
  const ScreenBooking({super.key});

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
                HeadingTextWidget(text: 'Bookings'),
              ],
            ),
            SizedBox(height: heightMedia * 0.02),
            Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
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
                  tabs: const [
                    Tab(
                      text: 'History',
                    ),
                    Tab(
                      text: 'Cancelled',
                    ),
                  ]),
            ),
            Expanded(
                child: TabBarView(children: [
              HistoryWidget(
                heightMedia: heightMedia,
                widthMedia: widthMedia,
              ),
              CancelledWidget(
                heightMedia: heightMedia,
                widthMedia: widthMedia,
              )
            ])),
          ],
        ),
      ),
    );
  }
}
