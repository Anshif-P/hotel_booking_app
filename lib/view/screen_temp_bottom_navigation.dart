import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/constance/colors.dart';
import 'package:hotel_booking_app/view/screen_add_room.dart';
import 'package:hotel_booking_app/view/screen_bookings.dart';
import 'package:hotel_booking_app/view/screen_home.dart';
import 'package:hotel_booking_app/view/screen_profile.dart';
import 'package:hotel_booking_app/view/screen_rooms.dart';

class TempBottomNavigation extends StatefulWidget {
  const TempBottomNavigation({super.key});

  @override
  State<TempBottomNavigation> createState() => _TempBottomNavigationState();
}

class _TempBottomNavigationState extends State<TempBottomNavigation> {
  int pageIndex = 0;

  final List<Widget> _screens = [
    ScreenHome(),
    const ScreenBooking(),
    const SizedBox(),
    ScreenRooms(),
    ScreenProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    double screenHeight = Get.height;
    double screenWidth = Get.width;

    return Scaffold(
      body: _screens[pageIndex],
      bottomNavigationBar: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 0.5,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: CustomColors.lightGreyColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                ),
                Container(
                  height: screenHeight * 0.08,
                  child: BottomNavigationBar(
                      type: BottomNavigationBarType.fixed,
                      backgroundColor: Colors.white,
                      currentIndex: pageIndex,
                      onTap: (index) {
                        if (index == 2) {
                          index = 0;
                          Get.to(() => ScreenAddRoom());
                        }
                        setState(() {
                          pageIndex = index;
                        });
                      },
                      selectedItemColor:
                          Colors.black, // Set the selected item color
                      unselectedItemColor: Colors.grey,
                      selectedLabelStyle: const TextStyle(color: Colors.black),
                      unselectedLabelStyle: const TextStyle(color: Colors.grey),
                      items: [
                        const BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.home),
                          label: 'Home',
                        ),
                        const BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.bag),
                          label: 'Booking',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(
                            CupertinoIcons.add,
                            color: CustomColors.mainColor,
                          ),
                          label: 'Add Room',
                        ),
                        const BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.building_2_fill),
                          label: 'Rooms',
                        ),
                        const BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.person),
                          label: 'Profile',
                        ),
                      ]),
                ),
              ],
            ),
            // Positioned(
            //     bottom: screenHeight * 0.036,
            //     left: screenWidth * 0.4,
            //     right: screenWidth * 0.4,
            //     child: CircleAvatar(
            //       radius: 32,
            //       backgroundColor: CustomColors.lightGreyColor,
            //       child: InkWell(
            //         onTap: () {
            //           Get.to(() => ScreenAddRoom());
            //         },
            //         child: CircleAvatar(
            //           radius: 26,
            //           backgroundColor: CustomColors.mainColor,
            //           child: const Center(
            //             child: Icon(
            //               Icons.add,
            //               color: Colors.white,
            //             ),
            //           ),
            //         ),
            //       ),
            //     )),
          ],
        ),
      ),
    );
  }
}
