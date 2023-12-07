import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/constance/colors.dart';
import 'package:hotel_booking_app/view/screen_app_info.dart';
import 'package:hotel_booking_app/view/screen_coupon.dart';
import 'package:hotel_booking_app/view/screen_privacy_policy.dart';
import 'package:hotel_booking_app/view/screen_terms_and_condition.dart';
import 'package:hotel_booking_app/view_model/vendor_controller.dart';
import 'package:shimmer/shimmer.dart';

import '../widgets/drawer_widgets/drawer_dialog.dart';

class ScreenDrawer extends StatelessWidget {
  ScreenDrawer({super.key});
  final VendorController vendorController = Get.find<VendorController>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: 170,
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: GetBuilder<VendorController>(
              builder: (controller) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 25),
                  vendorController.vendorDetails.image != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: CachedNetworkImage(
                            imageUrl: vendorController.vendorDetails.image!,
                            width: 60,
                            height: 55,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                width: 60,
                                height: 55,
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(7),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        vendorController.vendorDetails.image!,
                                      ),
                                    )),
                              ),
                            ),
                          ),
                        )
                      : Container(
                          width: 60,
                          height: 55,
                          decoration: BoxDecoration(
                            color: CustomColors.lightGreyColor,
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                  const SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        vendorController.vendorDetails.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 14),
                      ),
                      Text(
                        vendorController.vendorDetails.email,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xFFB5B5B5),
                        ),
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.info_outline),
          title: const Text('App info'),
          onTap: () {
            Get.to(() => const ScreenAppInfo());
          },
        ),
        ListTile(
          leading: const Icon(Icons.lock),
          title: const Text('Privacy & policy'),
          onTap: () {
            Get.to(() => const ScreenPrivacyPolicy());
          },
        ),
        ListTile(
          leading: const Icon(Icons.receipt_outlined),
          title: const Text('Terms & Condition'),
          onTap: () {
            Get.to(() => const ScreenTermsAndConditions());
          },
        ),
        ListTile(
          leading: const Icon(Icons.card_membership),
          title: const Text('Add Coupons'),
          onTap: () {
            Get.to(() => ScreenCoupon());
          },
        ),
        ListTile(
          leading: Icon(
            Icons.logout,
            color: CustomColors.mainColor,
          ),
          title: Text(
            'Sign Out',
            style: TextStyle(color: CustomColors.mainColor),
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return LogoutDialog();
              },
            );
          },
        ), // ... Other list tiles ...
      ],
    );
  }
}
