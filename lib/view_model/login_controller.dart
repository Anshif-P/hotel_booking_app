import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/model/sharepref_model.dart';
import 'package:hotel_booking_app/service/api_service.dart';
import 'package:hotel_booking_app/view/screen_parent_bottom_navigation.dart';
import 'package:hotel_booking_app/view_model/vendor_controller.dart';
import '../view/screen_signup.dart';

class LoginController extends GetxController {
  final VendorController vendorController = Get.put(VendorController());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginValidateKey = GlobalKey<FormState>();
  final apiobj = Api();
  RxBool loadingCheck = false.obs;

  textFeildValidation(String value) {
    if (value.isEmpty) {
      return 'Fill the feilds';
    } else {
      return null;
    }
  }

  onPressFunctionLogin() {
    loginButtonFunction();
  }

  onPressFunctionSignUpNavigation() {
    Get.to(ScreenSignUp());
  }

  loginButtonFunction() async {
    if (loginValidateKey.currentState!.validate()) {
      loadingCheck.value = true;
      Map<String, String> loginDetails = {
        "email": emailController.text,
        "password": passwordController.text
      };
      try {
        final response = await apiobj.loginFunction(loginDetails);
        if (response!.statusCode == 200) {
          final body = jsonDecode(response.body);
          if (body['status'] == 'success') {
            await SharedPrefModel.instance.insertData('token', body['token']);

            await vendorController.getVendorDetails();
            await vendorController.getVndorRooms();

            loadingCheck.value = false;
            Get.off(() => ScreenParentNavigation());
          } else {
            loadingCheck.value = false;
            Get.snackbar('Erorr', 'username and password not match',
                backgroundColor: Colors.red);
          }
        }
      } catch (e) {
        if (e is SocketException) {
          loadingCheck.value = false;
          Get.snackbar(
            'Network Error',
            'check your network',
            backgroundColor: Colors.red,
          );
        } else {
          loadingCheck.value = false;
          Get.snackbar(
            'Error',
            'somthing went wrong',
            backgroundColor: Colors.red,
          );
        }
      }
    }
  }
}
