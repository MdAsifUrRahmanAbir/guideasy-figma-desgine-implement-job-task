import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomList extends StatelessWidget {
  String? url;
  String? title;
  String? subtitle;
  String? time;
   CustomList({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.url,
    required this.time
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        children: [
          const SizedBox(width: 17,),
          Image.asset(url!),
          const SizedBox(width: 17,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title!,textAlign: TextAlign.left,
                style: GoogleFonts.roboto(color: const Color(0xff01120E), fontWeight: FontWeight.w500, fontSize: 14),),
              Text(subtitle!,textAlign: TextAlign.left,
                style: GoogleFonts.roboto(color: const Color(0xff868E96), fontWeight: FontWeight.w400, fontSize: 12),),
            ],
          ),
          const Spacer(),
          Text(time!,textAlign: TextAlign.left,
            style: GoogleFonts.roboto(color: const Color(0xff01120E), fontWeight: FontWeight.w400, fontSize: 10),),
          const SizedBox(width: 20,),
        ],
      ),
    );
  }
}
