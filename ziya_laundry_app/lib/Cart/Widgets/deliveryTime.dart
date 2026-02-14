
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ziya_laundry_app/CommonWidgets/Widgets.dart';
import 'package:ziya_laundry_app/Orders/View/order_screen.dart';
import 'package:ziya_laundry_app/home/View/home_screen.dart';

Widget deliverytime({required String date}){
  return Padding(
    padding: const EdgeInsets.only(bottom: 20,top: 20),
    child: Container(
      height: 60.h,
      width: 331.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r)
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 11),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 10.w),
                AppContainer(
                  h: 30.h,
                  w: 30.w,
                  borderRadius: 10.r,
                  color: HomePage.primaryBlue,
                  child: Icon(Icons.access_time,color: Colors.white,),
                ),
                SizedBox(width: 12.w  ,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                        text: 'Expected Delivery',
                        fontsize: 14.sp,
                        fontweight: FontWeight.w400,
                        color: Colors.green),
                    AppText(
                        text: date,
                        fontsize: 14.sp,
                        fontweight: FontWeight.w400,
                        color: OrderPage.darkGray)
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );
}


