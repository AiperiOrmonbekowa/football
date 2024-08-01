import 'package:flutter/material.dart';
import 'package:football/features/presention/widgets/game_page.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 4,initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
      title: Row(
        children: [
        const Icon(Icons.arrow_back_ios),
        const Gap(10),
         Text('Игры', style: GoogleFonts.ubuntu(fontWeight: FontWeight.w700, fontSize: 24),)
        ],
      ),
      bottom: const TabBar(tabs: [
        Tab(text: 'Игры',),
        Tab(text: 'Футбольные поля',),
        Tab(text: 'Турниры',),
        Tab(text: 'Игроки ',),
        
      ]),
        ),
       body: const TabBarView(children:[ 
      Card(child: GamePage()),
        Card(child:Text('Футбольные поля'),),
          Card(child: Text('Турниры'),),
          Card(child: Text('Игроки '),),
        
       ])
       
      
      ),
    );
  }
}


