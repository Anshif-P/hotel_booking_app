import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/model/get_rooms_model.dart';
import 'package:hotel_booking_app/view_model/vendor_controller.dart';
import 'package:hotel_booking_app/widgets/your_room_widgets/room_card_widget.dart';
import 'package:lottie/lottie.dart';

import '../../constance/colors.dart';

class ScreenPendingApproval extends StatelessWidget {
  final double widthMedia;
  final double heightMedia;
  final VendorController vendorController;
  const ScreenPendingApproval(
      {super.key,
      required this.heightMedia,
      required this.widthMedia,
      required this.vendorController});

  @override
  Widget build(BuildContext context) {
    final List<VendorRoomModel> waittingForApprovelRoomList = vendorController
        .vendorRooms
        .where((element) => element.isApproved == false)
        .toList();
    return Column(children: [
      // Container(
      //   height: 1,
      //   color: CustomColors.lightGreyColor,
      // ),
      waittingForApprovelRoomList.isNotEmpty
          ? Expanded(
              child: GetBuilder<VendorController>(
                builder: (controller) => ListView.builder(
                  padding: EdgeInsets.only(top: heightMedia * 0.01),
                  itemCount: waittingForApprovelRoomList.length,
                  itemBuilder: (context, index) {
                    final data = waittingForApprovelRoomList[index];

                    return Column(
                      children: [
                        SizedBox(
                          height: heightMedia * 0.025,
                        ),
                        RoomCardWidget(
                            image: data.imageList![0],
                            controller: vendorController,
                            data: data,
                            heightMedia: heightMedia,
                            widthMedia: widthMedia,
                            location: data.location!,
                            category: data.category!,
                            price: data.price!,
                            propertyName:
                                vendorController.vendorDetails.propertyName,
                            propertyType: data.propertyType!)
                      ],
                    );
                  },
                ),
              ),
            )
          : Column(
              children: [
                SizedBox(
                  height: heightMedia * 0.2,
                ),
                SizedBox(
                  width: 200,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Lottie.asset('lib/image/lottie.json'),
                        const Text('No data found')
                      ],
                    ),
                  ),
                ),
              ],
            ),
    ]);
  }
}
