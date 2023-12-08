import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/constance/colors.dart';
import 'package:hotel_booking_app/model/get_rooms_model.dart';
import 'package:hotel_booking_app/view/screen_map.dart';
import 'package:hotel_booking_app/view_model/map_controller.dart';

// ignore: must_be_immutable
class MapWidget extends StatelessWidget {
  MapWidget({super.key, required this.editCheck, required this.data});
  MapBoxController mapBoxController = Get.find<MapBoxController>();
  final bool editCheck;
  VendorRoomModel? data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(
        () => ScreenMap(searchSubmitButtonCheck: true),
      ),
      child: SizedBox(
        // color: Colors.green,
        height: 60,
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: GetBuilder<MapBoxController>(
                builder: (controller) => Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 25),
                  height: 60,
                  decoration: BoxDecoration(
                      color: CustomColors.extraLightGrey,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(7),
                          bottomLeft: Radius.circular(7))),
                  child: editCheck
                      ? mapBoxController.place.value == ''
                          ? Text(data!.location!)
                          : Text(mapBoxController.place.value)
                      : mapBoxController.place.value == ''
                          ? const Text('Add Your Exact Location')
                          : Text(mapBoxController.place.value),
                  // editCheck
                  //         ? Text(mapBoxController.place.value == ''
                  //             ? data!.location!
                  //             : mapBoxController.place.value)
                  //         : const Text('Add Your Exact Location'))
                  //     : const Text('Add Your Exact Location'),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    color: CustomColors.lightGreyColor,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(7),
                        bottomRight: Radius.circular(7))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 25,
                      color: CustomColors.mainColor,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
