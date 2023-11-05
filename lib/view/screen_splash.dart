import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/model/sharepref_model.dart';
import 'package:hotel_booking_app/view/screen_login.dart';
import 'package:hotel_booking_app/view_model/vendor_controller.dart';
import 'screen_parent_bottom_navigation.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

Rx<bool> loadingCheck = false.obs;

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    final VendorController vendorController = Get.put(VendorController());

    loginCheck(vendorController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCB102F),
      body: Column(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'qb',
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 106,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'quick book',
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => SizedBox(
                    child: loadingCheck.value
                        ? const SizedBox()
                        : Transform.scale(
                            scale: .5,
                            child: const CircularProgressIndicator(
                              strokeWidth: 7,
                              color: Colors.white,
                            ),
                          )),
              ),
              Text(
                'Vendor',
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.w600,
                        color: Colors.white)),
              )
            ],
          )),
        ],
      ),
    );
  }

  loginCheck(VendorController venderController) async {
    final token = SharedPrefModel.instance.getData('token');
    final isLogged = await venderController.getVendorDetails();

    if (!isLogged) {
      Get.to(() => ScreenLogin());
    }

    if (token != null) {
      await venderController.getVndorRooms();
      await venderController.getVendorCoupons();
      Get.off(() => ScreenParentNavigation());

      loadingCheck.value = true;
    } else {
      Future.delayed(const Duration(seconds: 1));
      Get.off(() => ScreenLogin());
    }
  }
}
