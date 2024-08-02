import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/constants/api/api_const.dart';
import 'package:football/constants/color/app_colors.dart';
import 'package:football/features/data/model/game_model.dart';
import 'package:football/features/presention/widgets/game_container.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'join_button.dart';

class ListViewWidget extends StatefulWidget {
  const ListViewWidget({
    super.key,
  });

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
late Future<List<Game>> _futureGames;
double _currentSlidervalue = 12;
  @override
  void initState() {
    super.initState();
    _futureGames = fetchGames();
  }

  Future<List<Game>> fetchGames() async {
    final dio = Dio();
    final response = await dio.get(ApiConst.adress); 

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
  Column(children: [
                   ListView.builder(
                     scrollDirection: Axis.vertical,
         shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                     itemBuilder: (context, index) {
                       final game = snapshot.data![index];
                      final formattedDate = DateFormat('dd-MM-yyyy  kk:mm').format(game.startDate);
                       return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                         child: Container(
                           height: 230,
                           width: 90,
                           decoration: BoxDecoration( image: DecorationImage( image: AssetImage(game.image??'assets/images/grass_field.jpg',),
                           ),
                           borderRadius:const BorderRadius.all( Radius.circular(50),
                           ),
                            ),
                           margin:const EdgeInsets.all(8.0),
                           child: Stack(children: [
                            GameContainer(formattedDate: formattedDate, game: game),
                           const Positioned(
                              right: 95,
                              top: 105,
                              child: Text('1340.4 км', style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w900),),
                              ),
                           Positioned(
                               top: 128,
                               left: 90,
                              child: Row(children: [
                              Image.asset(game.image??'assets/images/image.png'),
                             const Gap(7),
                              Column(children: [
                            Text(game.organizer.name, style: GoogleFonts.ubuntu(fontSize: 16, color: AppColors.white),),
                            const Text('организатор', style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w100),),
                              ],),
                            const  Gap(30),
                          const  JoinButton()
                            ],
                            ),
                            ),
                            Positioned(
                              bottom: 5,
                              left: 65,
                              child: Row(children: [
                                   SizedBox(
                                            width: 310,
                                            child: Slider(divisions: 12,
                                            label: _currentSlidervalue.round().toString(),
                                              activeColor: AppColors.white,
                                              thumbColor: Colors.white, 
                                              max: 12,
                                              value: _currentSlidervalue,
                                              onChanged: (double value){
                              setState(() {
                                _currentSlidervalue = value;
                              });
                                              },
                                            ),
                              ),
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                       SizedBox(
                                        height: 25,
                                        child: SvgPicture.asset('icons/shirtIcon.svg',),
                                        ),
                                        Text('$_currentSlidervalue', style: const TextStyle(color: AppColors.white,fontWeight: FontWeight.bold, fontSize: 15),
                                                   ),
                                          ],
                                          ),
                              
                              ],),
                            ),
                       
                           ],
                           ),
                         ),
                       );
                     },
                   ),
                 ],
               );
          }
        },
        );
  }
}



