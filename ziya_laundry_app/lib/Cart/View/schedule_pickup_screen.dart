import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziya_laundry_app/Cart/View/add_address.dart';
import 'package:ziya_laundry_app/Cart/View/cart_screen.dart';
import 'package:ziya_laundry_app/Cart/Widgets/date_timeSlot.dart';
import 'package:ziya_laundry_app/constants/app_colors.dart';
import 'package:ziya_laundry_app/home/View/home_screen.dart';
class SchedulePickup extends StatefulWidget {
  const SchedulePickup({super.key});

  @override
  State<SchedulePickup> createState() => _SchedulePickupState();
}

class _SchedulePickupState extends State<SchedulePickup> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {

    DateTime today = DateTime.now();
    DateTime yesterday = today.subtract(const Duration(days: 1));
    DateTime tomorrow = today.add(const Duration(days: 1));

    return Scaffold(
      backgroundColor: HomePage.bgColor,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 26,right: 26),
                  child: Column(
                    children: [
                    SizedBox(height: 10.h,),
                  Row(
                    children: [
                      IconButton(onPressed: (){
                        Navigator.pop(context);
                      },
                          icon: Icon(Icons.arrow_back_ios,size: 24,)),
                      //Track order id
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Schedule Pickup', style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                            ),),
                          SizedBox(height: 5.h),
                          Text('Choose date,time & address', style: GoogleFonts.poppins(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                      SizedBox(height: 20.h,),
                      Row(
                        children: [
                          Image.asset('assets/calendar.png',height: 24.h,width: 24.w,),
                          SizedBox(width: 10.w,),
                          Text('Select Pickup Date', style: GoogleFonts.poppins(
                            fontSize: 16.sp,fontWeight: FontWeight.w500,
                            color: AppColors.primaryBlue
                          ),)
                        ],
                      ),
                      SizedBox(height: 20.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          dateContainer('Yesterday', yesterday, false),
                          dateContainer('Today', today, true),
                          dateContainer('Tomorrow', tomorrow, false),
                        ],
                      ),
                      SizedBox(height: 20.h,),
                      Row(
                        children: [
                          Image.asset('assets/clock.png',height: 24.h,width: 24.w,),
                          SizedBox(width: 10.w,),
                          Text('Select Time Slot',style: GoogleFonts.poppins(
                            fontSize: 16.sp,fontWeight: FontWeight.w500,
                            color: AppColors.primaryBlue
                          ),)
                        ],
                      ),
                      SizedBox(height: 20.h,),
                      timeSlot(
                          index: 0,
                          title: 'Morning',
                          time: '8:00 AM – 12:00 PM',
                          isFull: false,
                          isFewSlots: false,
                      ),
                      timeSlot(
                          index: 1,
                          title: 'AfterNoon',
                          time: '12:00 PM – 4:00 PM',
                          isFull: false,
                          isFewSlots: true,
                          ),
                      timeSlot(
                          index: 2,
                          title: 'Evening',
                          time: '4:00 PM – 8:00 PM',
                          isFull: true,
                          isFewSlots: false,
                          ),
                      SizedBox(height: 20.h,),
                      Row(
                        children: [
                          Image.asset('assets/location.png',height: 24.h,width: 24.w,),
                          SizedBox(width: 10.w,),
                          Text('Pickup Address',style: GoogleFonts.poppins(
                            fontSize: 16.sp,fontWeight: FontWeight.w500,color: AppColors.primaryBlue
                          ),),
                                SizedBox(width: 65.w,),
                                Container(
                                  height: 20.h,width: 20.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.r),
                                    border: Border.all(color: Colors.black),
                                  ),
                                  child: Center(child: Text('+')),
                                ),
                          SizedBox(width: 10.w,),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext)=>AddAddress()));
                            },
                            child: Text('Add New',style: GoogleFonts.poppins(
                              fontSize: 14.sp,fontWeight: FontWeight.w400,color: AppColors.primaryBlue
                            ),),
                          )
                        ],
                      ),
                      SizedBox(height: 20.h,),
                      Container(
                        height: 119.h,width: 331.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.white,
                          border: Border.all(color: AppColors.primaryBlue),
                        ),
                      ),
                      SizedBox(height: 20.h,),
                      Row(
                        children: [
                          Image.asset('assets/message1.png',height: 24.h,width: 24.w,),
                          SizedBox(width: 10.w,),
                          Text('Special Instructions (Optional)',style: GoogleFonts.poppins(
                            fontSize: 16.sp,fontWeight: FontWeight.w500,color: AppColors.primaryBlue
                          ),)
                        ],
                      ),
                      SizedBox(height: 20.h,),
                      Container(
                        height: 79.h,width: 331.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey)
                        ),
                        child: TextField(
                          maxLines: 3,
                          decoration: InputDecoration(
                            hintText: 'eg., Ring the doorbell twice, or contact me before arrival',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.r),
                              )
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h,),
                      Container(
                        height: 146.h,width: 331.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                 Image.asset('assets/time-04-stroke-rounded 1.png',height: 30.h,width: 30.w,),
                                  SizedBox(width: 20.w,),
                                  Text('Estimated Delivery',style: GoogleFonts.poppins(
                                    fontSize: 16.sp,fontWeight: FontWeight.w400,
                                    color: AppColors.darkGreen
                                  ),)
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 42),
                                child: Text('Your order will be delivered 24-48 \nhours after pickup',
                                style: GoogleFonts.poppins(
                                  fontSize: 14.sp,fontWeight: FontWeight.w400
                                ),),
                              ),
                              Text('Expected : 27 Dec,2025',style: GoogleFonts.poppins(
                                fontSize: 16.sp,fontWeight: FontWeight.w400,color: AppColors.darkGreen
                              ),)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h,),
                      Container(
                        height: 40.h,
                        width: 300.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: CartPage.deepBlue,
                        ),
                        child: Center(
                          child: Text('Confirm & Proceed to Payment',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500
                            ),),
                        ),
                      ),
                      SizedBox(height: 70.h,)

                  ],
                ),
                )
            )
        )
    );
  }



  Widget timeSlot({
    required int index,
    required String title,
    required String time,
    required bool isFull,
    required bool isFewSlots,
  }) {
    bool isSelected = selectedIndex == index;


    return  GestureDetector(
      onTap:  isFull ? null
          : (){
        setState(() {
          selectedIndex = index;
        });
      },

      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          height: 59.h,width: 331.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: isSelected
                  ? Colors.white
                  :HomePage.bgColor,
              border: Border.all(
                  color: isSelected
                      ?CartPage.green
                      :Colors.grey)
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 30,top: 7,right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,style: GoogleFonts.poppins(
                        fontSize: 14.sp, fontWeight: FontWeight.w500,
                      color: isFull
                        ?Colors.grey
                          :Colors.black
                    ),),
                    Text(time, style: GoogleFonts.poppins(
                        fontSize: 14.sp,fontWeight: FontWeight.w500,
                        color: isFull
                    ?Colors.grey
                    :Colors.black),),
                  ],
                ),
                if (isFewSlots)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child:  Text(
                      "Few Slots",
                      style: GoogleFonts.poppins(
                        color: Colors.blue,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                if (isFull)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child:  Text(
                      "Full",
                      style: GoogleFonts.poppins(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}