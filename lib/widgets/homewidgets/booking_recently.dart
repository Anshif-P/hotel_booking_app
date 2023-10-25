import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/widgets/homewidgets/text_booking_widget.dart';

class RecentBookingWidget extends StatelessWidget {
  final String id;
  final String customerName;
  final String checkInDate;
  final String checkOutDate;
  final String amount;
  final double heightMedia;
  final double widthMedia;
  const RecentBookingWidget(
      {super.key,
      required this.heightMedia,
      required this.widthMedia,
      required this.amount,
      required this.checkInDate,
      required this.checkOutDate,
      required this.customerName,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, bottom: 10),
      child: Container(
        width: widthMedia * 0.919,
        height: heightMedia * 0.127,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                  // color: Colors.yellow,
                  borderRadius: BorderRadius.circular(7)),
              child: Padding(
                padding: const EdgeInsets.only(left: 12, top: 12),
                child: Row(
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextBookingWidget(
                            text: 'Booking ID : $id',
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          TextBookingWidget(
                            text: 'Customer : $customerName',
                            sizeColorCheck: true,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          TextBookingWidget(text: 'Check-in'),
                          const SizedBox(
                            height: 6,
                          ),
                          TextBookingWidget(
                              text: checkInDate, sizeColorCheck: true),
                        ]),
                    SizedBox(
                      width: widthMedia * 0.099,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 34),
                      child: SizedBox(
                        // color: Colors.yellow,
                        width: 20,
                        height: heightMedia * 0.2,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 1,
                              height: heightMedia * 0.04,
                              color: const Color(0xFFD1D1D1),
                            ),
                            Positioned(
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
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)),
              child: Padding(
                padding: const EdgeInsets.only(right: 12, top: 12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '₹$amount',
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
                      TextBookingWidget(text: 'Check-out'),
                      const SizedBox(
                        height: 6,
                      ),
                      TextBookingWidget(
                          text: checkInDate, sizeColorCheck: true),
                    ]),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
