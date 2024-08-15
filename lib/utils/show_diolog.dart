  import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/constants/static/app_colors.dart';
import 'package:football/constants/static/app_text_style.dart';
import 'package:gap/gap.dart';

Future<void> showMyDialog(BuildContext context) async {
  
    return showDialog<void>(
      context: context,
      barrierDismissible: false, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: SvgPicture.asset('assets/icons/showIcon.svg'),
          ),
        content:  SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Column(children: [
            const Text(
              textAlign: TextAlign.center,
              'Ваш запрос успешно\n отправлен', style: AppTextStyle.zagalovok,),
             const Gap(10),
               SizedBox(
              height: 35,
              width: 235,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.green, shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ), 
                ),
                child: Text('OK', style: AppTextStyle.joinButtonText,),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
              ],)
 ],
          ),
        ));
        
      },
    );
  }