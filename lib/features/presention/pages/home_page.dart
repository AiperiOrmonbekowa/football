import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/constants/api/api_const.dart';
import 'package:football/constants/app_colors.dart';
import 'package:football/constants/app_text_style.dart';
import 'package:football/features/data/model/game_model.dart';
import 'package:football/features/presention/widgets/game_page/game_container.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import '../widgets/game_page/join_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });
  
  
  @override
  State<HomePage> createState() => _HomePageState();
}

 class _HomePageState extends State<HomePage> {
 double _currentSlidervalue = 12;
 late Future<List<Game>> _futureGames;

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
                           borderRadius:const BorderRadius.all( Radius.circular(10),
                           ),
                           ),
                           margin:const EdgeInsets.all(8.0),
                           child: Stack(children: [
                            GameContainer(formattedDate: formattedDate, game: game),
                            Positioned(
                              top: 30,
                              right: 45,
                              // ignore: deprecated_member_use
                              child: SvgPicture.asset('assets/icons/vector.svg', color: AppColors.white, width: 30,),
                              ),
                           const Positioned(
                              right: 125,
                              top: 100,
                              child: Text('1340.4 км', style: AppTextStyle.km),
                              ),
                           Positioned(
                               top: 110,
                               left: 25,
                            child: Row(children: [
                             SizedBox(
                             height: 77,
                              child: Image.asset(game.image??'assets/images/imageGirl.png', )),
                             Column(children: [
                            Text(game.organizer.name, style: AppTextStyle.organizerName),
                        Text('организатор', style: AppTextStyle.organizatorHome),
                              ],),
                            const  Gap(30),
                          JoinButton(game: game,formattedDate: formattedDate,)
                            ],
                            ),
                            ),
                            Positioned(
                              bottom: 7,
                              left: 13,
                              child: Row(children: [
                                   SizedBox(
                                            width: 315,
                                            child: Slider(divisions: 12,
                                            label: _currentSlidervalue.round().toString(),
                                              activeColor: AppColors.white,
                                              thumbColor: Colors.white, 
                                              max: 12,
                                              value: _currentSlidervalue,
                                              onChanged: (double value){
                              setState(() {
                                _currentSlidervalue =value;
                              },
                              );
                                              },
                                            ),
                              ),
                             Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                                 SizedBox(
                                        height: 23,
                                       child: SvgPicture.asset('assets/icons/shirtIcon.svg')
                                        ),
                                        Text('$_currentSlidervalue', style: AppTextStyle.sliderValue),
                                          ],
                                          ),
                              
                              ],
                              ),
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



