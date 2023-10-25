import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hotel_booking_app/constance/colors.dart';
import 'package:hotel_booking_app/widgets/bookings_widgets.dart/card_widget.dart';

class CancelledWidget extends StatelessWidget {
  final double heightMedia;
  final double widthMedia;
  const CancelledWidget(
      {super.key, required this.heightMedia, required this.widthMedia});

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
                  heightMedia: heightMedia, widthMedia: widthMedia),
            ],
          ),
        ),
      ],
    );
  }
}
