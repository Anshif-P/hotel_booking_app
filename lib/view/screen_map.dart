import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/constance/colors.dart';
import 'package:hotel_booking_app/view_model/map_controller.dart';
import 'package:hotel_booking_app/widgets/search_textfield_widget/search_textfeild_widget.dart';
import 'package:latlong2/latlong.dart';

class ScreenMap extends StatelessWidget {
  ScreenMap({super.key, required this.searchSubmitButtonCheck});
  final MapBoxController mapController = Get.find<MapBoxController>();
  final bool searchSubmitButtonCheck;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: searchSubmitButtonCheck
          ? FloatingActionButton.extended(
              label: const Text('Submit'),
              backgroundColor: CustomColors.mainColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              onPressed: () => Get.back(),
            )
          : const SizedBox(),
      body: SafeArea(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(7),
          child: GetBuilder<MapBoxController>(
            builder: (controller) => Stack(
              children: [
                FlutterMap(
                  mapController: mapController.mapController,
                  options: MapOptions(
                      onPointerHover: (event, point) {},
                      initialCenter: mapController.latlong,
                      initialZoom: 14,
                      onTap: (tapPosition, point) {
                        mapController.onTaped(point);
                      }),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://api.mapbox.com/styles/v1/anshif/clpdrdzyq00ck01r559ho22bz/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYW5zaGlmIiwiYSI6ImNscGRvYXA5ZzB5NWIycXByMG45dG96NWEifQ.MVUgGae2CZMNzPcSDAONLg',
                      additionalOptions: const {
                        "accessToken":
                            'pk.eyJ1IjoiYW5zaGlmIiwiYSI6ImNscGRvYXA5ZzB5NWIycXByMG45dG96NWEifQ.MVUgGae2CZMNzPcSDAONLg',
                        "id": "mapbox://styles/anshif/clpdrdzyq00ck01r559ho22bz"
                      },
                      // subdomains: const ['a', 'b', 'c'],
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                            width: 20.0,
                            height: 20.0,
                            point: mapController.latlong,
                            child: Icon(
                              Icons.location_on,
                              color: CustomColors.mainColor,
                            )),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
                  child: Card(
                    child: searchSubmitButtonCheck
                        ? SearchTextFeildWidget(
                            controller: mapController.mapLoctionController,
                            onSubmittedFunction: (value) =>
                                mapController.onSubmitted(value),
                          )
                        : const SizedBox(),
                  ),
                ),
                Positioned(
                  top: 8 + 60,
                  left: 20,
                  right: 20,
                  child: Visibility(
                    visible: mapController.searchResults.isNotEmpty,
                    child: SizedBox(
                      height: Get.height * .4,
                      child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                                child: ListTile(
                                  leading: const Icon(Icons.search),
                                  horizontalTitleGap: 0,
                                  title: Text(
                                    mapController.searchResults[index]
                                            ['placeName']
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  onTap: () {
                                    String fullPlaceName = mapController
                                        .searchResults[index]['placeName'];
                                    String placeName = mapController
                                        .getOnlyFirstName(fullPlaceName);
                                    mapController.place.value = placeName;
                                    final newlatlong = LatLng(
                                      mapController.searchResults[index]
                                          ['latitude'],
                                      mapController.searchResults[index]
                                          ['longitude'],
                                    );
                                    mapController.onSelected(newlatlong);
                                  },
                                ),
                              ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(),
                          itemCount: mapController.searchResults.length),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
