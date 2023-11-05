import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/constance/colors.dart';
import 'package:hotel_booking_app/model/vender_model.dart';
import 'package:hotel_booking_app/view_model/vendor_controller.dart';
import 'package:hotel_booking_app/widgets/comman/heading_text.dart';
import 'package:shimmer/shimmer.dart';
import '../widgets/edit_profile_widgets/edit_profile_name_email_textfeld.dart';
import '../widgets/edit_profile_widgets/edit_profile_textfeild_widget.dart';

class ScreenEdit extends StatelessWidget {
  ScreenEdit({super.key, required this.data});
  final VendorController vendorController = Get.find<VendorController>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final VendorModel data;

  @override
  Widget build(BuildContext context) {
    double screenheight = Get.height;
    double screenWidth = Get.width;

    return Scaffold(
      floatingActionButton: Obx(
        () => FloatingActionButton.extended(
            backgroundColor: CustomColors.mainColor,
            onPressed: () {
              vendorController.editVendorProfileDetails(data);
            },
            label: vendorController.profileEditLoadingCheck.value
                ? Transform.scale(
                    scale: .5,
                    child: const CircularProgressIndicator(
                      strokeWidth: 5,
                      color: Colors.white,
                    ),
                  )
                : Text(
                    'Update',
                    style: GoogleFonts.inter(color: Colors.white),
                  )),
      ),
      backgroundColor: CustomColors.extraLightGrey,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: SingleChildScrollView(
          child: Form(
            key: vendorController.editProfileDetailsFormKey,
            child: Column(children: [
              SizedBox(
                height: screenWidth * 0.09,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back)),
                  SizedBox(
                    width: screenWidth * 0.05,
                  ),
                  const HeadingTextWidget(
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
                              child: SizedBox(
                                //  color: Colors.yellow,
                                width: double.maxFinite,
                                height: screenheight * 0.24,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GetBuilder<VendorController>(
                                      builder: (controller) => Stack(children: [
                                        vendorController.profileImage?.path ==
                                                null
                                            ? data.image != null
                                                ? Container(
                                                    width:
                                                        90, // Adjust the width to your desired avatar size
                                                    height:
                                                        90, // Adjust the height to your desired avatar size
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors
                                                          .grey, // Background color of the circle
                                                    ),
                                                    child: ClipOval(
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      child: CachedNetworkImage(
                                                        fit: BoxFit.cover,
                                                        imageUrl: data.image!,
                                                        placeholder: (context,
                                                                url) =>
                                                            Shimmer.fromColors(
                                                          baseColor: Colors
                                                              .grey.shade300,
                                                          highlightColor: Colors
                                                              .grey.shade100,
                                                          child: CircleAvatar(
                                                            radius: 45,
                                                            backgroundColor:
                                                                Colors.grey,
                                                            backgroundImage:
                                                                NetworkImage(
                                                              data.image!,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : CircleAvatar(
                                                    radius: 45,
                                                    backgroundColor:
                                                        Colors.grey,
                                                    backgroundImage:
                                                        vendorController
                                                                    .profileImage
                                                                    ?.path !=
                                                                null
                                                            ? FileImage(
                                                                File(vendorController
                                                                    .profileImage!
                                                                    .path),
                                                              )
                                                            : null,
                                                  )
                                            : CircleAvatar(
                                                radius: 45,
                                                backgroundColor: Colors.grey,
                                                backgroundImage:
                                                    vendorController
                                                                .profileImage
                                                                ?.path !=
                                                            null
                                                        ? FileImage(
                                                            File(vendorController
                                                                .profileImage!
                                                                .path),
                                                          )
                                                        : null,
                                              ),
                                        Positioned(
                                          top: screenheight * 0.07,
                                          right: 0,
                                          child: InkWell(
                                            onTap: () {
                                              vendorController.getImage();
                                            },
                                            child: CircleAvatar(
                                              radius: 14,
                                              backgroundColor:
                                                  CustomColors.mainColor,
                                              child: const Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        )
                                      ]),
                                    ),
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
                            child: SizedBox(
                              //  color: Colors.blue,
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
                                      vendorController: vendorController,
                                      validation: (value) => vendorController
                                          .textFieldValidation(value),
                                      screenHeight: screenheight,
                                      screenwidth: screenWidth,
                                      controller:
                                          vendorController.nameController,
                                      hintText: 'Enter name',
                                    ),
                                    SizedBox(
                                      height: screenheight * 0.01,
                                    ),
                                    EditNameEmailTextFeild(
                                      vendorController: vendorController,
                                      validation: (value) => vendorController
                                          .textFieldValidation(value),
                                      screenHeight: screenheight,
                                      screenwidth: screenWidth,
                                      controller:
                                          vendorController.emailController,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SingleChildScrollView(
                    child: Column(children: [
                      SizedBox(
                        height: screenheight * 0.02,
                      ),
                      EditProfileTextFeildWdiget(
                          vendorController: vendorController,
                          feildControll: true,
                          text: 'Property name',
                          validation: (value) =>
                              vendorController.textFieldValidation(value),
                          screenHeight: screenheight,
                          screenwidth: screenWidth,
                          textEditingController:
                              vendorController.propertyNameController,
                          hintText: 'enter property name'),
                      EditProfileTextFeildWdiget(
                          vendorController: vendorController,
                          text: 'Property location',
                          validation: (value) =>
                              vendorController.textFieldValidation(value),
                          screenHeight: screenheight,
                          screenwidth: screenWidth,
                          textEditingController:
                              vendorController.propertyLocationController,
                          dividerCheck: true,
                          hintText: 'enter property loaction'),
                      SizedBox(
                        height: screenheight * 0.02,
                      ),
                    ]),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
