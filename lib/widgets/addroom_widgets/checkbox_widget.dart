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
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                      value: addRoomController
                          .amentiesMap[addRoomController.items[index]]!,
                      onChanged: (value) {
                        addRoomController
                                .amentiesMap[addRoomController.items[index]] =
                            value!;
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
