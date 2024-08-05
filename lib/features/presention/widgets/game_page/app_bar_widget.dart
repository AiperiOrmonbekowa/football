import 'package:flutter/material.dart';
import 'package:football/constants/app_text_style.dart';
import 'package:gap/gap.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key, required this.icon, required this.text, this.onTap,
  });
   final IconData icon;
   final String text;
   final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      GestureDetector(
        onTap: onTap,
        child: Icon(icon),
        ),
      const Gap(10),
       Text( text, style: AppTextStyle.appBarText)
      ],
    );
  }
}


