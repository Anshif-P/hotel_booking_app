import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/constance/colors.dart';

class RoomDetailsImagesWidget extends StatelessWidget {
  final image1;
  final image2;
  final image3;
  final image4;
  final double widthMedia;
  final double heightMedia;

  const RoomDetailsImagesWidget({
    super.key,
    required this.heightMedia,
    required this.widthMedia,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, crossAxisSpacing: 40),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            width: widthMedia * 0.04,
            height: heightMedia * 0.07,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.yellow,
            ),
          );
        });
  }
}
