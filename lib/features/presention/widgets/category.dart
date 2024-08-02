
import 'package:flutter/material.dart';

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
       Text(text, style:const TextStyle(color: Colors.black, fontSize: 15),), 
       Icon(icon), 
      ],),
    );
  }
}