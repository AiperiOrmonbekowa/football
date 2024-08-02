import 'package:flutter/material.dart';
import 'package:football/features/presention/widgets/app_bar_widget.dart';

class GameDetail extends StatelessWidget {
 const GameDetail({super.key,});
// экинчи бетке апи алып отуу
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:AppBarWidget(icon:Icons.arrow_back_ios , text: 'Детали игры',onTap: (){
          Navigator.pop(context);
        },),),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
         height: 300,
         width: 480,
         decoration: BoxDecoration(
          color: const Color(0xFFF0F0F0),
          borderRadius: BorderRadius.circular(10)
         ),
         child: const Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
             Row(
             mainAxisAlignment: MainAxisAlignment.center, 
              children: [
            Icon(Icons.account_balance_wallet, color: Color(0xFF0A9829),),
                Text('Cash Game', style:TextStyle(fontSize: 13, color: Color(0xFF0A9829)),
                ),
           ],
           ),
           Text('Заголовок', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
           
         ],),
        ),
      )
    );
  }
}