import 'dart:io';

import 'package:flutter/material.dart';

import 'package:hotel_booking_app/constance/colors.dart';
import 'package:hotel_booking_app/view_model/addroom_controller.dart';

class SelectPhotosWidgts extends StatelessWidget {
  final double heightMedia;
  final double widthMedia;
  final File? image;
  final int caseNo;
  final AddRoomController addRoomController;
  const SelectPhotosWidgts(
      {super.key,
      required this.image,
      required this.addRoomController,
      required this.heightMedia,
      required this.widthMedia,
      required this.caseNo});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        addRoomController.pickImage(image, caseNo);
      },
      child: Container(
        width: widthMedia * 0.17,
        height: heightMedia * 0.07,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: CustomColors.lightGreyColor,
        ),
        child: image == null
            ? Center(
                child: Icon(Icons.add),
              )
            : InkWell(
                onTap: () {
                  addRoomController.pickImage(image, caseNo);
                },
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: FileImage(File(image!.path)),
                        fit: BoxFit.fill,
                      )),
                ),
              ),
      ),
    );
  }
}
 // SizedBox(
    //   width: 26,
    // ),
    // Container(
    //   width: widthMedia * 0.17,
    //   height: heightMedia * 0.07,
    //   decoration: BoxDecoration(
    //     color: Colors.yellow,
    //     borderRadius: BorderRadius.circular(7),
    //   ),
    // ),
    // SizedBox(
    //   width: 26,
    // ),
    // Container(
    //   width: widthMedia * 0.17,
    //   height: heightMedia * 0.07,
    //   decoration: BoxDecoration(
    //     color: Colors.yellow,
    //     borderRadius: BorderRadius.circular(7),
    //   ),
    // ),
    // SizedBox(
    //   width: 26,
    // ),
    // Container(
    //   width: widthMedia * 0.17,
    //   height: heightMedia * 0.07,
    //   decoration: BoxDecoration(
    //     color: Colors.yellow,
    //     borderRadius: BorderRadius.circular(7),
    //   ),
    // ),