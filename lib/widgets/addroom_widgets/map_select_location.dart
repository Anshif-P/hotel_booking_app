import 'package:flutter/material.dart';
import 'package:hotel_booking_app/constance/colors.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 300,
      decoration: BoxDecoration(
          color: CustomColors.lightGreyColor,
          borderRadius: BorderRadius.circular(7)),
    );
  }
}
