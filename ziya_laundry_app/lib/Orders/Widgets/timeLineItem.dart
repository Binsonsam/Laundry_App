
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ziya_laundry_app/Orders/View/order_screen.dart';
import 'package:ziya_laundry_app/Orders/ViewModel/orderModel.dart';
import 'package:ziya_laundry_app/home/View/home_screen.dart';

Widget timelineItem({
  required OrderStep step,
  required bool isLast,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Left timeline
      Column(
        children: [
          _timelineIcon(step.state, step.icon),
          if (!isLast)
            Container(
              width: 2.w,
              height: 102.h,
              color: step.state == OrderState.completed
                  ? Colors.green
                  : HomePage.primaryBlue,
            ),
        ],
      ),

      SizedBox(width: 12.w),

      // Right card
      Expanded(child: _statusCard(step)),
    ],
  );
}


Widget _timelineIcon(OrderState state, IconData icon) {
  Color bgColor;
  Color iconColor;

  switch (state) {
    case OrderState.completed:
      bgColor = Colors.white;
      iconColor = HomePage.primaryBlue;
      break;
    case OrderState.live:
      bgColor = Colors.white;
      iconColor = HomePage.primaryBlue;
      break;
    default:
      bgColor = Colors.white;
      iconColor = HomePage.primaryBlue;
  }

  return Container(
    width: 32.w,
    height: 32.w,
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(5.r),
      border: Border.all(color: Colors.grey),
    ),
    child: Icon(icon, size: 18.sp, color: iconColor),
  );
}

Widget _statusCard(OrderStep step) {
  Color borderColor;

  switch (step.state) {
    case OrderState.completed:
      borderColor = Colors.green.shade200;
      break;
    case OrderState.live:
      borderColor = Colors.orange.shade200;
      break;
    default:
      borderColor = Colors.grey.shade300;
  }

  return Container(
    margin: EdgeInsets.only(bottom: 20.h),
    padding: EdgeInsets.all(14.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.r),
      border: Border.all(color: borderColor),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          step.title,
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: HomePage.primaryBlue
          ),
        ),
        SizedBox(height: 6.h),
        Row(
          children: [
            Expanded(
              child: Text(
                step.description,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: OrderPage.darkGray,
                ),
              ),
            ),
            if(step.gif.isNotEmpty)...[
              Image.asset(step.gif,height: 25.h,width: 34.w,)
            ]
          ],
        ),
        if (step.statusText.isNotEmpty) ...[
          SizedBox(height: 6.h),
          Row(
            children: [
              const Icon(Icons.access_time, size: 14),
              SizedBox(width: 4.w),
              Text(
                step.statusText,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: OrderPage.darkGray,
                ),
              ),
            ],
          ),
        ],
      ],
    ),
  );
}