import 'package:flutter/material.dart';
import 'package:football/features/presention/pages/game_page.dart';
import 'package:football/features/presention/widgets/game_page/app_bar_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 4,initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
      title: const AppBarWidget(icon: Icons.arrow_back_ios,text: 'Игры',),
      bottom: const TabBar(tabs: [
        Tab(text: 'Футбольные поля',),
        Tab(text: 'Игры',),
        Tab(text: 'Турниры',),
        Tab(text: 'Игроки ',),
      ],
      ),
        ),
       body: const TabBarView(children:[ 
           Text('Футбольные поля'),
             GamePage(),
             Text('Турниры'),
             Text('Игроки'),
       ],
       ),
     ),
    );
  }
}

