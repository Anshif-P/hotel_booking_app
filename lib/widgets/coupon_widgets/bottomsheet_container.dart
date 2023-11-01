import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/widgets/loginsign_widgets/button_widget.dart';
import 'package:intl/intl.dart';

import 'date_pick_textwidget.dart';
import 'textfeild_coupon_widget.dart';

class BottomSheetWidget extends StatelessWidget {
  BottomSheetWidget(
      {super.key, required this.widthMedia, required this.heightMedia});
  final double widthMedia;
  final double heightMedia;
  final GlobalKey<FormState> validationKey = GlobalKey<FormState>();
  final TextEditingController couponController = TextEditingController();

  final TextEditingController discountAmountController =
      TextEditingController();

  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(7)),
        height: heightMedia * 0.44,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            SizedBox(
              height: heightMedia * 0.03,
            ),
            CouponTextFeildWidget(
              controller: couponController,
              hintText: 'Enter the coupon code here',
              text: 'Coupon Code',
              validator: (value) {},
            ),
            SizedBox(
              height: heightMedia * 0.02,
            ),
            CouponTextFeildWidget(
              controller: couponController,
              hintText: 'Enter the coupon',
              text: ' Discount Amount',
              validator: (value) {},
            ),
            SizedBox(
              height: heightMedia * 0.02,
            ),
            Row(
              children: [
                Expanded(
                    child: DatePickingWidget(
                  controller: startDateController,
                  hintText: 'Select Date',
                  text: 'Starting Date',
                  validator: (value) {},
                  widthMedia: widthMedia,
                )),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: DatePickingWidget(
                    controller: endDateController,
                    hintText: 'Select Date',
                    text: 'Ending Date',
                    validator: (value) {},
                    widthMedia: widthMedia,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: heightMedia * 0.03,
            ),
            LoginSignButton(
              loadingCheck: false.obs,
              onpressFunction: () {},
              text: 'Submit',
              colorCheck: true,
            )
          ]),
        ),
      ),
    );
  }
}
