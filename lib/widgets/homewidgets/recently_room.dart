import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Container(
        // color: Colors.yellow,
        // height: heightMedia * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: heightMedia * 0.0127,
              // height: 10,
            ),
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
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: vendorController.vendorRooms.length,
                  itemBuilder: (context, index) {
                    final data = vendorController.vendorRooms[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(7),
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: data.imageList![index],
                                width: heightMedia * 0.217,
                                height: heightMedia * 0.139,
                                placeholder: (context, url) =>
                                    Shimmer.fromColors(
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.grey.shade100,
                                  child: Container(
                                    width: heightMedia * 0.217,
                                    height: heightMedia * 0.139,
                                    // width: 171,
                                    // height: 110,
                                    decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.circular(7),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            data.imageList![index],
                                          ),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: heightMedia * 0.0127,
                              // height: 10,
                            ),
                            Text(
                              'Galaxy ${data.propertyType}',
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
                                  '${data.state}${data.city}',
                                  style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                          color: Color(0xFFA19B9B),
                                          fontSize: 14,
                                          overflow: TextOverflow.ellipsis)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
