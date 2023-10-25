import 'package:flutter/material.dart';
import 'package:hotel_booking_app/widgets/your_room_widgets/room_card_widget.dart';

import '../../constance/colors.dart';

class ScreenPendingApproval extends StatelessWidget {
  final double widthMedia;
  final double heightMedia;
  const ScreenPendingApproval(
      {super.key, required this.heightMedia, required this.widthMedia});

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
            RoomCardWidget(heightMedia: heightMedia, widthMedia: widthMedia)
          ],
        ),
      )
    ]);
  }
}
