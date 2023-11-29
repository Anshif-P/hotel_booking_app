import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/constance/colors.dart';
import 'package:hotel_booking_app/view/screen_map.dart';
import 'package:hotel_booking_app/view_model/map_controller.dart';

class MapWidget extends StatelessWidget {
  MapWidget({super.key});
  MapBoxController mapBoxController = Get.find<MapBoxController>();

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
                  child: mapBoxController.place.value != ''
                      ? Text(mapBoxController.place.value)
                      : const Text('Add Your Exact Location'),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    color: CustomColors.lightGreyColor,
                    borderRadius:const BorderRadius.only(
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
