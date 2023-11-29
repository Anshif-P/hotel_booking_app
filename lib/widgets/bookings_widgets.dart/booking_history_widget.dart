import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hotel_booking_app/constance/colors.dart';
import 'package:hotel_booking_app/model/booking_model.dart';
import 'package:hotel_booking_app/widgets/bookings_widgets.dart/card_widget.dart';

class BookingHistoryWidget extends StatelessWidget {
  final double heightMedia;
  final double widthMedia;
  final List<BookingModel> bookingList;

  BookingHistoryWidget(
      {super.key,
      required this.heightMedia,
      required this.widthMedia,
      required this.bookingList});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 1,
          color: CustomColors.lightGreyColor,
        ),
        Expanded(
            child: bookingList.isNotEmpty
                ? ListView.separated(
                    itemCount: bookingList.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemBuilder: (context, index) {
                      final data = bookingList[index];

                      return BookingCardWidget(
                          data: data,
                          heightMedia: heightMedia,
                          widthMedia: widthMedia);
                    },
                  )
                : const Center(
                    child: Text('No Bookings'),
                  )),
      ],
    );
  }
}
