import 'package:flutter/material.dart';
import 'package:football/features/data/model/game_model.dart';

class GameContainer extends StatelessWidget {
  const GameContainer({
    super.key,
    required this.formattedDate,
    required this.game,
  });

  final String formattedDate;
  final Game game;

  @override
  Widget build(BuildContext context) {
    return Positioned(
     top: 15,
     left: 74,
      child: Container(
       height: 50,
       width: 187,
       decoration: BoxDecoration(borderRadius:const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
         color: Colors.grey[400],
          ),
       child:  Padding(
         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children: [
            Text('$formattedDate'),
           Row(children: [
            const Icon(Icons.account_balance_wallet),
                Text('Cash Game ${game.contribution.toString()} cом', style:const TextStyle(fontSize: 13),
                ),
           ],
           ),
                                    ],
                                    ),
    
       ),
       ),
    );
  }
}