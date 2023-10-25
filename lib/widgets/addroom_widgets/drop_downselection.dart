import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/view_model/addroom_controller.dart';

class DropDownButton extends StatelessWidget {
  final String text;
  final String hintText;
  final bool textButtonCheck;
  final double widthMedia;
  final double heightMedia;
  final AddRoomController addRoomController;
  DropDownButton(
      {super.key,
      required this.hintText,
      required this.addRoomController,
      required this.heightMedia,
      required this.widthMedia,
      this.textButtonCheck = false,
      required this.text});
  // var myText = "Hello, GetX".obs;

  final List<String> roomType = [
    'Deluxe',
    'Classic',
    'Laxuary',
    'Twin Bedromm',
    'Normal Room',
    'Family Room'
  ];
  final List<String> states = [
    'Kerala',
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: GoogleFonts.inter(
              textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 12,
          )),
        ),
        const SizedBox(
          height: 6,
        ),
        Obx(
          () => Container(
            height: heightMedia * 0.054,
            width: widthMedia * 0.41,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Color(0xFFD1D1D1))),
            child: DropdownButton(
                isDense: true,
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.black,
                ),
                padding: EdgeInsets.only(left: 10, top: 7),
                hint: Text(hintText),
                itemHeight: 60,
                borderRadius: BorderRadius.circular(7),
                value: textButtonCheck
                    ? addRoomController.selectedState.value
                    : addRoomController.selectedType.value,
                items: textButtonCheck
                    ? states.map((String state) {
                        return DropdownMenuItem<String>(
                          value: state,
                          child: Text(
                            state.length > 12
                                ? state.substring(0, 12) + '..  '
                                : state + '   ',
                            style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            )),
                          ),
                        );
                      }).toList()
                    : roomType.map((String type) {
                        return DropdownMenuItem<String>(
                          value: type,
                          child: Text(
                            type.length > 12
                                ? type.substring(0, 12) + '..  '
                                : type + '   ',
                            style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            )),
                          ),
                        );
                      }).toList(),
                onChanged: (String? newValue) {
                  if (textButtonCheck) {
                    if (states.contains(newValue)) {
                      addRoomController.selectedState.value = newValue!;
                    } else {}
                  } else {
                    if (roomType.contains(newValue)) {
                      addRoomController.selectedType.value = newValue!;
                    } else {}
                  }
                }),
          ),
        ),
      ],
    );
  }
}
