import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/constance/colors.dart';
import 'package:hotel_booking_app/view_model/addroom_controller.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({super.key, required this.addRoomController});
  final AddRoomController addRoomController;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 03,
        ),
        itemCount: addRoomController.items.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              SizedBox(
                width: 22,
                child: Obx(
                  () => Checkbox(
                      checkColor: Colors.black,
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => CustomColors.lightGreyColor),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                      value: addRoomController.boolValues[index].value,
                      onChanged: (value) {
                        addRoomController.boolValues[index].value = value!;
                      }),
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              SizedBox(
                child: Text(
                  addRoomController.items[index],
                  style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                  )),
                ),
              ),
            ],
          );
        });
  }
}

// class ScreenCheckBoxWidget extends StatelessWidget {
//   ScreenCheckBoxWidget({super.key});
//   Rx<bool> hasWiFi = false.obs;
//   Rx<bool> hasRestaurant = false.obs;
//   Rx<bool> hasAC = false.obs;
//   Rx<bool> hasPowerBackup = false.obs;
//   Rx<bool> hasFitnessCenter = false.obs;
//   Rx<bool> hasTV = false.obs;
//   Rx<bool> isOpen24Hours = false.obs;
//   Rx<bool> hasMeetingRoom = false.obs;
//   Rx<bool> hasElevator = false.obs;

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => SizedBox(
//         height: 170,
//         width: 350,
//         child: Container(
//           //   color: Colors.red,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 //   color: Colors.yellow,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       // color: Colors.blue,
//                       width: 22,
//                       child: Checkbox(
//                           fillColor: MaterialStateColor.resolveWith(
//                               (states) => CustomColors.lightGreyColor),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(3)),
//                           value: hasWiFi.value,
//                           onChanged: (value) {
//                             hasWiFi.value = value!;
//                           }),
//                     ),
//                     const SizedBox(
//                       width: 7,
//                     ),
//                     SizedBox(
//                       width: 100,
//                       child: Text(
//                         'Wifi',
//                         style: GoogleFonts.inter(
//                             textStyle: const TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w300,
//                           fontSize: 12,
//                         )),
//                       ),
//                     ),
//                     SizedBox(
//                       //  color: Colors.green,
//                       width: 22,
//                       child: Checkbox(
//                           fillColor: MaterialStateColor.resolveWith(
//                               (states) => CustomColors.lightGreyColor),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(3)),
//                           value: hasRestaurant.value,
//                           onChanged: (value) {
//                             hasRestaurant.value = value!;
//                           }),
//                     ),
//                     SizedBox(
//                       width: 7,
//                     ),
//                     Container(
//                       width: 100,
//                       child: Text(
//                         'Resaurant',
//                         style: GoogleFonts.inter(
//                             textStyle: const TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w300,
//                           fontSize: 12,
//                         )),
//                       ),
//                     ),
//                     Container(
//                       //   color: Colors.orange,
//                       width: 22,
//                       child: Checkbox(
//                           fillColor: MaterialStateColor.resolveWith(
//                               (states) => CustomColors.lightGreyColor),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(3)),
//                           value: hasAC.value,
//                           onChanged: (value) {
//                             hasAC.value = value!;
//                           }),
//                     ),
//                     SizedBox(
//                       width: 7,
//                     ),
//                     Container(
//                       child: Text(
//                         'Ac',
//                         style: GoogleFonts.inter(
//                             textStyle: const TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w300,
//                           fontSize: 12,
//                         )),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 //  color: const Color.fromARGB(255, 81, 108, 155),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Container(
//                       //      color: Colors.blue[900],
//                       width: 22,
//                       alignment: Alignment.centerLeft,
//                       child: Checkbox(
//                           fillColor: MaterialStateColor.resolveWith(
//                               (states) => CustomColors.lightGreyColor),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(3)),
//                           value: hasWiFi.value,
//                           onChanged: (value) {
//                             hasWiFi.value = value!;
//                           }),
//                     ),
//                     SizedBox(
//                       width: 7,
//                     ),
//                     Container(
//                       width: 100,
//                       child: Text(
//                         'Power backup',
//                         style: GoogleFonts.inter(
//                             textStyle: const TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w300,
//                           fontSize: 12,
//                         )),
//                       ),
//                     ),

//                     // SizedBox(
//                     //   width: 40,
//                     // ),
//                     Container(
//                       //    color: Colors.green,
//                       width: 22,
//                       child: Checkbox(
//                           fillColor: MaterialStateColor.resolveWith(
//                               (states) => CustomColors.lightGreyColor),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(3)),
//                           value: hasRestaurant.value,
//                           onChanged: (value) {
//                             hasRestaurant.value = value!;
//                           }),
//                     ),
//                     SizedBox(
//                       width: 7,
//                     ),
//                     SizedBox(
//                       width: 100,
//                       child: Text(
//                         'Fitness Center',
//                         style: GoogleFonts.inter(
//                             textStyle: const TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w300,
//                           fontSize: 12,
//                         )),
//                       ),
//                     ),

//                     Container(
//                       //    color: Colors.orange,
//                       width: 22,
//                       child: Checkbox(
//                           fillColor: MaterialStateColor.resolveWith(
//                               (states) => CustomColors.lightGreyColor),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(3)),
//                           value: hasAC.value,
//                           onChanged: (value) {
//                             hasAC.value = value!;
//                           }),
//                     ),
//                     SizedBox(
//                       width: 7,
//                     ),
//                     Container(
//                       child: Text(
//                         'Tv',
//                         style: GoogleFonts.inter(
//                             textStyle: const TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w300,
//                           fontSize: 12,
//                         )),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 //    color: Colors.orangeAccent,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Container(
//                       //      color: Colors.blue,
//                       width: 22,
//                       alignment: Alignment.centerLeft,
//                       child: Checkbox(
//                           fillColor: MaterialStateColor.resolveWith(
//                               (states) => CustomColors.lightGreyColor),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(3)),
//                           value: hasWiFi.value,
//                           onChanged: (value) {
//                             hasWiFi.value = value!;
//                           }),
//                     ),
//                     SizedBox(
//                       width: 7,
//                     ),
//                     SizedBox(
//                       width: 100,
//                       child: Text(
//                         '24-Hours Open',
//                         style: GoogleFonts.inter(
//                             textStyle: const TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w300,
//                           fontSize: 12,
//                         )),
//                       ),
//                     ),

//                     // SizedBox(
//                     //   width: 40,
//                     // ),
//                     Container(
//                       //      color: Colors.green,
//                       width: 22,
//                       child: Checkbox(
//                           fillColor: MaterialStateColor.resolveWith(
//                               (states) => CustomColors.lightGreyColor),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(3)),
//                           value: hasRestaurant.value,
//                           onChanged: (value) {
//                             hasRestaurant.value = value!;
//                           }),
//                     ),
//                     SizedBox(
//                       width: 7,
//                     ),
//                     SizedBox(
//                       width: 100,
//                       child: Text(
//                         'Meeting Room',
//                         style: GoogleFonts.inter(
//                             textStyle: const TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w300,
//                           fontSize: 12,
//                         )),
//                       ),
//                     ),
//                     Container(
//                       //    color: Colors.orange,
//                       width: 22,
//                       child: Checkbox(
//                           activeColor: Colors.blue,
//                           checkColor: Colors.red,
//                           // overlayColor: MaterialStateColor.resolveWith(
//                           //     (states) => Colors.yellow),
//                           hoverColor: Colors.red,

//                           // focusColor: Colors.red,
//                           fillColor: MaterialStateColor.resolveWith(
//                               (states) => CustomColors.lightGreyColor),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(3)),
//                           value: hasAC.value,
//                           onChanged: (value) {
//                             hasAC.value = value!;
//                           }),
//                     ),
//                     SizedBox(
//                       width: 7,
//                     ),
//                     Text(
//                       'Elevator',
//                       style: GoogleFonts.inter(
//                           textStyle: const TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w300,
//                         fontSize: 12,
//                       )),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
