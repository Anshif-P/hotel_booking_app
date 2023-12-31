import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/constance/colors.dart';
import 'package:hotel_booking_app/view/screen_app_info.dart';
import 'package:hotel_booking_app/view/screen_coupon.dart';
import 'package:hotel_booking_app/view/screen_privacy_policy.dart';

import '../drawer_widgets/drawer_dialog.dart';

// ignore: must_be_immutable
class ProfileListTileWidget extends StatelessWidget {
  ProfileListTileWidget({super.key});
  Rx<bool> isDarkThemeEnabled = false.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text('App Info'),
          leading: const Icon(Icons.info_outline, color: Colors.black),
          trailing: Icon(
            Icons.keyboard_arrow_right_outlined,
            color: CustomColors.lightGreyColor,
          ),
          onTap: () {
            Get.to(() => const ScreenAppInfo());
          },
        ),
        Divider(
          height: 1,
          color: CustomColors.lightGreyColor,
          thickness: 0.5,
        ),
        ListTile(
          leading: const Icon(Icons.lock_open_outlined, color: Colors.black),
          title: const Text('Privacy Policy'),
          trailing: Icon(
            Icons.keyboard_arrow_right_outlined,
            color: CustomColors.lightGreyColor,
          ),
          onTap: () {
            Get.to(() => const ScreenPrivacyPolicy());
          },
        ),
        Divider(
          height: 1,
          color: CustomColors.lightGreyColor,
          thickness: 0.5,
        ),
        ListTile(
          leading: const Icon(
            Icons.card_membership,
            color: Colors.black,
          ),
          title: const Text('Add Coupon'),
          trailing: Icon(
            Icons.keyboard_arrow_right_outlined,
            color: CustomColors.lightGreyColor,
          ),
          onTap: () {
            Get.to(() => ScreenCoupon());
          },
        ),
        // Divider(
        //   height: 1,
        //   color: CustomColors.lightGreyColor,
        //   thickness: 0.5,
        // ),
        // Obx(
        //   () => SwitchListTile(
        //       secondary: Icon(
        //         Icons.remove_red_eye_outlined,
        //         color: Colors.black,
        //       ),
        //       title: Text('Dark Theme'),
        //       value: isDarkThemeEnabled.value,
        //       onChanged: (value) {
        //         isDarkThemeEnabled.value = value;
        //       }),
        // ),
        Divider(
          height: 1,
          color: CustomColors.lightGreyColor,
          thickness: 0.5,
        ),
        ListTile(
          leading: Icon(
            Icons.logout_outlined,
            color: CustomColors.mainColor,
          ),
          title: Text(
            'Logout',
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
        ),
        Divider(
          height: 1,
          color: CustomColors.lightGreyColor,
          thickness: 0.5,
        ),
      ],
    );
  }
}
