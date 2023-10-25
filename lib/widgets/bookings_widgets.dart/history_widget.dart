import 'package:flutter/widgets.dart';
import 'package:hotel_booking_app/constance/colors.dart';

import 'card_widget.dart';

class HistoryWidget extends StatelessWidget {
  final double widthMedia;
  final double heightMedia;
  const HistoryWidget(
      {super.key, required this.widthMedia, required this.heightMedia});

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
            child: ListView(
          children: [
            BookingCardWidget(
              heightMedia: heightMedia,
              widthMedia: widthMedia,
            )
          ],
        ))
      ],
    );
  }
}
