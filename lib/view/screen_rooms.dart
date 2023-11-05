import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/view_model/vendor_controller.dart';
import 'package:hotel_booking_app/widgets/comman/heading_text.dart';
import 'package:hotel_booking_app/widgets/your_room_widgets/waittiing_approval_room.dart';
import '../widgets/your_room_widgets/confirmed_room_widget.dart';

class ScreenRooms extends StatelessWidget {
  final VendorController vendorController = Get.put(VendorController());

  ScreenRooms({super.key});
  @override
  Widget build(BuildContext context) {
    double heightMedia = MediaQuery.sizeOf(context).height;
    double widthMedia = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: heightMedia * 0.06,
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 15,
              ),
              child: Row(
                children: [
                  HeadingTextWidget(text: 'Your Room'),
                ],
              ),
            ),
            SizedBox(
              height: heightMedia * 0.01,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelStyle: GoogleFonts.inter(
                    textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                )),
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                isScrollable: true,
                dividerColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: const [
                  Tab(
                    text: 'Confirmed',
                  ),
                  Tab(text: 'Waitting approval'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  GetBuilder<VendorController>(
                    builder: (cotroller) => ScreenApprovedRoom(
                      vendorController: vendorController,
                      heightMedia: heightMedia,
                      widthMedia: widthMedia,
                    ),
                  ),
                  GetBuilder<VendorController>(
                    builder: (controller) => ScreenPendingApproval(
                      vendorController: vendorController,
                      heightMedia: heightMedia,
                      widthMedia: widthMedia,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
