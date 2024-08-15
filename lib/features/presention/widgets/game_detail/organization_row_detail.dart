import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football/constants/static/app_text_style.dart';
import 'package:football/features/presention/pages/game_detail.dart';
import 'package:gap/gap.dart';

class OrganizationRowDetail extends StatelessWidget {
  const OrganizationRowDetail({
    super.key,
    required this.widget,
  });

  final GameDetailPage widget;

  @override
  Widget build(BuildContext context) {
    return Row(
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
     ],);
  }
}


