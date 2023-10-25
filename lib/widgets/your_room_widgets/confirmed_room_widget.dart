import 'package:flutter/material.dart';
import 'package:hotel_booking_app/constance/colors.dart';

import 'room_card_widget.dart';

class ScreenApprovedRoom extends StatelessWidget {
  final double widthMedia;
  final double heightMedia;
  const ScreenApprovedRoom(
      {super.key, required this.widthMedia, required this.heightMedia});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 1,
        color: CustomColors.lightGreyColor,
      ),
      Expanded(
        child: ListView(
          children: [
            SizedBox(
              height: heightMedia * 0.007,
            ),
            RoomCardWidget(
              heightMedia: heightMedia,
              widthMedia: widthMedia,
            ),
          ],
        ),
      )
    ]);
  }
}
