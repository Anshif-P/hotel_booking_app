import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/constance/colors.dart';
import 'package:hotel_booking_app/view_model/vendor_controller.dart';
import 'package:hotel_booking_app/widgets/comman/heading_text.dart';
import 'package:hotel_booking_app/widgets/coupon_widgets/bottomsheet_container.dart';
import 'package:lottie/lottie.dart';

import '../widgets/coupon_widgets/coupon_card_widget.dart';

class ScreenCoupon extends StatelessWidget {
  ScreenCoupon({super.key});
  final VendorController vendorController = Get.find<VendorController>();

  @override
  Widget build(BuildContext context) {
    double heightMdida = MediaQuery.sizeOf(context).height;
    double widthMdida = MediaQuery.sizeOf(context).width;

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.bottomSheet(Form(
            key: vendorController.couponValidationFormKey,
            child: BottomSheetWidget(
              vendorController: vendorController,
              heightMedia: heightMdida,
              widthMedia: widthMdida,
            ),
          ));
        },
        backgroundColor: CustomColors.mainColor,
        label: const Row(
          children: [
            Text(
              'Add Coupon ',
              style: TextStyle(color: Colors.white),
            ),
            Icon(Icons.add)
          ],
        ),
      ),
      body: Container(
        color: CustomColors.extraLightGrey,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: heightMdida * 0.04,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              size: 25,
                            )),
                        SizedBox(
                          width: widthMdida * 0.04,
                        ),
                        const HeadingTextWidget(text: 'Coupons'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: heightMdida * 0.015,
                  ),
                ],
              ),
            ),
            GetBuilder<VendorController>(
              builder: (controller) => vendorController.couponsList.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: vendorController.couponsList.length,
                        itemBuilder: (contex, index) {
                          final data = vendorController.couponsList[index];

                          return CouponCardWidget(
                              data: data,
                              vendorController: vendorController,
                              coupon: data.code,
                              discount: data.discount,
                              endDate: data.endDate,
                              startDate: data.startDate);
                        },
                      ),
                    )
                  : Column(
                      children: [
                        SizedBox(
                          height: heightMdida * 0.2,
                        ),
                        SizedBox(
                            // color: Colors.red,
                            //   height: heightMedia * 0.3,
                            width: 200,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Lottie.asset('lib/image/lottie.json'),
                                  const Text('No Coupons Found')
                                ],
                              ),
                            )),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
