import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/view_model/login_controller.dart';
import 'package:hotel_booking_app/widgets/loginsign_widgets/button_widget.dart';
import 'package:hotel_booking_app/widgets/loginsign_widgets/divider_widget.dart';
import 'package:hotel_booking_app/widgets/loginsign_widgets/textField_widget.dart';

// ignore: must_be_immutable
class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    double heightMedia = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: loginController.loginValidateKey,
          child: ListView(
            children: [
              SizedBox(
                height: heightMedia * 0.06,
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
              const SizedBox(
                height: 40,
              ),
              Text(
                'Add your own Hotels',
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                )),
              ),
              const SizedBox(
                height: 40,
              ),
              TextFieldWidget(
                validator: (value) =>
                    loginController.textFeildValidation(value),
                text: 'Username',
                hintText: 'enter your email',
                controller: loginController.emailController,
                icon: Icons.person,
              ),
              const SizedBox(
                height: 25,
              ),
              TextFieldWidget(
                validator: (value) =>
                    loginController.textFeildValidation(value),
                icon: Icons.key,
                text: 'Password',
                hintText: 'enter password',
                controller: loginController.passwordController,
              ),
              SizedBox(
                height: heightMedia * 0.17,
              ),
              LoginSignButton(
                  loadingCheck: loginController.loadingCheck,
                  // getxController: loginController,
                  onpressFunction: () => loginController.onPressFunctionLogin(),
                  text: 'Log In',
                  colorCheck: true),
              SizedBox(
                height: heightMedia * 0.01,
              ),
              const DividerWidget(),
              SizedBox(
                height: heightMedia * 0.01,
              ),
              LoginSignButton(
                loadingCheck: false.obs,
                // getxController: loginController,
                onpressFunction: () =>
                    loginController.onPressFunctionSignUpNavigation(),
                text: 'Sign Up',
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
