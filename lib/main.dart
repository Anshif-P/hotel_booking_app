import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/model/sharepref_model.dart';
import 'package:hotel_booking_app/view/screen_coupon.dart';
import 'package:hotel_booking_app/view/screen_details.dart';
import 'package:hotel_booking_app/view/screen_login.dart';

import 'package:hotel_booking_app/view/screen_splash.dart';

import 'view/screen_detail_booking.dart';
import 'view/screen_profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefModel.instance.initSharedPref();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenCoupon(),
    );
  }
}
