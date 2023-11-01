import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AmentiesWidget extends StatelessWidget {
  Map itemsIcon = {
    'Wifi': Icon(Icons.wifi),
    'Restaurant': Icon(Icons.hot_tub_outlined),
    'Ac': Icon(Icons.ac_unit_outlined),
    'Power backup': Icon(Icons.power),
    'Fitness Center': Icon(Icons.fitness_center),
    'Tv': Icon(Icons.tv_rounded),
    'Swimming Pool': Icon(Icons.pool),
    'Meeting Room': Icon(Icons.meeting_room_outlined),
    'Elevator': Icon(Icons.elevator_outlined)
  };
  List? itemsName;
  AmentiesWidget({super.key, required this.itemsName});
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(0),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, crossAxisSpacing: 10, childAspectRatio: 1.3),
      itemCount: itemsName!.length,
      itemBuilder: (context, index) {
        print(itemsName![index]);
        print(itemsIcon[itemsName![index]]);
        return Container(
          //   color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              itemsIcon[itemsName![index]],
              Text(
                itemsName![index],
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    textStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                )),
              ),
            ],
          ),
        );
      },
    );
  }
}
