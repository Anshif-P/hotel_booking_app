// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hotel_booking_app/constance/colors.dart';
// import 'package:hotel_booking_app/view_model/vendor_controller.dart';
// import 'package:shimmer/shimmer.dart';

// class RoomDetailsImagesWidget extends StatelessWidget {
//   final VendorController vendorController = Get.find<VendorController>();
//   final List images;
//   final double widthMedia;
//   final double heightMedia;
//   final bool editCheck;
//   RoomDetailsImagesWidget({
//     super.key,
//     this.editCheck = false,
//     required this.heightMedia,
//     required this.widthMedia,
//     required this.images,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//         padding: const EdgeInsets.all(0),
//         physics: const NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 4, crossAxisSpacing: 40),
//         itemCount: 4,
//         itemBuilder: (context, index) {
//           return InkWell(
//             onTap: () {
//               vendorController.imageToShowDetailsScreen.value = images[index];
//             },
//             child: Shimmer.fromColors(
//               period: const Duration(milliseconds: 4),
//               baseColor: Colors.grey[300]!,
//               highlightColor: Colors.grey[100]!,
//               child: Container(
//                 width: widthMedia * 0.04,
//                 height: heightMedia * 0.07,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: NetworkImage(images[index]), fit: BoxFit.cover),
//                   borderRadius: BorderRadius.circular(14),
//                   color: Colors.yellow,
//                 ),
//               ),
//             ),
//           );
//         });
//   }
// }
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../view_model/vendor_controller.dart';

class RoomDetailsImagesWidget extends StatelessWidget {
  final VendorController vendorController = Get.find<VendorController>();

  final List images;
  final double widthMedia;
  final double heightMedia;
  final bool editCheck;

  RoomDetailsImagesWidget({
    super.key,
    this.editCheck = false,
    required this.heightMedia,
    required this.widthMedia,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(0),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 40,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            //          Get.to(() => DetailsScreen(imageUrl: images[index]));
            vendorController.imageToShowDetailsScreen.value = images[index];
          },
          child: Obx(() {
            Rx<bool> isLoading = images[index] == null ? true.obs : false.obs;
            if (isLoading.value) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: widthMedia * 0.04,
                  height: heightMedia * 0.07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.yellow,
                  ),
                ),
              );
            } else {
              return ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: CachedNetworkImage(
                  imageUrl: images[index],
                  fit: BoxFit.cover,
                  width: widthMedia * 0.04,
                  height: heightMedia * 0.07,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: widthMedia * 0.04,
                      height: heightMedia * 0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                ),
              );
            }
          }),
        );
      },
    );
  }
}
