import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/constance/colors.dart';
import 'package:hotel_booking_app/view/screen_drawer.dart';
import 'package:hotel_booking_app/view_model/vendor_controller.dart';
import 'package:hotel_booking_app/widgets/homewidgets/recently_room.dart';
import 'package:shimmer/shimmer.dart';
import '../widgets/homewidgets/booking_recently.dart';
import '../widgets/homewidgets/customer_bookings.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});
  final VendorController vendorController = Get.put(VendorController());

  @override
  Widget build(BuildContext context) {
    double heightMedia = MediaQuery.sizeOf(context).height;
    double widthMedia = MediaQuery.sizeOf(context).width;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(children: [
            Container(
              color: const Color(0xffF2F2F2),
              height: heightMedia * 0.67,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                    height: heightMedia * .48,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('lib/image/Frame 43.png'),
                            fit: BoxFit.cover))),
              ]),
            ),
            Positioned(
              top: heightMedia * 0.028,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 9),
                    child: Row(children: [
                      Builder(builder: (BuildContext context) {
                        return IconButton(
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            icon: const Icon(
                              Icons.sort,
                              color: Colors.white,
                              size: 40,
                            ));
                      }),
                      SizedBox(width: widthMedia * 0.04),
                      Text('qb',
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 33,
                                  fontWeight: FontWeight.bold))),
                      SizedBox(width: widthMedia * 0.55),
                      GetBuilder<VendorController>(builder: (controller) {
                        return vendorController.vendorDetails.image != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(7),
                                child: CachedNetworkImage(
                                    imageUrl:
                                        vendorController.vendorDetails.image!,
                                    width: widthMedia * 0.09,
                                    height: heightMedia * 0.04,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) =>
                                        Shimmer.fromColors(
                                            baseColor: Colors.grey.shade300,
                                            highlightColor:
                                                Colors.grey.shade100,
                                            child: Container(
                                                width: widthMedia * 0.09,
                                                height: heightMedia * 0.04,
                                                decoration: BoxDecoration(
                                                    color: CustomColors
                                                        .lightGreyColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7),
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                            vendorController
                                                                .vendorDetails
                                                                .image!)))))),
                              )
                            : Container(
                                width: widthMedia * 0.09,
                                height: heightMedia * 0.04,
                                decoration: BoxDecoration(
                                  color: CustomColors.lightGreyColor,
                                  borderRadius: BorderRadius.circular(7),
                                ));
                      })
                    ]),
                  ),
                  SizedBox(height: heightMedia * 0.027),
                  Padding(
                      padding: const EdgeInsets.only(left: 22),
                      child: Container(
                        height: 0.5,
                        width: widthMedia * 0.87,
                        color: Colors.white,
                      )),
                  SizedBox(height: heightMedia * 0.033),
                  GetBuilder<VendorController>(
                    builder: (controller) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: widthMedia * 0.05),
                          RevenueCustomerBookingsTextfielWidget(
                            contextHome: context,
                            icon: Icons.person,
                            text: 'Customers',
                            value: vendorController.dashBoard['customer']
                                .toString(),
                          ),
                          SizedBox(width: widthMedia * 0.07),
                          RevenueCustomerBookingsTextfielWidget(
                            contextHome: context,
                            icon: Icons.date_range_outlined,
                            text: 'Bookings',
                            value: vendorController.dashBoard['Bookings']
                                .toString(),
                          )
                        ]),
                  ),
                  SizedBox(height: heightMedia * 0.03),
                  GetBuilder<VendorController>(
                    builder: (controller) => Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: RevenueCustomerBookingsTextfielWidget(
                          contextHome: context,
                          icon: Icons.attach_money,
                          text: 'Revenue',
                          value:
                              vendorController.dashBoard['revenue'].toString(),
                          sizeCheck: true,
                        )),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                        left: 19,
                        top: 15,
                      ),
                      child: Text('Recent Booking',
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14)))),
                  Container(
                    constraints: const BoxConstraints(minHeight: 250),
                    height: heightMedia * 0.3,
                    width: widthMedia * 0.9999,
                    child: RecentBookingWidget(
                      screenHeight: heightMedia,
                      widthMedia: widthMedia,
                    ),
                  )
                ],
              ),
            )
          ]),
          GetBuilder<VendorController>(
              builder: (controller) => RecentAddedRoomWidget(
                  heightMedia: heightMedia,
                  widthMedia: widthMedia,
                  vendorController: vendorController))
        ])),
        drawer: Drawer(child: ScreenDrawer()));
  }
}
