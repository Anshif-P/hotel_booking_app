import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hotel_booking_app/constance/colors.dart';
import 'package:hotel_booking_app/model/booking_model.dart';
import 'package:hotel_booking_app/widgets/bookings_widgets.dart/card_widget.dart';
import 'package:lottie/lottie.dart';

class BookingHistoryWidget extends StatelessWidget {
  final double heightMedia;
  final double widthMedia;
  final List<BookingModel> bookingList;

  const BookingHistoryWidget(
      {super.key,
      required this.heightMedia,
      required this.widthMedia,
      required this.bookingList});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Container(
        //   height: 1,
        //   color: CustomColors.lightGreyColor,
        // ),
        Expanded(
          child: bookingList.isNotEmpty
              ? ListView.separated(
                  itemCount: bookingList.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 15,
                  ),
                  itemBuilder: (context, index) {
                    final data = bookingList[index];

                    return BookingCardWidget(
                        activeDeactiveCheck: false,
                        data: data,
                        heightMedia: heightMedia,
                        widthMedia: widthMedia);
                  },
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        // color: Colors.red,
                        //   height: heightMedia * 0.3,
                        width: 200,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Lottie.asset('lib/image/lottie.json'),
                              const Text('No data found')
                            ],
                          ),
                        )),
                  ],
                ),
        )
      ],
    );
  }
}
