import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/view/screen_drawer.dart';
import 'package:hotel_booking_app/widgets/homewidgets/recently_room.dart';

import '../widgets/homewidgets/booking_recently.dart';
import '../widgets/homewidgets/customer_bookings.dart';
// import 'package:hotel_booking_app/view/screen_drawer.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    double heightMedia = MediaQuery.sizeOf(context).height;
    double widthMedia = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            Container(
              height: heightMedia * 0.67,
              color: const Color(0xFFF2F2F2),
            ),
            Transform.rotate(
              angle: 73 * (3.14159265359 / 180),
              child: Container(
                height: heightMedia * 0.6339,
                width: widthMedia * 0.5,
                color: const Color(0xFFCB102F),
                // color: Colors.blue,
              ),
            ),
            Container(
              height: heightMedia * 0.2,
              width: double.infinity,
              color: const Color(0xFFCB102F),
              // color: Colors.yellow
            ),
            Transform.rotate(
              angle: -0.295,
              child: Container(
                height: heightMedia * 0.4,
                width: double.infinity,
                color: const Color(0xFFCB102F),
                // color: Colors.green,
              ),
            ),
            Positioned(
              top: heightMedia * 0.028,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 9),
                    child: Row(
                      children: [
                        Builder(
                          builder: (BuildContext context) {
                            return IconButton(
                              onPressed: () {
                                Scaffold.of(context).openDrawer();
                              },
                              icon: const Icon(
                                Icons.menu,
                                color: Colors.white,
                                size: 35,
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          width: widthMedia * 0.04,
                        ),
                        Text(
                          'qb',
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 33,
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          width: widthMedia * 0.55,
                        ),
                        Container(
                          width: widthMedia * 0.09,
                          height: heightMedia * 0.04,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: heightMedia * 0.027,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 22),
                    child: Container(
                      height: 0.5,
                      width: widthMedia * 0.87,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: heightMedia * 0.033,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: widthMedia * 0.05,
                      ),
                      RevenueCustomerBookingsTextfielWidget(
                        contextHome: context,
                        icon: Icons.person,
                        text: 'Customers',
                        value: '2',
                      ),
                      SizedBox(
                        width: widthMedia * 0.07,
                      ),
                      RevenueCustomerBookingsTextfielWidget(
                        contextHome: context,
                        icon: Icons.date_range_outlined,
                        text: 'Bookings',
                        value: '45',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: heightMedia * 0.03,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: RevenueCustomerBookingsTextfielWidget(
                      contextHome: context,
                      icon: Icons.attach_money,
                      text: 'Revenue',
                      value: '4540',
                      sizeCheck: true,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 19, top: 15, bottom: 15),
                    child: Text(
                      'Recent Booking',
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      )),
                    ),
                  ),
                  RecentBookingWidget(
                    heightMedia: heightMedia,
                    widthMedia: widthMedia,
                    amount: '1200',
                    checkInDate: 'Wed, 8 Nov 2023',
                    checkOutDate: 'Wed, 8 Nov 2023',
                    customerName: 'Anshif',
                    id: '68737483',
                  ),
                  SizedBox(
                    height: heightMedia * 0.01,
                  ),
                  RecentBookingWidget(
                    heightMedia: heightMedia,
                    widthMedia: widthMedia,
                    amount: '1200',
                    checkInDate: 'Wed, 8 Nov 2023',
                    checkOutDate: 'Wed, 8 Nov 2023',
                    customerName: 'Anshif',
                    id: '68737483',
                  )
                ],
              ),
            ),
          ]),
          RecentAddedRoomWidget(
              heightMedia: heightMedia, widthMedia: widthMedia),
        ],
      ),
      drawer: const Drawer(child: ScreenDrawer()),
    );
  }
}
