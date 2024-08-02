import 'package:flutter/material.dart';
import 'package:football/features/presention/widgets/list_view_widget.dart';
import 'package:football/features/presention/widgets/row_widget.dart';
import 'package:gap/gap.dart';

class GamePage extends StatelessWidget {
  const GamePage({
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
        RowWidget(text: 'Карта',icon: Icons.map, onTap: (){},),
      const  Gap(40),
        RowWidget(text: 'Сортировка',icon: Icons.filter_list, onTap: (){
    showMyDialog(context);
        },),
        const Gap(40),
        RowWidget(text: 'Фильтр',icon: Icons.filter_alt, onTap: (){},),
      ],
    ),
      ),
     
  const  Padding(
       padding: EdgeInsets.symmetric(horizontal: 17),
       child:  Row(
       children: [
        Text('все'),
        Gap(20),
         Text('рядом'),
           ],
           ),
     ),
    
     const ListViewWidget()
      ],
     );
     
  }
}




//sortirovka
  Future<void> showMyDialog(BuildContext context) async {
  
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // User must tap button to dismiss
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Dialog Title'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a simple dialog.'),
                Text('It can have multiple lines of content.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child:const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }