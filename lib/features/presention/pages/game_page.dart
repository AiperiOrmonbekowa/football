import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/constants/static/app_colors.dart';
import 'package:football/constants/static/app_text_style.dart';
import 'package:football/features/data/model/game/game_model.dart';
import 'package:football/features/data/service/game/game_service.dart';
import 'package:football/features/presention/widgets/game/game_container.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import '../widgets/game/join_button.dart';

class GamePage extends StatefulWidget {
  const GamePage({
    super.key,
  });
  @override
  State<GamePage> createState() => _GamePageState();
}

 class _GamePageState extends State<GamePage> {

 GameService? gameService;
    final Location location = Location();

  @override
  void initState() {
    super.initState();
   gameService = GameService();
  }

  @override
  Widget build(BuildContext context) {
  return FutureBuilder<List<Game>>(
        future: gameService?.fetchGames(),
        builder: (context, snapshot) {
           if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
        else  if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'),);
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
                          double? currentSlidervalue = game.existingPlayerCount.toDouble();
                      final formattedDate = DateFormat('dd-MM-yyyy  kk:mm').format(game.startDate);
                       return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                         child: Container(
                           height: 230,
                           width: 90,
                           decoration: BoxDecoration( image: DecorationImage( image: AssetImage(game.image??'assets/images/grass_field.jpg',),
                           ),
                      borderRadius: BorderRadius.circular(20)
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
                            Positioned(
                              right: 80,
                              top: 100,
                              child: Text('${game.distanceFromUser} км', style: AppTextStyle.km),
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
                              ],
                              ),
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
                                            label: currentSlidervalue.round().toString(),
                                              activeColor: AppColors.white,
                                              thumbColor: Colors.white, 
                                              max: game.maxPlayer.toDouble(),
                                              value: currentSlidervalue,
                                              onChanged: (double value){
                              currentSlidervalue =value;
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
                                        Text(game.maxPlayer.toString(), style: AppTextStyle.sliderValue),
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





