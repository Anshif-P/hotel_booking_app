import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/model/sharepref_model.dart';
import 'package:hotel_booking_app/service/api_service.dart';
import 'package:hotel_booking_app/view/screen_bottom_navigation.dart';

import '../view/screen_signup.dart';

class LoginController extends GetxController {
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
    if (loginValidateKey.currentState?.validate() ?? false) {
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
            SharedPrefModel.instance.insertData('token', body['token']);
            apiobj.getVendorDetails();
            // final token = sharePref.get('token');
            // print(token);
            loadingCheck.value = false;
            Get.to(ScreenBottomNavigation());
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
            'Erro',
            'somthing went wrong',
            backgroundColor: Colors.red,
          );
        }
      }

      //       try {
      //          final response = await apiobj.loginFunction(loginDetails);
      //           if (response?.statusCode == 200 && response != null)
      //         print('hee');
      //         final body = jsonDecode(response.body);
      //         print(body['status']);
      //         if (body['status'] == 'success') {
      //           final sharePref = await SharedPreferences.getInstance();
      //           sharePref.setString('token', body['token']);
      //           print('token printing');
      //           final token = sharePref.get('token');
      //           print(token);
      //           loadingCheck.value = false;
      //           Get.to(ScreenBottomNavigation());
      //         } else {
      //           loadingCheck.value = false;
      //           Get.snackbar('Erorr', 'username and password not match',
      //               backgroundColor: Colors.red);
      //         }
      //       } catch (e) {
      //         print(e);
      //         if (e == SocketException) {
      //           loadingCheck.value = false;
      //           Get.snackbar(
      //             'Erro',
      //             'NetWork problem',
      //             backgroundColor: Colors.red,
      //           );
      //         }
      //       }
      //     } else if (response != null) {
      //       print('error status');
      //       loadingCheck.value = false;
      //       Get.snackbar(
      //         'Erro',
      //         'Occuaring',
      //         backgroundColor: Colors.red,
      //       );
      //     } else if (response == null) {
      //       loadingCheck.value = false;
      //       Get.snackbar('Network Error', 'please check network',
      //           backgroundColor: Colors.red);
      //       loadingCheck.value = false;
      //     }
      //
    }
  }
}
