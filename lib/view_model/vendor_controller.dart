import 'dart:convert';

import 'package:get/get.dart';

import 'package:hotel_booking_app/model/vender_model.dart';
import 'package:hotel_booking_app/service/api_service.dart';

class VendorController extends GetxController {
  Api apiObj = Api();
  late VendorModel vendor;
  getVendorDetails() async {
    try {
      final response = await apiObj.getVendorDetails();
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        print('this. is vendorget fnc');
        print(body);
        print('this. is body');

        vendor = VendorModel(
          id: body["_id"],
          name: body["name"],
          email: body["email"],
          password: body["password"],
          propertyName: body['propertyName'],
          propertyLocation: body["propertyName"],
          phone: body["phone"],
          isBanned: body['isBanned'],
        );
        print('hai');
        print(vendor.name);
      } else {
        print('error occure');
      }
    } catch (e) {
      print(e);
    }
  }
}
