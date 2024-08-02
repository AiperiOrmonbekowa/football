import 'package:flutter/material.dart';
import 'package:football/constants/color/app_colors.dart';
import 'package:go_router/go_router.dart';

class JoinButton extends StatelessWidget {
  const JoinButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        context.go('/gameDetail');
      }, 
    style:ElevatedButton.styleFrom(
      backgroundColor: Colors.grey[400],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9),
        ),
      ),child: const Text('Присоединиться', style: TextStyle(color: AppColors.white),),
    );
  }
}