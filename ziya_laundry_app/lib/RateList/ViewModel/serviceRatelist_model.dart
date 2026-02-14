import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziya_laundry_app/Cart/View/cart_screen.dart';
import 'package:ziya_laundry_app/constants/app_colors.dart';

class ServiceratelistModel {
  final String title;
  final String description;
  final String dressType;
  final String image;
  final String kgRate;
  final String pieceRate;

  ServiceratelistModel({
    required this.title,
    required this.description,
    required this.dressType,
    required this.kgRate,
    required this.pieceRate,
    required this.image,
  });
}


class ServiceRateList extends StatelessWidget {
  const ServiceRateList({super.key, required this.rate});
  final ServiceratelistModel rate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        height: 137.h,
        width: 337.w,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(rate.title,
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),),
                      Text(rate.description,
                      style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),),
                      Container(
                        height: 20.h,
                          width: 170.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: AppColors.lightBlue
                          ),
                          child: Center(child: Text(rate.dressType,
                          style: GoogleFonts.poppins(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w300,
                          ),))),

                    ],
                  ),
                  Container(
                    height: 72.h,
                    width: 62.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: CartPage.deepBlue),
                    ),
                    child: Image.asset(rate.image,
                      height: 71.h,
                      width: 60.h,
                      fit: BoxFit.fill,
                      ),
                  )

                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(height: 42.h,width: 138.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        border: Border.all(color: CartPage.deepBlue)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0,top: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('KG Rate',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp
                            ),),
                          Row(
                            children: [
                              Text(rate.kgRate,
                                style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  color: CartPage.deepBlue
                                ),),
                              Text('/KG',
                                style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  color: CartPage.deepBlue
                                ),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(height: 42.h,width: 138.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        border: Border.all(color: CartPage.deepBlue)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0,top: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Piece Rate',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp
                            ),),
                          Row(
                            children: [
                              Text(rate.pieceRate,
                                style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  color: CartPage.deepBlue
                                ),),
                              Text('/Piece',
                                style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  color: CartPage.deepBlue
                                ),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


