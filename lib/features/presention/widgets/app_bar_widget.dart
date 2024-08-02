import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

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
        child: Icon(icon)),
      const Gap(10),
       Text( text, style: GoogleFonts.ubuntu(fontWeight: FontWeight.w700, fontSize: 24),)
      ],
    );
  }
}


