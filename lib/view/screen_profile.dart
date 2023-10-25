import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/constance/colors.dart';
import 'package:hotel_booking_app/widgets/comman/button_text.dart';

import '../widgets/profile_widgets/listtile_widget.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    double heightMidia = MediaQuery.sizeOf(context).height;
    double widhtMidia = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: heightMidia * 0.28,
            width: double.infinity,
            color: Colors.white,
            child: Stack(
              children: [
                Positioned(
                  bottom: heightMidia * 0.1,
                  right: 0,
                  left: 0,
                  child: Container(
                    //  color: Colors.red,
                    height: heightMidia * 0.12,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'lib/image/profile_background_img.png'),
                            fit: BoxFit.fill)),
                  ),
                ),
                Positioned(
                  bottom: heightMidia * 0.04,
                  left: widhtMidia * 0.07,
                  // width: 100,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(7)),
                    width: widhtMidia * 0.25,
                    height: heightMidia * 0.115,
                  ),
                ),
                Positioned(
                    bottom: heightMidia * 0.04,
                    left: widhtMidia * 0.37,
                    child: SizedBox(
                      width: widhtMidia * 0.4,
                      height: heightMidia * 0.038,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor: MaterialStateProperty.all(
                                  CustomColors.mainColor)),
                          child: ButtonTextCommanWidget(text: 'Edit Profile')),
                    )),
                Positioned(
                    bottom: heightMidia * 0.0,
                    right: 0,
                    left: 0,
                    child: Container(
                      height: heightMidia * 0.02,
                      color: CustomColors.extraLightGrey,
                    )),
              ],
            ),
          ),
          ProfileListTileWidget(),
        ],
      ),
    );
  }
}
