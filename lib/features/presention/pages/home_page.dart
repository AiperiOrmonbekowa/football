import 'package:flutter/material.dart';
import 'package:football/features/presention/pages/game_page.dart';
import 'package:football/features/presention/widgets/game/category_widget.dart';
import 'package:gap/gap.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      Container(
     height: 55,
      width: double.infinity,
    margin: const EdgeInsets.symmetric(vertical: 20),
    color:const Color(0xFFF0F0F0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Category(text: 'Карта',icon: Icons.map, onTap: (){},),
      const  Gap(40),
        Category(text: 'Сортировка',icon: Icons.filter_list, onTap: (){
     },
     ),
        const Gap(40),
        Category(text: 'Фильтр',icon: Icons.filter_alt, onTap: (){},),
      ],
    ),
      ),
     
  const  Padding(
       padding: EdgeInsets.symmetric(horizontal: 30),
       child:  Row(
       children: [
        Text('все'),
        Gap(20),
         Text('рядом'),
           ],
           ),
     ),
     const GamePage()
      ],
     );
 }
}


