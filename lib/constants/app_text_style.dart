import 'package:flutter/material.dart';
import 'package:football/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle{
  static const TextStyle cashGameHome = TextStyle(fontSize: 13, fontWeight: FontWeight.w500);
static  TextStyle formattedDate =  GoogleFonts.ubuntu(fontWeight: FontWeight.w700);
static const TextStyle km = TextStyle(color: AppColors.white, fontWeight: FontWeight.w900);
static  TextStyle organizerName = GoogleFonts.ubuntu(fontSize: 16, color: AppColors.white);
static  TextStyle organizatorHome = GoogleFonts.ubuntu(color: AppColors.white, fontWeight: FontWeight.w400);
static const  TextStyle sliderValue = TextStyle(color: AppColors.white,fontWeight: FontWeight.bold, fontSize: 15);
static const  TextStyle cashGameDetail = TextStyle(fontSize: 18, color: Color(0xFF0A9829),);
static const  TextStyle zagalovok = TextStyle(fontSize: 18, fontWeight: FontWeight.w700);
static   TextStyle organizatorDetail =  GoogleFonts.ubuntu(fontSize: 16,);
static  TextStyle organizerNameDetail =  GoogleFonts.ubuntu( fontWeight: FontWeight.w700, fontSize: 15);
static const  TextStyle vznos = TextStyle(fontWeight: FontWeight.w500, fontSize: 18);
static const  TextStyle threeRowDetail =TextStyle(fontWeight: FontWeight.w500, fontSize: 15);
static TextStyle appBarText = GoogleFonts.ubuntu(fontWeight: FontWeight.w700, fontSize: 24);
static const TextStyle categoryText =  TextStyle(color: Colors.black, fontSize: 15);
static  TextStyle joinButtonText =  GoogleFonts.ubuntu(color: AppColors.white, fontWeight: FontWeight.w500,fontSize: 14);

}