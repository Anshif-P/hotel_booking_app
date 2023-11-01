import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/constance/colors.dart';

import 'textwidget_coupon.dart';

class CouponCardWidget extends StatelessWidget {
  const CouponCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double widthMedia = MediaQuery.sizeOf(context).width;
    double heightMedia = MediaQuery.sizeOf(context).height;

    return Column(children: [
      SizedBox(
        height: heightMedia * 0.02,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(7)),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    height: heightMedia * 0.13,

                    //color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: widthMedia * 0.24,
                          height: heightMedia * 0.09,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    'lib/image/coupon_img.png',
                                  ),
                                  fit: BoxFit.cover),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7)),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                flex: 2,
                child: Container(
                  height: heightMedia * 0.1,
                  //  color: Colors.yellow,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: heightMedia * 0.01,
                      ),
                      CouponTextWidget(text: 'Coupon Code : GRN6784F'),
                      SizedBox(
                        height: heightMedia * 0.006,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                            //       color: Colors.red,
                            child: Row(
                              children: [
                                CouponTextWidget(text: 'Discount :'),
                                Text(
                                  ' ₹400',
                                  style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: CustomColors.greenColor,
                                    fontSize: 14,
                                  )),
                                ),
                              ],
                            ),
                          )),
                          Expanded(
                              child: Container(
                            //      color: Colors.grey,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: widthMedia * 0.2,
                                ),
                                Icon(
                                  Icons.delete,
                                  size: 19,
                                  color: CustomColors.mainColor,
                                ),
                              ],
                            ),
                          )),
                        ],
                      ),
                      SizedBox(
                        height: heightMedia * 0.006,
                      ),
                      CouponTextWidget(text: 'Wed,8 Now - Fri,12 Nov')
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    ]);
  }
}
