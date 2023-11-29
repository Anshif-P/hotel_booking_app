import 'dart:convert';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hotel_booking_app/service/api_service.dart';
import 'package:hotel_booking_app/view_model/map_controller.dart';

import 'package:hotel_booking_app/view_model/vendor_controller.dart';
import 'package:image_picker/image_picker.dart';
import '../model/get_rooms_model.dart';

class AddRoomController extends GetxController {
  AddRoomController({this.roomObjForEdit});
  VendorRoomModel? roomObjForEdit;
  MapBoxController mapBoxController = Get.find<MapBoxController>();

  @override
  void onReady() {
    super.onReady();
    if (roomObjForEdit != null) {
      propertyTypeController.text = roomObjForEdit!.propertyType!;
      totalRoomController.text = roomObjForEdit!.totalRoom!;
      singleRoomPriceController.text = roomObjForEdit!.totalRoom!;
      adultPriceController.text = roomObjForEdit!.adultRate!;
      totalRoomPriceController.text = roomObjForEdit!.price!;
      capacityController.text = roomObjForEdit!.capacity!;
      propertyAddressController.text = roomObjForEdit!.address!;
      cityController.text = roomObjForEdit!.city!;
      selectedState.value = roomObjForEdit!.state!;
      pinCodeController.text = roomObjForEdit!.zip!;
      selectedType.value = roomObjForEdit!.category!;
      descriptionController.text = roomObjForEdit!.description!;
      amenitiesList = roomObjForEdit!.amenities!;
      addSelectedAmentiesForEdit();
      editCheck = true.obs;
      update();
    }
  }

  TextEditingController propertyTypeController = TextEditingController();
  TextEditingController totalRoomController = TextEditingController();
  TextEditingController singleRoomPriceController = TextEditingController();
  TextEditingController adultPriceController = TextEditingController();
  TextEditingController totalRoomPriceController = TextEditingController();
  TextEditingController capacityController = TextEditingController();
  TextEditingController propertyAddressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  List<dynamic>? amenitiesList;
  bool navigationCheck = false;
  final GlobalKey<FormState> addRoomFormKey = GlobalKey<FormState>();
  Api apiObj = Api();
  RxBool editCheck = false.obs;
  final VendorController vendorController = Get.find<VendorController>();

  RxBool loadingCheck = false.obs;
  Rx<String> selectedState = 'Kerala'.obs;
  Rx<String> selectedType = 'Deluxe'.obs;

  //------------ Amenitis Section -----------//
  List items = [
    'Wifi',
    'Restaurant',
    'Ac',
    'Power backup',
    'Fitness Center',
    'Tv',
    'Swimming Pool',
    'Meeting Room',
    'Elevator'
  ];

  var boolValues = List.generate(9, (index) => false.obs);
  RxMap<String, bool> amentiesMap = RxMap<String, bool>({
    'Wifi': false,
    'Restaurant': false,
    'Ac': false,
    'Power backup': false,
    'Fitness Center': false,
    'Tv': false,
    'Swimming Pool': false,
    'Meeting Room': false,
    'Elevator': false,
  });

  addSelectedAmentiesForEdit() {
    if (amenitiesList != null) {
      for (var element in amenitiesList!) {
        if (amentiesMap.containsKey(element)) {
          amentiesMap[element] = true;
        }
      }
      update();
    } else {}
  }

  List<String>? getSelectedAmenties() {
    List<String>? amenitiesList = [];

    amentiesMap.forEach((key, value) {
      if (value) {
        amenitiesList.add(key);
      }
    });

    return amenitiesList;
  }

  //--------- End -------------//

  //---------- Image Section ----------//

  File? image1;
  File? image2;
  File? image3;
  File? image4;
  // ignore: prefer_typing_uninitialized_variables
  var imageTemp;

  //--------implement image add function for edit------------------//

