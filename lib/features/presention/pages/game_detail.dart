import 'package:flutter/material.dart';
import 'package:football/constants/static/app_text_style.dart';
import 'package:football/features/data/model/game/game_model.dart';
import 'package:football/features/data/service/game_detail/game_service_detail.dart';
import 'package:football/features/presention/widgets/game_detail/button_detail.dart';
import 'package:football/features/presention/widgets/game_detail/cash_game.dart';
import 'package:football/features/presention/widgets/game_detail/organization_row_detail.dart';
import 'package:football/features/presention/widgets/game_detail/tree_row_widgets.dart';
import 'package:football/features/presention/widgets/game_detail/vznos_za_cheloveka.dart';
import 'package:football/features/presention/widgets/game/app_bar_widget.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class GameDetailPage extends StatefulWidget {
  const GameDetailPage({super.key, required this.game});
  final Game game;

  @override
  State<GameDetailPage> createState() => _GameDetailPageState();
}

class _GameDetailPageState extends State<GameDetailPage> {
  GameDetailService? gameDetailService;

  @override
  void initState() {
    super.initState();
    gameDetailService = GameDetailService();
  }

  Future<void> _launchURL(double latitude, double longitude) async {
    final url = 'geo:$latitude,$longitude';
print(url);
      await launchUrl(Uri.parse(url));
    if (await canLaunchUrl(Uri.parse(url),
    )) {
    } else {
      const Center(
        child: Text('Could not launch'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd-MM-yyyy kk:mm').format(widget.game.startDate);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: AppBarWidget(
          icon: Icons.arrow_back_ios,
          text: 'Детали игры',
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder(
        future: gameDetailService?.fetchGameDetail(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData ) {
            return const Center(child: Text('No game details found'));
          } else {
                final gameDetails = snapshot.data!;
                 return SingleChildScrollView(
                   child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Container(
                          height: 300,
                          width: 480,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF0F0F0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                             const CashGame(),
                              const Text(
                                'Заголовок',
                                style: AppTextStyle.zagalovok,
                              ),
                              Text('$formattedDate', style: AppTextStyle.formattedDate),
                              const Gap(10),
                             Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  VznosZaCheloveka(
                                    text1: 'Взнос за человека:',
                                    text2: '${gameDetails.contribution} сом'
                                  ),
                                 const Gap(30),
                                  VznosZaCheloveka(
                                    text1: 'Продолжительность игры:',
                                    text2: '${widget.game.startDate.hour} саат',
                                  ),
                                ],
                              ),
                              const Gap(15),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ThreeRowWidgets(
                                    icon: 'assets/icons/frame1.svg',
                                    text: '8-60 лет',
                                  ),
                                  Gap(52),
                                  ThreeRowWidgets(
                                    icon: 'assets/icons/frame.svg',
                                    text: 'Дружеский',
                                  ),
                                  Gap(52),
                                  ThreeRowWidgets(
                                    icon: 'assets/icons/vector.svg',
                                    text: 'Поделится',
                                  ),
                                ],
                              ),
                              const Gap(10),
                              OrganizationRowDetail(widget: widget),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _launchURL(gameDetails.latitude, gameDetails.longitude);
                          },
                          child: Image.asset(gameDetails.image?? 'assets/images/map.png'),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 250, top: 6),
                          child: Text(
                            'Описание',
                            style: AppTextStyle.zagalovok,
                          ),
                        ),
                        const Gap(6),
                        Text(
                         textAlign: TextAlign.center,
                        gameDetails.description,
                          style: AppTextStyle.organizatorDetail,
                        ),
                       const Gap(10),
                        const ButtonDetail(),
                        Padding(
                          padding: const EdgeInsets.only(right: 190),
                          child: Text(
                            'Осталось 7 мест из 10',
                            style: GoogleFonts.ubuntu(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -1.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                                   ),
                 );
          }
        },
      ),
    );
  }
}





        
      
           
               
    
  




