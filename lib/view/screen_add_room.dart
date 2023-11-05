import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/model/get_rooms_model.dart';
import 'package:hotel_booking_app/view_model/addroom_controller.dart';
import 'package:hotel_booking_app/view_model/vendor_controller.dart';
import 'package:hotel_booking_app/widgets/addroom_widgets/map_select_location.dart';
import 'package:hotel_booking_app/widgets/addroom_widgets/textfield_widget.dart';
import 'package:hotel_booking_app/widgets/loginsign_widgets/button_widget.dart';
import '../widgets/addroom_widgets/checkbox_widget.dart';
import '../widgets/addroom_widgets/drop_downselection.dart';
import '../widgets/addroom_widgets/select_photos_widget.dart';
import '../widgets/comman/heading_text.dart';

class ScreenAddRoom extends StatelessWidget {
  final VendorRoomModel? data;
  ScreenAddRoom({super.key, this.editCheck = false, this.data});
  final bool editCheck;
  final VendorController vendorRoomModel = Get.find<VendorController>();
  @override
  Widget build(BuildContext context) {
    final addRoomController = Get.put(
      AddRoomController(roomObjForEdit: data),
    );
    double heightMedia = MediaQuery.sizeOf(context).height;
    double widthMedia = MediaQuery.sizeOf(context).width;
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                    key: addRoomController.addRoomFormKey,
                    child: GetBuilder<AddRoomController>(
                        builder: (controller) => ListView(children: [
                              SizedBox(height: heightMedia * 0.03),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(children: [
                                      InkWell(
                                          onTap: () {
                                            addRoomController.onClose();
                                            Get.back();
                                          },
                                          child: const Icon(Icons.arrow_back)),
                                      SizedBox(width: widthMedia * 0.2)
                                    ]),
                                    HeadingTextWidget(text: 'Add your room')
                                  ]),
                              SizedBox(height: heightMedia * 0.027),
                              Text('Select photos',
                                  style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                          color: Colors.black, fontSize: 19))),
                              const SizedBox(height: 17),
                              Row(children: [
                                Expanded(
                                    child: SelectPhotosWidgts(
                                  netWorkImage: data?.imageList?[0],
                                  editCheck: editCheck,
                                  data: data,
                                  caseNo: 1,
                                  addRoomController: addRoomController,
                                  imagePath: addRoomController.image1,
                                  heightMedia: heightMedia,
                                  widthMedia: widthMedia,
                                )),
                                const SizedBox(width: 26),
                                Expanded(
                                    child: SelectPhotosWidgts(
                                  netWorkImage: data?.imageList?[1],
                                  editCheck: editCheck,
                                  data: data,
                                  caseNo: 2,
                                  addRoomController: addRoomController,
                                  imagePath: addRoomController.image2,
                                  heightMedia: heightMedia,
                                  widthMedia: widthMedia,
                                )),
                                const SizedBox(width: 26),
                                Expanded(
                                    child: SelectPhotosWidgts(
                                  netWorkImage: data?.imageList?[2],
                                  editCheck: editCheck,
                                  data: data,
                                  caseNo: 3,
                                  addRoomController: addRoomController,
                                  imagePath: addRoomController.image3,
                                  heightMedia: heightMedia,
                                  widthMedia: widthMedia,
                                )),
                                const SizedBox(width: 26),
                                Expanded(
                                    child: SelectPhotosWidgts(
                                  netWorkImage: data?.imageList?[3],
                                  editCheck: editCheck,
                                  data: data,
                                  caseNo: 4,
                                  addRoomController: addRoomController,
                                  imagePath: addRoomController.image4,
                                  heightMedia: heightMedia,
                                  widthMedia: widthMedia,
                                ))
                              ]),
                              const SizedBox(height: 17),
                              Row(children: [
                                TextFeildAddRoomWidget(
                                  validationFunction: (value) =>
                                      addRoomController
                                          .textFieldValidation(value),
                                  text: 'Property Type',
                                  hintText: 'enter property type',
                                  controller:
                                      addRoomController.propertyTypeController,
                                  textFieldSizeCheck: true,
                                  heightMedia: heightMedia,
                                  widthMedia: widthMedia,
                                ),
                                SizedBox(width: widthMedia * 0.066),
                                TextFeildAddRoomWidget(
                                  validationFunction: (value) =>
                                      addRoomController
                                          .textFieldValidation(value),
                                  text: 'Total Room',
                                  keyboardType: true,
                                  hintText: 'enter available room',
                                  controller:
                                      addRoomController.totalRoomController,
                                  textFieldSizeCheck: true,
                                  heightMedia: heightMedia,
                                  widthMedia: widthMedia,
                                ),
                              ]),
                              SizedBox(height: heightMedia * 0.01),
                              Row(children: [
                                TextFeildAddRoomWidget(
                                  keyboardType: true,
                                  validationFunction: (value) =>
                                      addRoomController
                                          .textFieldValidation(value),
                                  text: 'Single Room Price',
                                  hintText: 'enter room amount',
                                  controller: addRoomController
                                      .singleRoomPriceController,
                                  textFieldSizeCheck: true,
                                  heightMedia: heightMedia,
                                  widthMedia: widthMedia,
                                ),
                                SizedBox(width: widthMedia * 0.066),
                                TextFeildAddRoomWidget(
                                  keyboardType: true,
                                  validationFunction: (value) =>
                                      addRoomController
                                          .textFieldValidation(value),
                                  text: 'Adult Price',
                                  hintText: 'enter adult price',
                                  controller:
                                      addRoomController.adultPriceController,
                                  textFieldSizeCheck: true,
                                  heightMedia: heightMedia,
                                  widthMedia: widthMedia,
                                ),
                              ]),
                              SizedBox(height: heightMedia * 0.01),
                              Row(children: [
                                TextFeildAddRoomWidget(
                                  keyboardType: true,
                                  validationFunction: (value) =>
                                      addRoomController
                                          .textFieldValidation(value),
                                  text: 'Total Room Price',
                                  hintText: 'enter room price',
                                  controller: addRoomController
                                      .totalRoomPriceController,
                                  textFieldSizeCheck: true,
                                  heightMedia: heightMedia,
                                  widthMedia: widthMedia,
                                ),
                                SizedBox(width: widthMedia * 0.066),
                                TextFeildAddRoomWidget(
                                  keyboardType: true,
                                  validationFunction: (value) =>
                                      addRoomController
                                          .textFieldValidation(value),
                                  text: 'Capacity',
                                  hintText: 'enter total capacity',
                                  controller:
                                      addRoomController.capacityController,
                                  textFieldSizeCheck: true,
                                  heightMedia: heightMedia,
                                  widthMedia: widthMedia,
                                ),
                              ]),
                              SizedBox(height: heightMedia * 0.01),
                              TextFeildAddRoomWidget(
                                validationFunction: (value) => addRoomController
                                    .textFieldValidation(value),
                                text: 'Property Address',
                                hintText: 'enter your property address',
                                controller:
                                    addRoomController.propertyAddressController,
                                heightMedia: heightMedia,
                                widthMedia: widthMedia,
                              ),
                              SizedBox(height: heightMedia * 0.01),
                              Row(children: [
                                TextFeildAddRoomWidget(
                                  validationFunction: (value) =>
                                      addRoomController
                                          .textFieldValidation(value),
                                  text: 'City',
                                  hintText: 'enter your city',
                                  controller: addRoomController.cityController,
                                  textFieldSizeCheck: true,
                                  heightMedia: heightMedia,
                                  widthMedia: widthMedia,
                                ),
                                SizedBox(width: widthMedia * 0.066),
                                DropDownButton(
                                  addRoomController: addRoomController,
                                  heightMedia: heightMedia,
                                  widthMedia: widthMedia,
                                  text: 'State',
                                  hintText: 'Select State',
                                  textButtonCheck: true,
                                )
                              ]),
                              SizedBox(height: heightMedia * 0.01),
                              Row(children: [
                                TextFeildAddRoomWidget(
                                  keyboardType: true,
                                  validationFunction: (value) =>
                                      addRoomController
                                          .textFieldValidation(value),
                                  text: 'Pin code',
                                  hintText: 'enter your pin code',
                                  controller:
                                      addRoomController.pinCodeController,
                                  textFieldSizeCheck: true,
                                  heightMedia: heightMedia,
                                  widthMedia: widthMedia,
                                ),
                                SizedBox(width: widthMedia * 0.066),
                                DropDownButton(
                                  addRoomController: addRoomController,
                                  heightMedia: heightMedia,
                                  widthMedia: widthMedia,
                                  text: 'Choose Category',
                                  hintText: 'Select Type',
                                )
                              ]),
                              const SizedBox(height: 14),
                              Text('Room Amenities',
                                  style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ))),
                              const SizedBox(height: 10),
                              CheckBoxWidget(
                                  addRoomController: addRoomController),
                              const SizedBox(height: 10),
                              TextFeildAddRoomWidget(
                                validationFunction: (value) => addRoomController
                                    .textFieldValidation(value),
                                controller:
                                    addRoomController.descriptionController,
                                heightMedia: heightMedia,
                                hintText: 'Enter your room description',
                                text: 'Room Description',
                                widthMedia: widthMedia,
                                descriptionSizeCheck: true,
                              ),
                              const SizedBox(height: 10),
                              Text('Select Your Location',
                                  style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                          color: Colors.black, fontSize: 12))),
                              const SizedBox(height: 10),
                              const MapWidget(),
                              const SizedBox(height: 20),
                              editCheck
                                  ? LoginSignButton(
                                      loadingCheck:
                                          addRoomController.loadingCheck,
                                      onpressFunction: () => addRoomController
                                          .addEditRoomButtonFunction(data),
                                      text: 'Update',
                                      colorCheck: true)
                                  : LoginSignButton(
                                      loadingCheck:
                                          addRoomController.loadingCheck,
                                      onpressFunction: () => addRoomController
                                          .addEditRoomButtonFunction(data),
                                      text: 'Submit',
                                      colorCheck: true),
                              const SizedBox(height: 40),
                            ]))))));
  }
}
