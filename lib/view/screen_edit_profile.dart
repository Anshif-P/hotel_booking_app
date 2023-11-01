import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/constance/colors.dart';
import 'package:hotel_booking_app/widgets/comman/heading_text.dart';

import '../widgets/edit_profile_widgets/edit_profile_name_email_textfeld.dart';
import '../widgets/edit_profile_widgets/edit_profile_textfeild_widget.dart';

class ScreenEdit extends StatelessWidget {
  ScreenEdit({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController propertyNameController = TextEditingController();
  final TextEditingController propertyLocationController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController conformPasswordController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenheight = Get.height;
    double screenWidth = Get.width;

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: CustomColors.mainColor,
          onPressed: () {},
          label: Text(
            'Update',
            style: GoogleFonts.inter(color: Colors.white),
          )),
      backgroundColor: CustomColors.extraLightGrey,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: screenWidth * 0.09,
            ),
            Row(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
                SizedBox(
                  width: screenWidth * 0.05,
                ),
                HeadingTextWidget(
                  text: 'Edit Profile',
                  sizeCheck: true,
                ),
              ],
            ),
            Card(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7)),
                height: screenheight * 0.24,
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Container(
                              //  color: Colors.yellow,
                              width: double.maxFinite,
                              height: screenheight * 0.24,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Stack(children: [
                                    CircleAvatar(
                                      radius: 45,
                                      backgroundColor: Colors.grey,
                                      child: Center(),
                                    ),
                                    Positioned(
                                      top: screenheight * 0.07,
                                      right: 0,
                                      child: InkWell(
                                        onTap: () {},
                                        child: CircleAvatar(
                                          radius: 14,
                                          backgroundColor:
                                              CustomColors.mainColor,
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  ]),
                                  SizedBox(
                                    height: screenheight * 0.01,
                                  ),
                                  Text(
                                    'Edit Photo',
                                    style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                            color: CustomColors.mainColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          width: screenWidth * 0.0,
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            //   color: Colors.blue,
                            width: double.maxFinite,
                            height: screenheight * 0.24,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: screenheight * 0.061,
                                  ),
                                  EditNameEmailTextFeild(
                                    validation: (value) {},
                                    screenHeight: screenheight,
                                    screenwidth: screenWidth,
                                    controller: nameController,
                                    hintText: 'Enter name',
                                  ),
                                  SizedBox(
                                    height: screenheight * 0.01,
                                  ),
                                  EditNameEmailTextFeild(
                                    validation: (Value) {},
                                    screenHeight: screenheight,
                                    screenwidth: screenWidth,
                                    controller: nameController,
                                    hintText: 'Enter email',
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenheight * 0.02,
            ),
            Card(
              child: Container(
                // color: Colors.yellow,
                height: screenheight * 0.27,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(children: [
                    SizedBox(
                      height: screenheight * 0.02,
                    ),
                    EditProfileTextFeildWdiget(
                        feildControll: true,
                        text: 'Property name',
                        validation: (value) {},
                        screenHeight: screenheight,
                        screenwidth: screenWidth,
                        controller: propertyNameController,
                        hintText: 'enter property name'),
                    EditProfileTextFeildWdiget(
                        text: 'Property location',
                        validation: (value) {},
                        screenHeight: screenheight,
                        screenwidth: screenWidth,
                        controller: propertyNameController,
                        hintText: 'enter property loaction'),
                    EditProfileTextFeildWdiget(
                        text: 'Password',
                        validation: (value) {},
                        screenHeight: screenheight,
                        screenwidth: screenWidth,
                        controller: propertyNameController,
                        hintText: 'enter password'),
                    EditProfileTextFeildWdiget(
                        dividerCheck: true,
                        text: 'Conform Password',
                        validation: (value) {},
                        screenHeight: screenheight,
                        screenwidth: screenWidth,
                        controller: propertyNameController,
                        hintText: 'conform password'),
                  ]),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
