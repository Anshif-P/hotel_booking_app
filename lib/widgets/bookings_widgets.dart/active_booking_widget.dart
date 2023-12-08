import 'package:flutter/widgets.dart';
import 'package:hotel_booking_app/constance/colors.dart';
import 'package:lottie/lottie.dart';

import '../../model/booking_model.dart';
import 'card_widget.dart';

// ignore: must_be_immutable
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
                          height: 15,
                        ),
                    itemBuilder: (context, index) {
                      final data = bookingHistoryList[index];
                      return BookingCardWidget(
                        activeDeactiveCheck: false,
                        data: data,
                        heightMedia: heightMedia,
                        widthMedia: widthMedia,
                      );
                    })
                : SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
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
                  ))
      ],
    );
  }
}
