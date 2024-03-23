import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/model/get_rooms_model.dart';
import 'package:hotel_booking_app/view_model/vendor_controller.dart';
import 'package:lottie/lottie.dart';
import 'room_card_widget.dart';

class ScreenApprovedRoom extends StatelessWidget {
  final double widthMedia;
  final double heightMedia;
  final VendorController vendorController;
  const ScreenApprovedRoom(
      {super.key,
      required this.widthMedia,
      required this.heightMedia,
      required this.vendorController});

  @override
  Widget build(BuildContext context) {
    final List<VendorRoomModel> approvedRoomList = vendorController.vendorRooms
        .where((element) => element.isApproved == true)
        .toList();
    return Column(children: [
      approvedRoomList.isNotEmpty
          ? Expanded(
              child: GetBuilder<VendorController>(
                builder: (controller) => ListView.builder(
                  padding: EdgeInsets.only(top: heightMedia * 0.005),
                  itemCount: approvedRoomList.length,
                  itemBuilder: (context, index) {
                    final data = approvedRoomList[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: heightMedia * 0.02,
                        ),
                        RoomCardWidget(
                          image: data.imageList![0],
                          controller: vendorController,
                          data: data,
                          category: data.category!,
                          location: data.location!,
                          price: data.price!,
                          propertyName:
                              vendorController.vendorDetails.propertyName,
                          propertyType: data.propertyType!,
                          heightMedia: heightMedia,
                          widthMedia: widthMedia,
                        ),
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
                    // color: Colors.red,
                    //   height: heightMedia * 0.3,
                    width: 200,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Lottie.asset('lib/image/lottie.json'),
                          const Text('No data found')
                        ],
                      ),
                    )),
              ],
            ),
    ]);
  }
}
