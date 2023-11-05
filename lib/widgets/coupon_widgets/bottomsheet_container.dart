import 'package:flutter/material.dart';
import 'package:hotel_booking_app/view_model/vendor_controller.dart';
import 'package:hotel_booking_app/widgets/loginsign_widgets/button_widget.dart';
import 'date_pick_textwidget.dart';
import 'textfeild_coupon_widget.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget(
      {super.key,
      required this.widthMedia,
      required this.heightMedia,
      required this.vendorController});
  final double widthMedia;
  final double heightMedia;
  final VendorController vendorController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(7)),
        //    height: heightMedia * 0.5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            SizedBox(
              height: heightMedia * 0.03,
            ),
            CouponTextFeildWidget(
              controller: vendorController.couponController,
              hintText: 'Enter the coupon code here',
              text: 'Coupon Code',
              validator: (value) => vendorController.textFieldValidation(value),
            ),
            SizedBox(
              height: heightMedia * 0.02,
            ),
            CouponTextFeildWidget(
              controller: vendorController.discountAmountController,
              hintText: 'Enter the coupon',
              text: ' Discount Amount',
              validator: (value) => vendorController.textFieldValidation(value),
            ),
            SizedBox(
              height: heightMedia * 0.02,
            ),
            Row(
              children: [
                Expanded(
                    child: DatePickingWidget(
                  vendorController: vendorController,
                  controller: vendorController.startDateController,
                  hintText: 'Select Date',
                  text: 'Starting Date',
                  validator: (value) =>
                      vendorController.textFieldValidation(value),
                  widthMedia: widthMedia,
                )),
                const SizedBox(width: 20),
                Expanded(
                  child: DatePickingWidget(
                    controller: vendorController.endDateController,
                    vendorController: vendorController,
                    hintText: 'Select Date',
                    text: 'Ending Date',
                    validator: (value) =>
                        vendorController.textFieldValidation(value),
                    widthMedia: widthMedia,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: heightMedia * 0.03,
            ),
            LoginSignButton(
              loadingCheck: vendorController.couponAddLoadingCheck,
              onpressFunction: () {
                vendorController.addCoupons();
              },
              text: 'Submit',
              colorCheck: true,
            ),
            SizedBox(
              height: heightMedia * 0.03,
            )
          ]),
        ),
      ),
    );
  }
}
