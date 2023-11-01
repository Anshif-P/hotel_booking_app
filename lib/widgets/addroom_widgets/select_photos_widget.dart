import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:hotel_booking_app/constance/colors.dart';
import 'package:hotel_booking_app/model/get_rooms_model.dart';
import 'package:hotel_booking_app/view_model/addroom_controller.dart';
import 'package:shimmer/shimmer.dart';

class SelectPhotosWidgts extends StatelessWidget {
  final double heightMedia;
  final double widthMedia;
  final File? imagePath;
  final int caseNo;
  final String? netWorkImage;
  final VendorRoomModel? data;
  final AddRoomController addRoomController;
  final bool editCheck;
  const SelectPhotosWidgts(
      {super.key,
      required this.netWorkImage,
      required this.editCheck,
      required this.data,
      required this.imagePath,
      required this.addRoomController,
      required this.heightMedia,
      required this.widthMedia,
      required this.caseNo});

  @override
  Widget build(BuildContext context) {
    return editCheck
        ? InkWell(
            onTap: () {
              addRoomController.pickImage(imagePath, caseNo);
            },
            child: imagePath?.path != null
                ? Container(
                    width: widthMedia * 0.17,
                    height: heightMedia * 0.07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: CustomColors.lightGreyColor,
                      image: DecorationImage(
                          image: FileImage(File(imagePath!.path)),
                          fit: BoxFit.cover),
                    ))
                : ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: CachedNetworkImage(
                      width: widthMedia * 0.17,
                      height: heightMedia * 0.07,
                      fit: BoxFit.cover,
                      imageUrl: netWorkImage!,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                            width: widthMedia * 0.17,
                            height: heightMedia * 0.07,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: CustomColors.lightGreyColor,
                              image: netWorkImage != null
                                  ? DecorationImage(
                                      image: NetworkImage(netWorkImage!)
                                          as ImageProvider,
                                      fit: BoxFit.cover)
                                  : null,
                            )),
                      ),
                    ),
                  ))
        : InkWell(
            onTap: () {
              addRoomController.pickImage(imagePath, caseNo);
            },
            child: Container(
              width: widthMedia * 0.17,
              height: heightMedia * 0.07,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: CustomColors.lightGreyColor,
              ),
              child: imagePath == null
                  ? Center(
                      child: Icon(Icons.add),
                    )
                  : InkWell(
                      onTap: () {
                        addRoomController.pickImage(imagePath, caseNo);
                      },
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              image: FileImage(File(imagePath!.path)),
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