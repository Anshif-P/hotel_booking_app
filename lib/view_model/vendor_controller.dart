import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:hotel_booking_app/model/get_rooms_model.dart';

import 'package:hotel_booking_app/model/vender_model.dart';
import 'package:hotel_booking_app/service/api_service.dart';

class VendorController extends GetxController {
  Api apiObj = Api();
  late VendorModel vendorDetails;
  List<VendorRoomModel> vendorRooms = [];
  late VendorController vendorRoomObj;
  Rx<String> imageToShowDetailsScreen = ''.obs;

  getVendorDetails() async {
    try {
      final response = await apiObj.getVendorDetails();
      if (response.statusCode == 200) {
        final responseTemp = jsonDecode(response.body);
        print('this. is vendorget fnc');
        print(responseTemp);
        print('this. is body');
        final body = responseTemp['vendorDetails'];
        print(body);

        vendorDetails = VendorModel.toJson(body);

        print('hai');
        print(vendorDetails.name);
      } else {
        print('error occure');
      }
    } catch (e) {
      print(e);
    }
  }

  getVndorRooms() async {
    vendorRooms.clear();
    print('in side the getroomController');
    try {
      final response = await apiObj.getVenderRooms();
      if (response.statusCode == 200) {
        final tempResponse = jsonDecode(response.body);
        print('status code success');
        print(tempResponse);

        if (tempResponse is Map && tempResponse.containsKey('roomView')) {
          print('in if case');

          final body = tempResponse['roomView'];
          print('status code after');
          print(body);

          for (int i = 0; i < body.length; i++) {
            final roomObj = VendorRoomModel.toJson(body[i]);
            vendorRooms.add(roomObj);
          }
          update();
        } else {
          print('error');
        }
        // final obj = vendorRooms[0];
        // print(obj.amenities);
        print(
            '===========================================================================');
      }
    } catch (e) {
      print(e);
    }
  }

  deleteRoom(id) async {
    try {
      final response = await apiObj.deleteRoom(id);
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        if (body['status'] == 'success') {
          Get.snackbar('Successfully', 'deleted successfully');
          vendorRooms.removeWhere((element) => element.id == id);
          update();
        } else {
          Get.snackbar('Error Occure', 'check your network');
        }
      }
    } catch (e) {
      print(e);
      Get.snackbar('Error Occure', 'check your network');
    }
  }

  getVendorOneRoomDetails() async {
    // try{
    //  final resoponse=await
    // }catch(e){

    //}
  }
}