  Future pickImage(File? image, int caseNo) async {
    imageTemp = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageTemp?.path != null) {
      try {
        switch (caseNo) {
          case (1):
            {
              image1 = File(imageTemp!.path);
              update();
              break;
            }
          case (2):
            {
              image2 = File(imageTemp!.path);
              break;
            }
          case (3):
            {
              image3 = File(imageTemp!.path);
              break;
            }
          case (4):
            {
              image4 = File(imageTemp!.path);
              break;
            }
        }
      } catch (e) {
        return null;
      }
      update();
    } else {}
  }

  Future getImageUrlFromFirebase(List? imagesList, image) async {
    List firebaseImageUrlsList = List.generate(4, (index) => '');
    String? imageFirebaseUrl;
    //late List firebaseImageUrlsList;
    if (editCheck.value != true) {
      for (int i = 0; i < 4; i++) {
        String uniqueName = DateTime.now().millisecond.toString();
        Reference fireBaseRootReference = FirebaseStorage.instance.ref();
        Reference toUploadImgReference =
            fireBaseRootReference.child('myPictures$uniqueName.png');
        try {
          await toUploadImgReference.putFile(File(imagesList![i]));
          firebaseImageUrlsList[i] =
              await toUploadImgReference.getDownloadURL();
        } catch (e) {
          return null;
        }
      }
      return firebaseImageUrlsList;
    } else {
      String uniqueName = DateTime.now().millisecond.toString();
      Reference fireBaseRootReference = FirebaseStorage.instance.ref();
      Reference toUploadImgReference =
          fireBaseRootReference.child('myPictures$uniqueName.png');
      try {
        await toUploadImgReference.putFile(File(image));
        imageFirebaseUrl = await toUploadImgReference.getDownloadURL();
        return imageFirebaseUrl;
      } catch (e) {
        return null;
      }
    }
  }

  //------------Edit fnc for replace old object form the roomobjList -------------//

  Future<VendorRoomModel> createNewEditedObj(
      VendorRoomModel data, List<dynamic> amenitiesList, List imageList) async {
    final VendorRoomModel vendorRoomObj = VendorRoomModel(
      totalRoom: totalRoomController.text,
      id: data.id,
      isApproved: data.isApproved,
      propertyType: propertyTypeController.text,
      price: totalRoomPriceController.text,
      adultRate: adultPriceController.text,
      capacity: capacityController.text,
      address: propertyAddressController.text,
      city: cityController.text,
      state: stateController.text,
      zip: pinCodeController.text,
      description: descriptionController.text,
      amenities: amenitiesList,
      imageList: imageList,
      category: selectedType.value.toString(),
      location: selectedState.value.toString(),
    );
    return vendorRoomObj;
  }

  //-----------image section ended------------//
  //--------------Map box location empty validation -----------//
  bool mapLocationSelectedOrNotValidation() {
    print(mapBoxController.searchResults);
    print(mapBoxController.place.value);
    if (mapBoxController.place.value != '') {
      return true;
    } else {
      return false;
    }
  }

  //-----------TextField Validations-----------//
  textFieldValidation(value) {
    if (value != '') {
      return null;
    } else {
      return 'fill the field';
    }
  }

  bool imageValidation(VendorRoomModel? data) {
    if (editCheck.value != true &&
        image1 != null &&
        image2 != null &&
        image3 != null &&
        image4 != null) {
      return true;
    } else if (editCheck.value == true &&
        (image1 != null || data!.imageList![0] != null) &&
        (image2 != null || data!.imageList![1] != null) &&
        (image3 != null || data!.imageList![2] != null) &&
        (image4 != null || data!.imageList![3] != null)) {
      return true;
    } else {
      return false;
    }
  }

  //----------- Passing detailse ------------//

  addEditRoomButtonFunction(VendorRoomModel? data) async {
    loadingCheck.value = true;

    amenitiesList = getSelectedAmenties();
    List<dynamic> imageList = [
      image1?.path,
      image2?.path,
      image3?.path,
      image4?.path
    ];

    bool imageCheck = imageValidation(data);
    bool mapLocationCheck = mapLocationSelectedOrNotValidation();
    try {
      if (mapLocationCheck &&
          imageCheck &&
          addRoomFormKey.currentState!.validate()) {
        if (editCheck.value) {
          for (int i = 0; i < 4; i++) {
            if (imageList[i] != null) {
              imageList[i] = await getImageUrlFromFirebase(null, imageList[i]);
            } else {
              imageList[i] = data!.imageList![i];
            }
          }
        } else if (image1?.path != null &&
            image2?.path != null &&
            image3?.path != null &&
            image4?.path != null) {
          imageList = await getImageUrlFromFirebase(
              [image1?.path, image2?.path, image3?.path, image4?.path], null);
        } else {
          Get.snackbar('Image Error', 'add all the images');
          loadingCheck.value = false;
        }
        Map<String, dynamic> roomDetails = {
          "property": propertyTypeController.text.trim(),
          "roomNo": totalRoomController.text.trim(),
          "price": totalRoomPriceController.text.trim(),
          "adultRate": adultPriceController.text.trim(),
          "OneRoom": singleRoomPriceController.text.trim(),
          "capacity": capacityController.text.trim(),
          "address": propertyAddressController.text.trim(),
          "city": cityController.text.trim(),
          "state": selectedState.value.toString(),
          "zip": pinCodeController.text.trim(),
          "description": descriptionController.text.trim(),
          "amenities": amenitiesList,
          "image": imageList,
          "category": selectedType.value.toString(),
          "location": mapBoxController.place.value,
          "longitude": mapBoxController.latlong.longitude,
          "latitude": mapBoxController.latlong.latitude
        };
        final response = editCheck.value
            ? await apiObj.updateRoom(roomDetails, roomObjForEdit!.id!)
            : await apiObj.addRoom(roomDetails);

        try {
          if (response.statusCode == 200) {
            final body = jsonDecode(response.body);
            if (body['status'] == 'success') {
              loadingCheck.value = false;
              if (editCheck.value) {
                final newRoomObj =
                    await createNewEditedObj(data!, amenitiesList!, imageList);
                await vendorController.changeVendorRoomAfterEditFnc(newRoomObj);
              }
              await vendorController.getVndorRooms();
              update();
              Get.back();
              editCheck.value
                  ? Get.snackbar(
                      'Success',
                      'Room Updated Successfuly',
                    )
                  : Get.snackbar(
                      'Success',
                      'Room Added Successfuly',
                    );

              editCheck.value = false;

              loadingCheck.value = false;

              onClose();
            } else {
              Get.snackbar(
                'Error Occure',
                'Check Your Details',
                backgroundColor: Colors.red,
              );
              loadingCheck.value = false;
            }
          } else {
            Get.snackbar(
              'Error Occure',
              'Somthing Went Wrong',
              backgroundColor: Colors.red,
            );
            loadingCheck.value = false;
          }
        } catch (e) {
          if (e is SocketException) {
            Get.snackbar(
              'NetWork Error',
              'Check Your Network',
              backgroundColor: Colors.red,
            );
            loadingCheck.value = false;
          }
        }
      } else {
        Get.snackbar('Error', 'Complete All Field',
            backgroundColor: Colors.red);

        loadingCheck.value = false;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  void onClose() async {
    // Dispose of resources, close streams, etc.

    await disposeController();

    addRoomFormKey.currentState?.reset();
    image1 = null;
    image2 = null;
    image3 = null;
    image4 = null;

    if (amenitiesList != null) {
      for (var element in amenitiesList!) {
        if (amentiesMap.containsKey(element)) {
          amentiesMap[element] = false;
        }
      }
      update();
    } else {}

    // Dispose of any other resources or streams here

    super.onClose();
  }

  Future disposeController() async {
    propertyTypeController.clear();
    totalRoomController.text = '';
    singleRoomPriceController.text = '';
    adultPriceController.text = '';
    totalRoomPriceController.text = '';
    capacityController.text = '';
    propertyAddressController.text = '';
    cityController.text = '';
    stateController.text = '';
    pinCodeController.text = '';
    categoryController.text = '';
    descriptionController.text = '';
  }

  //-----------------------------------------End----------------------------------------------//
}
