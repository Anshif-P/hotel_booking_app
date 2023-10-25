import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hotel_booking_app/service/api_service.dart';

import '../model/sharepref_model.dart';
import '../view/screen_bottom_navigation.dart';

class SignUpController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conPasswordController = TextEditingController();
  TextEditingController propertyController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  Api apiObj = Api();
  RxBool loadingCheck = false.obs;

  textFeildValidation(String value) {
    if (value.isEmpty) {
      return 'Fill the field';
    } else {
      return null;
    }
  }

  emailTextFeildValidation(String value) {
    if (GetUtils.isEmail(value)) {
      return null;
    } else {
      return 'Enter correct email';
    }
  }

  onPressFunctionLoginNavigation() {
    Get.back();
  }

  onPressFunctionSignup() {
    signUpButtonFunction();
  }

  passwordTextFeildValidation(String password, String conformPass) {
    if (password != conformPass) {
      return 'Is invalid password password mismatch';
    } else if (password.isEmpty) {
      return 'Fill the field';
    } else {
      return null;
    }
  }

  signUpButtonFunction() async {
    if (signupFormKey.currentState?.validate() ?? false) {
      loadingCheck.value = true;
      Map<String, String> signUpDetails = {
        "name": nameController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "confirmPass": conPasswordController.text,
        "phone": numberController.text,
        "propertyName": propertyController.text,
        "propertyLocation": locationController.text
      };
      try {
        final response = await apiObj.signUpFunction(signUpDetails);
        if (response.statusCode == 200) {
          final body = jsonDecode(response.body);
          if (body['status'] == 'success') {
            SharedPrefModel.instance.insertData('token', body['token']);

            // final token = sharePref.get('token');
            // print(token);
            apiObj.getVendorDetails();
            loadingCheck.value = false;
            Get.to(ScreenBottomNavigation());
          } else {
            loadingCheck.value = false;
            Get.snackbar('Alert', 'username already taken',
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
            'Erro',
            'somthing went wrong',
            backgroundColor: Colors.red,
          );
        }
      }
    }
  }
}
