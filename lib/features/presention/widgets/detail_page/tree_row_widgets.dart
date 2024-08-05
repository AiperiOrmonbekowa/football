
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football/constants/app_text_style.dart';

class ThreeRowWidgets extends StatelessWidget {
  const ThreeRowWidgets({
    super.key, required this.icon, required this.text,
  });
   final String icon;
   final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
       children: [
     SvgPicture.asset(icon,width:30, ),
   Text(text,style:AppTextStyle.threeRowDetail),
    ],
    );
  }
}