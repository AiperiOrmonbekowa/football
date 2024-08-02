import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:football/features/data/model/game_model.dart';
import 'package:intl/intl.dart';

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
    final response = await dio.get('https://odigital.pro/football_fields_api/games/'); // Replace with your API endpoint

    if (response.statusCode == 200) {
      List<dynamic> data = response.data['results'];
      return data.map((game) => Game.fromJson(game)).toList();
    } else {
      throw Exception('Failed to load games');
    }
  }

 @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Game>>(
        future: _futureGames,
        builder: (context, snapshot) {
           if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
      else  if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('error'),
            );
          } else {
            return
  SingleChildScrollView(

    child: Column(children: [
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
                        decoration: BoxDecoration(image: DecorationImage(image: AssetImage(game.image??'assets/images/grass_field.jpg',),),borderRadius:BorderRadius.circular(20) ),
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
                                // ignore: unnecessary_string_interpolations
                                children: [Text('$formattedDate'),
                                Row(children: [
                                 const Icon(Icons.account_balance_wallet),
                                     Text('Cash Game ${game.contribution.toString()} cом', style:const TextStyle(fontSize: 13),)
                                ],),
                                                         ],
                                                         ),
                            ),
                            ),
                         ),

                        ],
                        ),
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