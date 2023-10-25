import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/constance/colors.dart';
import 'package:hotel_booking_app/widgets/comman/heading_text.dart';
import 'package:hotel_booking_app/widgets/coupon_widgets/bottomsheet_container.dart';

import '../widgets/coupon_widgets/coupon_card_widget.dart';
import '../widgets/coupon_widgets/textfeild_coupon_widget.dart';

class ScreenCoupon extends StatelessWidget {
  const ScreenCoupon({super.key});

  @override
  Widget build(BuildContext context) {
    double heightMdida = MediaQuery.sizeOf(context).height;
    double widthMdida = MediaQuery.sizeOf(context).width;

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.bottomSheet(BottomSheetWidget(
            heightMedia: heightMdida,
            widthMedia: widthMdida,
          ));
        },
        backgroundColor: CustomColors.mainColor,
        label: Row(
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
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_back,
                              size: 25,
                            )),
                        SizedBox(
                          width: widthMdida * 0.04,
                        ),
                        HeadingTextWidget(text: 'Coupons'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: heightMdida * 0.015,
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
                child: Column(children: [
              CouponCardWidget(),
            ]))
          ],
        ),
      ),
    );
  }
}
