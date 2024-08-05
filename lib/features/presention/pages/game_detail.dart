import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/constants/app_colors.dart';
import 'package:football/constants/app_text_style.dart';
import 'package:football/features/data/model/game_model.dart';
import 'package:football/features/presention/widgets/detail_page/tree_row_widgets.dart';
import 'package:football/features/presention/widgets/detail_page/vznos_za_cheloveka.dart';
import 'package:football/features/presention/widgets/game_page/app_bar_widget.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class GameDetail extends StatefulWidget {
  final Game game;

  const GameDetail({super.key, required this.game});

  @override
  State<GameDetail> createState() => _GameDetailState();
}

class _GameDetailState extends State<GameDetail> {
    // late GoogleMapController mapController;
      
    //     final LatLng _center = const LatLng(-33.86, 151.20);
      
    //     void _onMapCreated(GoogleMapController controller) {
    //       mapController = controller;
    //     }

  @override
  Widget build(BuildContext context) {
  final formattedDate = DateFormat('dd-MM-yyyy  kk:mm ').format(widget.game.startDate);
  return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:AppBarWidget(icon:Icons.arrow_back_ios, 
        text: 'Детали игры',onTap: (){
          Navigator.pop(context);
        },
        ),
        ),
           body: SingleChildScrollView(
             child: Padding(
                       padding: const EdgeInsets.all(20.0),
                       child: 
                Column(
                  children: [
                    Container(
                       height: 300,
                       width: 480,
                       decoration: BoxDecoration(
                        color: const Color(0xFFF0F0F0),
                        borderRadius: BorderRadius.circular(10)
                       ),
                        child: Column(
                          children: [
                         const   Padding(
                            padding:  EdgeInsets.only(top: 12),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.account_balance_wallet,
                                    color: AppColors.green,
                                  ),
                                  Gap(3),
                                  Text(
                                    'Cash Game',
                                    style: AppTextStyle.cashGameDetail
                                  ),
                                ],
                              ),
                          ),
                          const  Text(
                           'Заголовок',
                              style:AppTextStyle.zagalovok
                            ),
                              Text('$formattedDate',style: AppTextStyle.formattedDate),
                        const  Gap(10),
                           const  Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                VznosZaCheloveka(text1:'Взнос за человека:',text2:'175 cом',),    Gap(30),
                                          VznosZaCheloveka(text1:'Продолжительность игры:',text2:'2 часа',), 
                              ],),
                             const Gap(15),
                             const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                               ThreeRowWidgets(icon:'assets/icons/frame1.svg' ,text: '8-60 лет',),
                               Gap(52),
                                ThreeRowWidgets(icon:'assets/icons/frame.svg' ,text: 'Дружеский',),
                             Gap(52),
                                 ThreeRowWidgets(icon:'assets/icons/vector.svg' ,text: 'Поделится',),
                              ],),
                            const  Gap(10),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                        SizedBox(
                          height: 70,
                          child: Image.asset(widget.game.image??'assets/images/imageBoy.png', ),
                                            ),
                                   Column(children: [
                                    Text('организатор',style:AppTextStyle.organizatorDetail),
                                      Text(textAlign: TextAlign.start, widget.game.organizer.name, style: AppTextStyle.organizerNameDetail),
                                            ],),
                                           const Gap(70),
                                            SvgPicture.asset('assets/icons/sms.svg'),
                                               const Gap(20),
                                             SvgPicture.asset('assets/icons/call.svg'),   
                              ],),
                        ],
                        ),
                       ),
// GoogleMap(
//       onMapCreated: _onMapCreated,
//       initialCameraPosition: CameraPosition(
//          target: _center,
//          zoom: 11.0,
//       ),
//       markers: {
//          const Marker(
//                markerId:  MarkerId("Sydney"),
//                position: LatLng(-33.86, 151.20),
//                infoWindow: InfoWindow(
//                title: "Sydney",
//                snippet: "Capital of New South Wales",
//             )
//             ), 
//       }, 
//    ), 
                  ])  ),
           )
               
    );
  }
}


