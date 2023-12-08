import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/model/get_rooms_model.dart';
import 'package:hotel_booking_app/view_model/vendor_controller.dart';
import 'package:hotel_booking_app/widgets/comman/location_text_widget.dart';
import 'package:hotel_booking_app/widgets/hotel_details_widgets/hotel_details_text_widget.dart';
import 'package:shimmer/shimmer.dart';
import '../constance/colors.dart';
import '../widgets/hotel_details_widgets/amenties_widget.dart';
import '../widgets/hotel_details_widgets/details_images_widget.dart';
import '../widgets/hotel_details_widgets/room_info.dart';

class ScreenRoomDetails extends StatelessWidget {
  final VendorRoomModel data;
  final String propertyName;
  final VendorController vendorController = Get.find<VendorController>();
  ScreenRoomDetails(
      {super.key, required this.data, required this.propertyName});

  @override
  Widget build(BuildContext context) {
    vendorController.imageToShowDetailsScreen.value = data.imageList![0];

    double heightMedia = MediaQuery.sizeOf(context).height;
    double widthMedia = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: heightMedia * 0.37,
                  child: Obx(
                    () => CachedNetworkImage(
                      imageUrl: vendorController.imageToShowDetailsScreen.value,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            image: vendorController
                                        .imageToShowDetailsScreen.value !=
                                    ''
                                ? DecorationImage(
                                    image: NetworkImage(
                                      vendorController
                                          .imageToShowDetailsScreen.value,
                                    ),
                                    fit: BoxFit.cover)
                                : null,
                          ),
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(top: 15),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: heightMedia * 0.05,
                      ),
                      const HotelDetailsTextWidget(
                        text: 'Hotel Details',
                        sizeCheck: true,
                      ),
                      SizedBox(
                        height: heightMedia * 0.02,
                      ),
                      HotelDetailsTextWidget(
                        text: data.description!,
                        colorCheck: true,
                      ),
                      SizedBox(
                        height: heightMedia * 0.03,
                      ),
                      RoomDetailsImagesWidget(
                        heightMedia: heightMedia,
                        widthMedia: widthMedia,
                        images: data.imageList!,
                      ),
                      SizedBox(
                        height: heightMedia * 0.02,
                      ),
                      const HotelDetailsTextWidget(
                        text: 'Amenties',
                        sizeCheck: true,
                      ),
                      SizedBox(
                        height: heightMedia * 0.02,
                      ),
                      AmentiesWidget(itemsName: data.amenities!),
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
                          data: data,
                          heightMedia: heightMedia,
                          widthMedia: widthMedia),
                    ],
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
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
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
                                propertyName,
                                style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: heightMedia * 0.004,
                          ),
                          LocationTextWidget(
                              text1: data.location!, text2: data.city!),
                        ]),
                  ),
                ),
              ),
            ),
            Positioned(
              top: heightMedia * 0.03,
              left: widthMedia * 0.04,
              child: InkWell(
                onTap: () => Get.back(),
                child: Container(
                  width: 40,
                  height: 35,
                  decoration: BoxDecoration(
                      color: CustomColors.mainColor,
                      borderRadius: BorderRadius.circular(14)),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 26,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
