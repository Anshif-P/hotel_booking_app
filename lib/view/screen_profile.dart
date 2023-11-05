import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/constance/colors.dart';
import 'package:hotel_booking_app/view/screen_edit_profile.dart';
import 'package:hotel_booking_app/view_model/vendor_controller.dart';
import 'package:hotel_booking_app/widgets/comman/button_text.dart';
import 'package:shimmer/shimmer.dart';
import '../widgets/profile_widgets/listtile_widget.dart';

class ScreenProfile extends StatelessWidget {
  ScreenProfile({super.key});
  final VendorController vendorController = Get.find<VendorController>();

  @override
  Widget build(BuildContext context) {
    double heightMidia = MediaQuery.sizeOf(context).height;
    double widhtMidia = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: heightMidia * 0.28,
            width: double.infinity,
            color: Colors.white,
            child: Stack(
              children: [
                Positioned(
                  bottom: heightMidia * 0.1,
                  right: 0,
                  left: 0,
                  child: Container(
                    //  color: Colors.red,
                    height: heightMidia * 0.12,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'lib/image/profile_background_img.png'),
                            fit: BoxFit.fill)),
                  ),
                ),
                Positioned(
                  bottom: heightMidia * 0.04,
                  left: widhtMidia * 0.07,
                  // width: 100,
                  child: GetBuilder<VendorController>(
                    builder: (controller) => ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: vendorController.vendorDetails.image != null
                          ? CachedNetworkImage(
                              fit: BoxFit.cover,
                              width: widhtMidia * 0.25,
                              height: heightMidia * 0.115,
                              imageUrl: vendorController.vendorDetails.image!,
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.grey.shade100,
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(vendorController
                                              .vendorDetails.image!)),
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.circular(7)),
                                  width: widhtMidia * 0.25,
                                  height: heightMidia * 0.115,
                                ),
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(7)),
                              width: widhtMidia * 0.25,
                              height: heightMidia * 0.115,
                            ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: heightMidia * 0.04,
                    left: widhtMidia * 0.37,
                    child: SizedBox(
                      width: widhtMidia * 0.4,
                      height: heightMidia * 0.038,
                      child: ElevatedButton(
                          onPressed: () async {
                            await vendorController.getProfileDetailsForEdit();
                            Get.to(() => ScreenEdit(
                                  data: vendorController.vendorDetails,
                                ));
                          },
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor: MaterialStateProperty.all(
                                  CustomColors.mainColor)),
                          child: const ButtonTextCommanWidget(
                              text: 'Edit Profile')),
                    )),
                Positioned(
                    bottom: heightMidia * 0.0,
                    right: 0,
                    left: 0,
                    child: Container(
                      height: heightMidia * 0.02,
                      color: CustomColors.extraLightGrey,
                    )),
              ],
            ),
          ),
          ProfileListTileWidget(),
        ],
      ),
    );
  }
}
