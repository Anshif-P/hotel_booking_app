import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/widgets/comman/location_text_widget.dart';
import 'package:hotel_booking_app/widgets/hotel_details_widgets/hotel_details_text_widget.dart';

import '../constance/colors.dart';
import '../widgets/hotel_details_widgets/amenties_widget.dart';
import '../widgets/hotel_details_widgets/details_images_widget.dart';
import '../widgets/hotel_details_widgets/room_info.dart';

class ScreenRoomDetails extends StatelessWidget {
  const ScreenRoomDetails({super.key});

  @override
  Widget build(BuildContext context) {
    double heightMedia = MediaQuery.sizeOf(context).height;
    double widthMedia = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: heightMedia * 0.37,
                color: Colors.red,
              ),
              Container(
                //  height: heightMedia,
                //    color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: heightMedia * 0.05,
                      ),
                      HotelDetailsTextWidget(
                        text: 'Hotel Details',
                        sizeCheck: true,
                      ),
                      SizedBox(
                        height: heightMedia * 0.02,
                      ),
                      HotelDetailsTextWidget(
                        text:
                            'And this is all thanks to the sanitisation & safety measures followed at our properties, from disinfecting surfaces with high-quality cleaning products and maintaining social distance to using',
                        colorCheck: true,
                      ),
                      SizedBox(
                        height: heightMedia * 0.01,
                      ),
                      RoomDetailsImagesWidget(
                        heightMedia: heightMedia,
                        widthMedia: widthMedia,
                        image1: '',
                        image2: '',
                        image3: '',
                        image4: '',
                      ),
                      SizedBox(
                        height: heightMedia * 0.02,
                      ),
                      HotelDetailsTextWidget(
                        text: 'Amenties',
                        sizeCheck: true,
                      ),
                      SizedBox(
                        height: heightMedia * 0.02,
                      ),
                      AmentiesWidget(),
                      SizedBox(
                        height: heightMedia * 0.02,
                      ),
                      Text(
                        'Room Info',
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        )),
                      ),
                      SizedBox(
                        height: heightMedia * 0.02,
                      ),
                      RoomInfoWidget(
                          heightMedia: heightMedia, widthMedia: widthMedia),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
              top: heightMedia * 0.3,
              height: heightMedia * .1,
              left: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: heightMedia * 0.04,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Galaxy Hotel',
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                              )),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star_rate_rounded,
                                  color: CustomColors.mainColor,
                                  size: 20,
                                ),
                                Text(
                                  '(4.0)',
                                  style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  )),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: heightMedia * 0.004,
                        ),
                        LocationTextWidget(text1: 'Kerala', text2: 'India')
                      ]),
                ),
                //  height: heightMedia,
              )),
        ],
      )),
    );
  }
}
