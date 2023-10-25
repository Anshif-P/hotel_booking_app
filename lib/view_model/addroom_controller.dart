import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/service/api_service.dart';

import 'package:image_picker/image_picker.dart';

class AddRoomController extends GetxController {
  TextEditingController propertyTypeController = TextEditingController();
  TextEditingController totalRoomController = TextEditingController();
  TextEditingController singleRoomPriceController = TextEditingController();
  TextEditingController adultPriceController = TextEditingController();
  TextEditingController totalRoomPriceController = TextEditingController();
  TextEditingController capacityController = TextEditingController();
  TextEditingController propertyAddressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Api apiObj = Api();

  RxBool loadingCheck = false.obs;
  Rx<String> selectedState = 'Kerala'.obs;
  Rx<String> selectedType = 'Deluxe'.obs;

  //------------ Amenitis Section -----------//
  List items = [
    'Wifi',
    'Restaurant',
    'Ac',
    'Power backup',
    'Fitness Center',
    'Tv',
    '24-Hours Open',
    'Meeting Room',
    'Elevator'
  ];

  var boolValues = List.generate(9, (index) => false.obs);

  List<String> getSelectedAmenties() {
    List<String> amenitiesList = [];
    for (int i = 0; i < items.length; i++) {
      if (boolValues[i].value) {
        amenitiesList.add(items[i]);
      }
    }
    return amenitiesList;
  }

  //--------- End -------------//

  //---------- Image Section ----------//

  File? image1;
  File? image2;
  File? image3;
  File? image4;

  Future pickImage(File? image, int caseNo) async {
    final imageTemp =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    print('ImagePicker result: $imageTemp');

    if (imageTemp?.path != null) {
      try {
        switch (caseNo) {
          case (1):
            {
              print('case 1');
              image1 = File(imageTemp!.path);
              update();
            }
          case (2):
            {
              print('case 2');
              image2 = File(imageTemp!.path);
            }
          case (3):
            {
              image3 = File(imageTemp!.path);
            }
          case (4):
            {
              image4 = File(imageTemp!.path);
            }
        }
      } catch (e) {
        print('error is thi');
        print(e);
      }
      update();
    } else {
      print('path is emty');
    }
  }

  //-----------image section ended------------//

  //-----------TextField Validations-----------//
  textFieldValidation(value) {
    if (value != null) {
      return null;
    } else {
      return 'fill the field';
    }
  }

  bool imageValidation() {
    if (image1 != null && image2 != null && image3 != null && image4 != null) {
      return true;
    } else {
      return false;
    }
  }

  //----------- Passing detailse ------------//

  addRoomButtonFunction() async {
    List<String> amenitiesList = getSelectedAmenties();
    Map<String, dynamic> roomDetails = {
      "roomNo": totalRoomController.text,
      "price": totalRoomPriceController.text,
      "adultRate": adultPriceController.text,
      "OneRoom": singleRoomPriceController.text,
      "capacity": capacityController.text,
      "address": propertyAddressController.text,
      "city": cityController.text,
      "state": stateController.text,
      "zip": pinCodeController.text,
      "description": descriptionController.text,
      "amenities": amenitiesList,
      "image": [image1!.path, image2!.path, image3!.path, image4!.path],
      "category": selectedType.value.toString(),
      "location": selectedState.value.toString(),
      "longitude": "yes",
      "latitude": 0.23
    };

    bool imageCheck = imageValidation();
    if (imageCheck && formKey.currentState!.validate()) {
      loadingCheck = true.obs;
      print(roomDetails['image']);
      final response = await apiObj.addRoom(roomDetails);

      try {
        if (response.statusCode == 200) {
          final body = jsonDecode(response.body);
          if (body['status'] == 'success') {
            print('success');
            Get.snackbar(
              'Success',
              'Room Added Successfuly',
            );
            loadingCheck = false.obs;
            loadingCheck = false.obs;
            Get.back();
          } else {
            Get.snackbar(
              'Error Occure',
              'Check Your Details',
              backgroundColor: Colors.red,
            );
            loadingCheck = false.obs;
          }
        } else {
          Get.snackbar(
            'Error Occure',
            'Somthing Went Wrong',
            backgroundColor: Colors.red,
          );
          loadingCheck = false.obs;
        }
      } catch (e) {
        if (e is SocketException) {
          Get.snackbar(
            'NetWork Error',
            'Check Your Network',
            backgroundColor: Colors.red,
          );
          loadingCheck = false.obs;
        }
      }
    } else {
      Get.snackbar('Error', 'Complete All Field');
      loadingCheck = false.obs;
    }
  }
}
