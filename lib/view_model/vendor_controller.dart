import 'dart:convert';

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/constance/colors.dart';
import 'package:hotel_booking_app/model/coupon_model.dart';
import 'package:hotel_booking_app/model/get_rooms_model.dart';
import 'package:hotel_booking_app/model/vender_model.dart';
import 'package:hotel_booking_app/service/api_service.dart';
import 'package:image_picker/image_picker.dart';

class VendorController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController propertyNameController = TextEditingController();
  final TextEditingController propertyLocationController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController conformPasswordController =
      TextEditingController();
  final GlobalKey<FormState> validationKey = GlobalKey<FormState>();
  final TextEditingController couponController = TextEditingController();

  final TextEditingController discountAmountController =
      TextEditingController();
  List<CouponModel> couponsList = [];
  Rx<bool> couponAddLoadingCheck = false.obs;

  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final GlobalKey<FormState> couponValidationFormKey = GlobalKey<FormState>();

  File? profileImage;
  Api apiObj = Api();
  late VendorModel vendorDetails;
  List<VendorRoomModel> vendorRooms = [];
  late VendorController vendorRoomObj;
  Rx<String> imageToShowDetailsScreen = ''.obs;
  String? netWorkProfileImage;
  Rx<bool> profileEditLoadingCheck = false.obs;
  final GlobalKey<FormState> editProfileDetailsFormKey = GlobalKey<FormState>();

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

        print(
            '------------------------------------body------------------------------------');
        print(body);
        print(vendorDetails.propertyLocation);
        print(vendorDetails.propertyName);
        nameController.text = vendorDetails.name;
        emailController.text = vendorDetails.email;
        propertyNameController.text = vendorDetails.propertyName;
        propertyLocationController.text = vendorDetails.propertyLocation;
        netWorkProfileImage = vendorDetails.image;
        // passwordController.text;
        // conformPasswordController.text;
      } else {
        print('error occure');
      }
    } catch (e) {
      print(e);
    }
  }

  textFieldValidation(String value) {
    value.trim();
    if (value != '') {
      return null;
    } else {
      return 'fill the field';
    }
  }

  //-------------------------- Get image from galary --------------------------//
  getImage() async {
    final imageTemp =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageTemp?.path != null) {
      profileImage = File(imageTemp!.path);
      update();
    }
  }

  changeVendorRoomAfterEditFnc(VendorRoomModel data) async {
    print('this is in side the new image fnc');
    print(data.imageList);
    for (int i = 0; i < vendorRooms.length; i++) {
      if (vendorRooms[i].id == data.id) {
        vendorRooms[i] = data;
        print('after adding new obj image list');
        ;

        print(vendorRooms[i].imageList);
        update();
        break; // Stop searching once a match is found and replaced
      }
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
            final roomObj =
                VendorRoomModel.toJson(body[i], vendorDetails.propertyName);
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

  bool imageValidation(VendorModel data) {
    if (profileImage != null || data.image != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<String?> getImageUrlFromFirebase(String image) async {
    print('------------------Edit check True-------------------------------');
    String uniqueName = DateTime.now().millisecond.toString();
    Reference fireBaseRootReference = FirebaseStorage.instance.ref();
    Reference toUploadImgReference =
        fireBaseRootReference.child('myPictures$uniqueName.png');
    try {
      await toUploadImgReference.putFile(File(image));
      image = await toUploadImgReference.getDownloadURL();
      return image;
    } catch (e) {
      print('hai---------------------');
      print(e);
    }
  }

  editVendorProfileDetails(VendorModel data) async {
    profileEditLoadingCheck.value = true;
    final bool imageCheck = imageValidation(data);
    if (imageCheck && editProfileDetailsFormKey.currentState!.validate()) {
      String? firebaseImageUrl;
      if (profileImage != null) {
        firebaseImageUrl = await getImageUrlFromFirebase(profileImage!.path);
      } else {
        firebaseImageUrl = data.image!;
      }

      final Map<String, dynamic> vendorDetailsMap = {
        "name": nameController.text,
        "email": emailController.text,
        "image": firebaseImageUrl,
        "propertyName": propertyNameController.text,
        "propertyLocation": propertyLocationController.text
      };

      final response = await apiObj.updateVendorDetails(vendorDetailsMap);
      try {
        if (response.statusCode == 200) {
          final body = jsonDecode(response.body);
          if (body['status'] == 'success') {
            final vendorDetaislObj = VendorModel(
                id: data.id,
                name: nameController.text,
                email: emailController.text,
                propertyName: propertyNameController.text,
                propertyLocation: propertyLocationController.text,
                isBanned: data.isBanned,
                image: firebaseImageUrl);
            vendorDetails = vendorDetaislObj;
            profileEditLoadingCheck.value = false;

            Get.back();

            Get.snackbar('Profile Edited', 'Successfully');
            print('-------------edit -------------------------body ');

            print(vendorDetails.name);
            update();
            disposeController();
          }
        }
      } catch (e) {}
    } else {
      profileEditLoadingCheck.value = false;
      Get.snackbar('Error', 'Fill the Feild Properly');
    }
  }

  void disposeController() {
    print(
        'controller disposed -----------------------------------------------  disposed ');
    profileImage = null;
    nameController.text = '';
    emailController.text = '';
    propertyLocationController.text = '';
    propertyNameController.text = '';
  }

  addCoupons() async {
    couponAddLoadingCheck.value = true;
    if (couponValidationFormKey.currentState!.validate()) {
      Map<String, dynamic> couponMap = {
        "code": couponController.text,
        "discount": discountAmountController.text,
        "startDate": startDateController.text,
        "endDate": endDateController.text
      };
      print(
          '--------------------------before adding coupon -----------------------------');
      print(couponMap);
      final response = await apiObj.addCoupons(couponMap);
      try {
        if (response.statusCode == 200) {
          var body = jsonDecode(response.body);
          if (body['status'] == 'success') {
            body = body['coupons'];
            final couponObj = CouponModel.fromJson(body);
            couponsList.add(couponObj);
            Get.back();
            Get.snackbar('Coupon Added ', 'Successfully');
            update();
          }
        } else {
          couponAddLoadingCheck.value = false;

          Get.snackbar("Error Occure", "somthing went wrong",
              backgroundColor: CustomColors.mainColor);
        }
      } catch (e) {
        if (e is SocketException) {
          couponAddLoadingCheck.value = false;

          Get.snackbar("Net Work Issue", "check your network",
              backgroundColor: CustomColors.mainColor);
        } else {
          couponAddLoadingCheck.value = false;

          print(e);
          // Get.snackbar('Error occure', 'somthing went wrong',
          //     backgroundColor: CustomColors.mainColor);
        }
      }
    } else {
      couponAddLoadingCheck.value = false;
      Get.snackbar('Failed', 'fill the feild properly ',
          backgroundColor: CustomColors.mainColor);
    }
  }

  getVendorCoupons() async {
    final response = await apiObj.getVendorCoupons();
    try {
      if (response.statusCode == 200) {
        print('1');
        final List body = jsonDecode(response.body);

        print('2');
        print(body);
        for (int i = 0; i < body.length; i++) {
          final couponObj = CouponModel.fromJson(body[i]);
          couponsList.add(couponObj);
        }

        print(
            '------------------------------coupon list------------------------------');
        print(couponsList[0].startDate);
        print(couponsList[0].endDate);
      }
    } catch (e) {
      if (e is SocketException) {
        Get.snackbar("Net Work Issue", "check your network",
            backgroundColor: CustomColors.mainColor);
      } else {
        print(e);
        Get.snackbar('Error occure', 'somthing went wrong',
            backgroundColor: CustomColors.mainColor);
      }
    }
  }

  deleteCoupon(CouponModel data) async {
    final response = await apiObj.deleteCoupon(data.id);
    try {
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        if (body['status'] == 'success') {
          couponsList.remove(data);
          Get.snackbar('Deleted', 'Successfully');
        } else {
          Get.snackbar('Error Occure', 'somthing went to wrong');
        }
        update();
      }
    } catch (e) {
      if (e is SocketException) {
        Get.snackbar("Net Work Issue", "check your network",
            backgroundColor: CustomColors.mainColor);
      } else {
        print(e);
        Get.snackbar('Error occure', 'somthing went wrong',
            backgroundColor: CustomColors.mainColor);
      }
    }
  }
}
