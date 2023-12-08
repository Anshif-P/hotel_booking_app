import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/constance/colors.dart';
import 'package:hotel_booking_app/view/screen_details.dart';
import 'package:hotel_booking_app/view_model/vendor_controller.dart';
import 'package:shimmer/shimmer.dart';

class RecentAddedRoomWidget extends StatelessWidget {
  final double widthMedia;
  final double heightMedia;
  final VendorController vendorController;
  const RecentAddedRoomWidget({
    super.key,
    required this.vendorController,
    required this.heightMedia,
    required this.widthMedia,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15),
      color: Colors.white,
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: heightMedia * 0.0127),
          Text(
            'Recent added rooms',
            style: GoogleFonts.inter(
                textStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            )),
          ),
          SizedBox(
            height: heightMedia * 0.0127,
            // height: 10,
          ),
          SizedBox(
              height: heightMedia * 0.195,
              child: vendorController.vendorRooms.isNotEmpty
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: vendorController.vendorRooms.length,
                      itemBuilder: (context, index) {
                        final data = vendorController.vendorRooms[
                            vendorController.vendorRooms.length - index - 1];
                        return Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: SingleChildScrollView(
                            child: InkWell(
                              onTap: () => Get.to(() => ScreenRoomDetails(
                                  data: data,
                                  propertyName: vendorController
                                      .vendorDetails.propertyName)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(7),
                                    child: data.imageList != null
                                        ? CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            imageUrl: data.imageList![0],
                                            width: heightMedia * 0.217,
                                            height: heightMedia * 0.139,
                                            placeholder: (context, url) =>
                                                Shimmer.fromColors(
                                              baseColor: Colors.grey.shade300,
                                              highlightColor:
                                                  Colors.grey.shade100,
                                              child: Container(
                                                width: heightMedia * 0.217,
                                                height: heightMedia * 0.139,
                                                // width: 171,
                                                // height: 110,
                                                decoration: BoxDecoration(
                                                  color: Colors.yellow,
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                        data.imageList![0],
                                                      ),
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            width: heightMedia * 0.217,
                                            height: heightMedia * 0.139,
                                            // width: 171,
                                            // height: 110,
                                            decoration: BoxDecoration(
                                              color:
                                                  CustomColors.lightGreyColor,
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                    data.imageList![index],
                                                  ),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                  ),
                                  SizedBox(
                                    height: heightMedia * 0.0127,
                                    // height: 10,
                                  ),
                                  Text(
                                    '${vendorController.vendorDetails.propertyName} ${data.propertyType}',
                                    style: GoogleFonts.inter(
                                        textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    )),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        color: Color(0xFFCB102F),
                                        size: 17,
                                      ),
                                      Text(
                                        '${data.state} , ${data.city}',
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.inter(
                                            textStyle: const TextStyle(
                                                color: Color(0xFFA19B9B),
                                                fontSize: 14,
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      })
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'No Added Rooms',
                            style: GoogleFonts.inter(
                                color: CustomColors.mainColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    )),
        ],
      ),
    );
  }
}
