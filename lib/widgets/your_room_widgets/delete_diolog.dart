import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/constance/colors.dart';
import 'package:hotel_booking_app/view_model/vendor_controller.dart';

class DeleteDialog extends StatelessWidget {
  final VendorController controller;
  final String id;
  const DeleteDialog({super.key, required this.controller, required this.id});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Delete',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      content: const Text(
        'Do you want to Delete',
        style: TextStyle(color: Color(0xFF6D6D6D)),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Cancel',
            style: TextStyle(
              color: Color.fromARGB(255, 138, 135, 135),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(
          onPressed: () async {
            controller.deleteRoom(id);
            Get.back();
          },
          child: Text(
            'Delete',
            style: TextStyle(
              color: CustomColors.mainColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: Colors.white,
      elevation: 5,
    );
  }
}
