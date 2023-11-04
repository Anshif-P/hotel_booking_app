import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/constance/colors.dart';
import 'package:hotel_booking_app/model/coupon_model.dart';
import 'package:hotel_booking_app/view_model/vendor_controller.dart';

class DeleteCouponDialog extends StatelessWidget {
  final VendorController controller;
  final CouponModel data;
  const DeleteCouponDialog(
      {super.key, required this.controller, required this.data});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Delete',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        'Do you want to Delete',
        style: TextStyle(color: Color(0xFF6D6D6D)),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text(
            'Cancel',
            style: TextStyle(
              color: Color.fromARGB(255, 138, 135, 135),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(
          onPressed: () async {
            controller.deleteCoupon(data);
            Get.back();
          },
          child: Text(
            'Delete',
            style: TextStyle(
              color: CustomColors.mainColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: Colors.white,
      elevation: 5,
    );
  }
}
