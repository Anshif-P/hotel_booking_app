import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentAddedRoomWidget extends StatelessWidget {
  final double widthMedia;
  final double heightMedia;
  const RecentAddedRoomWidget({
    super.key,
    required this.heightMedia,
    required this.widthMedia,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: heightMedia * 0.0127,
              // height: 10,
            ),
            Text(
              'Recent added rooms',
              style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              )),
            ),
            SizedBox(
              height: heightMedia * 0.0127,
              // height: 10,
            ),
            SizedBox(
              // height: 178,
              height: heightMedia * 0.195,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            // color: Colors.yellow,
                            width: heightMedia * 0.217,
                            height: heightMedia * 0.139,
                            // width: 171,
                            // height: 110,
                            child: Image.asset(
                              'lib/image/Rectangle 3820.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: heightMedia * 0.0127,
                            // height: 10,
                          ),
                          Text(
                            'Greeny Hotel',
                            style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            )),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Color(0xFFCB102F),
                                size: 17,
                              ),
                              Text(
                                'Kerala , India',
                                style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                  color: Color(0xFFA19B9B),
                                  fontSize: 14,
                                )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
