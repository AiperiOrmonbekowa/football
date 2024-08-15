import 'package:flutter/material.dart';
import 'package:football/utils/show_diolog.dart';
import 'package:football/constants/static/app_colors.dart';
import 'package:football/constants/static/app_text_style.dart';

class ButtonDetail extends StatefulWidget {
  const ButtonDetail({
    super.key,
  });

  @override
  State<ButtonDetail> createState() => _ButtonDetailState();
}

class _ButtonDetailState extends State<ButtonDetail> {
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 40,
      child: ElevatedButton(
       style: ElevatedButton.styleFrom(backgroundColor: AppColors.green, shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9),
              ), 
              ),
        onPressed:(){
         showMyDialog(context) ;
        },
        child: Text('Присоединиться', style:AppTextStyle.organizerName ,),
      ),
    );
  }
}
