import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:football/features/data/model/game_model.dart';
import 'package:football/features/presention/widgets/row_widget.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

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


class ListViewWidget extends StatefulWidget {
  const ListViewWidget({
    super.key,
  });

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
    late Future<List<Game>> _futureGames;

  @override
  void initState() {
    super.initState();
    _futureGames = fetchGames();
  }
    Future<List<Game>> fetchGames() async {
    final dio = Dio();
    final response = await dio.get('https://odigital.pro/football_fields_api/games/'); 

    if (response.statusCode == 200) {
      List<dynamic> data = response.data['results'];
      return data.map((game) =>Game.fromJson(game)).toList();
    } else {
      throw Exception('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Game>>(
        future: _futureGames,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('error'));
          } else {
            return
            
  SingleChildScrollView(
    child: Column(
      
                children: [
                  ListView.builder(
                    scrollDirection: Axis.vertical,
        shrinkWrap: true,
                    
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final game = snapshot.data![index];
                       final formattedDate = DateFormat('dd-MM-yyyy  kk:mm').format(game.startDate);
                      return Container(
                        height: 230,
                        width: 70,
                        decoration: BoxDecoration(
                          
                          image: DecorationImage(image: AssetImage(game.image??'assets/images/grass_field.jpg',),),borderRadius:BorderRadius.circular(20) ),
                        margin:const EdgeInsets.all(8.0),
                        child: Stack(children: [
                         Positioned(
                          top: 15,
                          left: 10,
                           child: Container(
                            height: 60,
                            width: 187,
                            decoration: BoxDecoration(borderRadius:const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                              color: Colors.grey[400],
                               ),
                            child:  Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                              child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                                children: [Text('$formattedDate'),
                                Row(children: [
                                 const Icon(Icons.account_balance_wallet),
                                     Text('Cash Game ${game.contribution.toString()} cом', style: TextStyle(fontSize: 13),)
                                ],),
                           
                                                         ],),
                            ),),
                         ),

                        ],)
                      );
                    },
                  ),
                ],
              ),
  );
          }
        },
      
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