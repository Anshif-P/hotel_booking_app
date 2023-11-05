import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/constance/colors.dart';
import '../widgets/comman/heading_text.dart';

class VendorAppInfoPage extends StatelessWidget {
  VendorAppInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    double heightMdida = MediaQuery.sizeOf(context).height;
    double widthMdida = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Container(
        color: CustomColors.extraLightGrey,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: heightMdida * 0.04,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              size: 25,
                            )),
                        SizedBox(
                          width: widthMdida * 0.04,
                        ),
                        HeadingTextWidget(text: 'Coupons'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: heightMdida * 0.015,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to the Vendor App!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Instructions for Adding Rooms:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '1. Log in with your vendor credentials.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '2. Navigate to the "Add Rooms" section in the app.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '3. Fill in the details of the room you want to add, including room type, price, capacity, and amenities.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '4. Upload images of the room for better visibility.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '5. Ensure that you provide accurate location details for your property.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '6. Review the information and click "Submit" to add the room to our platform.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Tips for Success:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '- High-quality images and detailed descriptions can attract more guests.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '- Keep your room information up-to-date to avoid any inconvenience to guests.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '- Ensure that you follow our guidelines and maintain a high level of service quality.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
