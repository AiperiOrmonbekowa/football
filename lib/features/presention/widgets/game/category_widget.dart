
import 'package:flutter/material.dart';
import 'package:football/constants/static/app_text_style.dart';

class Category extends StatelessWidget {
  const Category({
    super.key, required this.text, required this.icon, required this.onTap
  });
  final String text;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(children: [
       Text(text, style:AppTextStyle.categoryText), 
       Icon(icon), 
      ],),
    );
  }
}