import 'package:flutter/material.dart';
import 'package:hotel_booking_app/constance/colors.dart';

import '../widgets/drawer_widgets/drawer_dialog.dart';

class ScreenDrawer extends StatelessWidget {
  const ScreenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: 170,
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 25),
                Container(
                  width: 60,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                const SizedBox(width: 14),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Text(
                      'Anshif',
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
                    ),
                    Text(
                      'anshif@gmail.com',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0xFFB5B5B5),
                      ),
                    ),
                    SizedBox(height: 4),
                  ],
                ),
              ],
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.info_outline),
          title: Text('App info'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.lock),
          title: Text('Privacy & policy'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.question_mark),
          title: Text('Help'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.card_membership),
          title: Text('Add Coupons'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(
            Icons.logout,
            color: CustomColors.mainColor,
          ),
          title: Text(
            'Sign Out',
            style: TextStyle(color: CustomColors.mainColor),
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return LogoutDialog();
              },
            );
          },
        ), // ... Other list tiles ...
      ],
    );
  }
}
