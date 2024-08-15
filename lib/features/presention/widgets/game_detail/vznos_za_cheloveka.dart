import 'package:flutter/material.dart';
import 'package:football/constants/static/app_text_style.dart';

class VznosZaCheloveka extends StatelessWidget {
  const VznosZaCheloveka({
    super.key, required this.text1, required this.text2,
  });
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text(text1), Text(text2,style:AppTextStyle.vznos),
                    ],
                    );
  }
}