import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/widgets/loginsign_widgets/button_widget.dart';
import 'package:hotel_booking_app/widgets/loginsign_widgets/textField_widget.dart';
import '../view_model/signup_controller.dart';
import '../widgets/loginsign_widgets/divider_widget.dart';
import '../widgets/loginsign_widgets/mobilenumber_widget.dart';

class ScreenSignUp extends StatelessWidget {
  ScreenSignUp({super.key});
  final signupController = Get.put<SignUpController>(SignUpController());

  @override
  Widget build(BuildContext context) {
    double heightMedia = MediaQuery.sizeOf(context).height;
    double widthMedia = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: signupController.signupFormKey,
          child: ListView(
            children: [
              SizedBox(
                height: heightMedia * 0.026,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'qb',
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            color: Color(0xFFCB102F),
                            fontSize: 76,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'quick book',
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            color: Color(0xFFCB102F),
                            fontSize: 20,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
              SizedBox(
                height: heightMedia * 0.04,
              ),
              TextFieldWidget(
                  validator: (value) =>
                      signupController.textFeildValidation(value),
                  text: 'Name',
                  hintText: 'enter name',
                  controller: signupController.nameController,
                  icon: Icons.person),
              SizedBox(
                height: heightMedia * 0.02,
              ),
              TextFieldWidget(
                  validator: (value) =>
                      signupController.textFeildValidation(value),
                  text: 'Email Address',
                  hintText: 'enter your email',
                  controller: signupController.emailController,
                  icon: Icons.email_outlined),
              SizedBox(
                height: heightMedia * 0.02,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      validator: (value) =>
                          signupController.textFeildValidation(value),
                      text: 'Password',
                      hintText: 'password',
                      controller: signupController.passwordController,
                      icon: Icons.key,
                      textFieldSizeCheck: true,
                    ),
                  ),
                  SizedBox(
                    width: widthMedia * 0.07,
                  ),
                  Expanded(
                    child: TextFieldWidget(
                      validator: (value) =>
                          signupController.passwordTextFeildValidation(
                              signupController.passwordController.text, value),
                      text: 'Conform Password',
                      hintText: 'password',
                      controller: signupController.conPasswordController,
                      icon: Icons.key,
                      textFieldSizeCheck: true,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: heightMedia * 0.02,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      validator: (value) =>
                          signupController.textFeildValidation(value),
                      text: 'Property Name',
                      hintText: 'propery name',
                      controller: signupController.propertyController,
                      icon: Icons.home_work_outlined,
                      textFieldSizeCheck: true,
                    ),
                  ),
                  SizedBox(
                    width: widthMedia * 0.07,
                  ),
                  Expanded(
                    child: TextFieldWidget(
                      validator: (value) =>
                          signupController.textFeildValidation(value),
                      text: 'Property Location',
                      hintText: 'enter Location',
                      controller: signupController.locationController,
                      icon: Icons.location_on,
                      textFieldSizeCheck: true,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: heightMedia * 0.02,
              ),
              MobileNoTextField(
                  text: 'Mobile Number',
                  validation: (value) =>
                      signupController.textFeildValidation(value),
                  contextMainScreen: context,
                  controller: signupController.numberController),
              SizedBox(
                height: heightMedia * 0.04,
              ),
              LoginSignButton(
                loadingCheck: signupController.loadingCheck,
                // getxController: signupController,
                onpressFunction: () => signupController.onPressFunctionSignup(),
                text: 'Sign Up',
                colorCheck: true,
              ),
              SizedBox(
                height: heightMedia * 0.01,
              ),
              const DividerWidget(),
              SizedBox(
                height: heightMedia * 0.01,
              ),
              LoginSignButton(
                loadingCheck: false.obs,
                // getxController: signupController,
                onpressFunction: () =>
                    signupController.onPressFunctionLoginNavigation(),
                text: 'Log In',
                colorCheck: false,
                borderCheck: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
