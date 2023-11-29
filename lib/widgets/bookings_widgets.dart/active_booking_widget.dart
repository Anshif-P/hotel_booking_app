import 'package:flutter/widgets.dart';
import 'package:hotel_booking_app/constance/colors.dart';

import '../../model/booking_model.dart';
import 'card_widget.dart';

class ActiveBookingWidget extends StatelessWidget {
  final double widthMedia;
  final double heightMedia;
  final List<BookingModel> bookingList;
  List<BookingModel> bookingHistoryList = [];

  ActiveBookingWidget(
      {super.key,
      required this.widthMedia,
      required this.heightMedia,
      required this.bookingList});

  @override
  Widget build(BuildContext context) {
    final DateTime datetime = DateTime.now();
    bookingHistoryList = bookingList
        .where(
          (element) => element.checkOut.isAfter(datetime),
        )
        .toList();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 1,
          color: CustomColors.lightGreyColor,
        ),
        Expanded(
            child: bookingHistoryList.isNotEmpty
                ? ListView.separated(
                    itemCount: bookingHistoryList.length,
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                    itemBuilder: (context, index) {
                      final data = bookingHistoryList[index];
                      return BookingCardWidget(
                        data: data,
                        heightMedia: heightMedia,
                        widthMedia: widthMedia,
                      );
                    })
                : const SizedBox(
                    child: Center(child: Text('No Bookings Found')),
                  ))
      ],
    );
  }
}
