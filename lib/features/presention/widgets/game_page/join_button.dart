import 'package:flutter/material.dart';
import 'package:football/constants/app_text_style.dart';
import 'package:football/features/data/model/game_model.dart';
import 'package:football/features/presention/pages/game_detail.dart';



class JoinButton extends StatelessWidget {
  const JoinButton({
    super.key, required this.game, required this.formattedDate,
  });
final Game game;
 final String formattedDate;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> GameDetail(game: game,)));
      }, 
    style:ElevatedButton.styleFrom(
      backgroundColor: Colors.grey[400],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9),
        ),
      ),child:Text('Присоединиться', style: AppTextStyle.joinButtonText),
    );
  }
}