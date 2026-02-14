import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ziya_laundry_app/constants/app_colors.dart';
Widget dateContainer(String title, DateTime date, bool isSelected) {
  return Container(
    height: 70.h, width: 90.w,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.r),
      border: Border.all(
        color: isSelected ?  AppColors.primaryBlue : Colors.grey.shade400,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
            color: isSelected ? Colors.black : Colors.grey,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          DateFormat("dd MMM").format(date),
          style:  GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.black : Colors.grey,
          ),
        ),
      ],
    ),
  );
}