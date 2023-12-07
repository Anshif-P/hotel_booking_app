import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/constance/colors.dart';
import 'package:hotel_booking_app/model/get_rooms_model.dart';
import 'package:hotel_booking_app/view/screen_add_room.dart';
import 'package:hotel_booking_app/view/screen_details.dart';
import 'package:hotel_booking_app/view_model/vendor_controller.dart';
import 'package:hotel_booking_app/widgets/your_room_widgets/delete_diolog.dart';
import 'package:shimmer/shimmer.dart';
import 'card_text_widget.dart';

class RoomCardWidget extends StatelessWidget {
  final VendorController controller;
  final String propertyName;
  final String location;
  final String propertyType;
  final String category;
  final String price;
  final VendorRoomModel data;
  final double widthMedia;
  final double heightMedia;
  final String image;
  final Rx<bool> imageLoadingCheck = false.obs;
  RoomCardWidget(
      {super.key,
      required this.controller,
      required this.data,
      required this.heightMedia,
      required this.widthMedia,
      required this.location,
      required this.category,
      required this.price,
      required this.propertyName,
      required this.image,
      required this.propertyType});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ScreenRoomDetails(data: data, propertyName: propertyName));
      },
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            width: widthMedia * 0.9,
            height: heightMedia * 0.15,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                border: Border.all(color: CustomColors.lightGreyColor)),
            child: Row(children: [
              Expanded(
                  flex: 3,
                  child: Row(children: [
                    SizedBox(width: widthMedia * 0.03),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child: CachedNetworkImage(
                            width: widthMedia * 0.24,
                            height: heightMedia * 0.12,
                            imageUrl: data.imageList![0],
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.grey.shade100,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.blue[900],
                                      image: data.imageList?[0] != null
                                          ? DecorationImage(
                                              image: NetworkImage(image),
                                              fit: BoxFit.cover)
                                          : null,
                                      borderRadius: BorderRadius.circular(7)),
                                  width: widthMedia * 0.24,
                                  height: heightMedia * 0.12,
                                ))))
                  ])),
              Expanded(
                  flex: 4,
                  child: SizedBox(
                      width: widthMedia * 0.12,
                      height: heightMedia * 0.12,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: heightMedia * 0.006),
                                Text(
                                  propertyName,
                                  style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600)),
                                ),
                                SizedBox(height: heightMedia * 0.006),
                                Row(children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: Color(0xFFCB102F),
                                    size: 16,
                                  ),
                                  Text(location,
                                      style: GoogleFonts.inter(
                                          textStyle: const TextStyle(
                                        color: Color(0xFFA19B9B),
                                        fontSize: 12,
                                      )))
                                ]),
                                SizedBox(height: heightMedia * 0.006),
                                CardText(
                                    text1: 'Property type',
                                    text2: propertyType),
                                SizedBox(height: heightMedia * 0.006),
                                CardText(text1: 'Category', text2: category),
                                SizedBox(height: heightMedia * 0.006),
                                Row(children: [
                                  Text('Price : ',
                                      style: GoogleFonts.inter(
                                          textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                      ))),
                                  Text('₹$price',
                                      style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                        color: CustomColors.greenColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      )))
                                ])
                              ])))),
              SizedBox(
                  width: widthMedia * 0.2,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(height: heightMedia * 0.016),
                                InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return DeleteDialog(
                                              controller: controller,
                                              id: data.id!,
                                            );
                                          });
                                    },
                                    child: Icon(
                                      Icons.delete,
                                      color: CustomColors.mainColor,
                                      size: 20,
                                    )),
                                SizedBox(height: heightMedia * 0.016),
                                // InkWell(
                                //     onTap: () {
                                //       Get.to(() => ScreenRoomDetails(
                                //           data: data,
                                //           propertyName: propertyName));
                                //     },
                                //     child: Text('View',
                                //         style: GoogleFonts.inter(
                                //             textStyle: const TextStyle(
                                //           color: Colors.blue,
                                //           fontWeight: FontWeight.w600,
                                //           fontSize: 9,
                                //         )))),
                                SizedBox(height: heightMedia * 0.014),
                                ElevatedButton(
                                    style: ButtonStyle(
                                        alignment: (Alignment.center),
                                        elevation: MaterialStateProperty.all(0),
                                        minimumSize: MaterialStateProperty.all(
                                            const Size(60, 25)),
                                        padding: MaterialStateProperty.all(
                                            const EdgeInsets.all(0)),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                CustomColors.greenColor)),
                                    onPressed: () {
                                      Get.to(() => ScreenAddRoom(
                                            editCheck: true,
                                            data: data,
                                          ));
                                    },
                                    child: Text('Edit',
                                        style: GoogleFonts.inter(
                                            textStyle: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 9,
                                        ))))
                              ]))))
            ]))
      ]),
    );
  }
}
