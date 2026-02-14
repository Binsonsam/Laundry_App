import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziya_laundry_app/constants/app_colors.dart';

Widget MaterialCare({required String text1, required String text2}){
  return Padding(
    padding: const EdgeInsets.only(left: 8.0,right: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text1,
        style: GoogleFonts.poppins(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.goldenBrown
        ),),
        Expanded(
          child: Text(text2,
          style: GoogleFonts.poppins(
            wordSpacing: 2,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.amberOrange),),
        )
      ],
    ),
  );
}