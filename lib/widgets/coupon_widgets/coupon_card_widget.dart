import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/constance/colors.dart';
import 'package:hotel_booking_app/model/coupon_model.dart';
import 'package:hotel_booking_app/view_model/vendor_controller.dart';

import '../coupon_widget/delete_dialog.dart';
import 'textwidget_coupon.dart';

class CouponCardWidget extends StatelessWidget {
  final String coupon;
  final String discount;
  final String startDate;
  final String endDate;
  final CouponModel data;
  final VendorController vendorController;
  const CouponCardWidget({
    super.key,
    required this.data,
    required this.vendorController,
    required this.coupon,
    required this.discount,
    required this.endDate,
    required this.startDate,
  });

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
                  child: SizedBox(
                    height: heightMedia * 0.13,

                    //color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: widthMedia * 0.24,
                          height: heightMedia * 0.09,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
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
                child: SizedBox(
                  height: heightMedia * 0.1,
                  //  color: Colors.yellow,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: heightMedia * 0.01,
                      ),
                      CouponTextWidget(text: 'Code : $coupon'),
                      SizedBox(
                        height: heightMedia * 0.006,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Row(
                            children: [
                              const CouponTextWidget(text: 'Discount :'),
                              Text(
                                ' ₹$discount',
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: CustomColors.greenColor,
                                  fontSize: 14,
                                )),
                              ),
                            ],
                          )),
                          Expanded(
                              child: Row(
                            children: [
                              SizedBox(
                                width: widthMedia * 0.2,
                              ),
                              InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return DeleteCouponDialog(
                                          controller: vendorController,
                                          data: data,
                                        );
                                      });
                                },
                                child: Icon(
                                  Icons.delete,
                                  size: 19,
                                  color: CustomColors.mainColor,
                                ),
                              ),
                            ],
                          )),
                        ],
                      ),
                      SizedBox(
                        height: heightMedia * 0.006,
                      ),
                      CouponTextWidget(text: '$startDate - $endDate')
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
