import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziya_laundry_app/Orders/ViewModel/orderModel.dart';
import 'package:ziya_laundry_app/Orders/Widgets/timeLineItem.dart';
import 'package:ziya_laundry_app/home/View/home_screen.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});
  
  static const statusColor = Color(0xFFCEDFFF);
  static const  darkGray = Color(0xFF353535);
  static const  skyBlue = Color(0xFF00BBFF);
  static const  darkGreen = Color(0xFF006823);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomePage.bgColor,
     body: SafeArea(
       child: SingleChildScrollView(
         child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           SizedBox(height: 10.h,),
           Row(
             children: [
               Padding(
                 padding: const EdgeInsets.only(left: 20),
                 child: IconButton(onPressed: (){},
                     icon: Icon(Icons.arrow_back_ios,size: 24,)),
               ),
               //Track order id
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text('Track Order', style: GoogleFonts.poppins(
                         fontWeight: FontWeight.w500, fontSize: 18.sp
                     ),),
                   SizedBox(height: 5.h),
                   Text('Order #ORD-2024-001', style: GoogleFonts.poppins(
                         fontSize: 14.sp, fontWeight: FontWeight.w400,
                     ),
                   )
                 ],
               )
             ],
           ),
           Padding(
             padding: const EdgeInsets.all(22),
             child: Container(
               height: 96.h, width: 331.w,
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(10.r),
                 boxShadow: [BoxShadow(
                   color: Colors.black.withOpacity(0.2),
                   blurRadius: 10.r,
                   offset: Offset(0, 4),
                 )]
               ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   SizedBox(width: 10.w,),
                   _buildColumn(title: 'Total Items', value: '10'),
                   SizedBox(width: 11.w,),
                   _divider(),
                   SizedBox(width: 11.w,),
                   _buildColumn(title: 'Total Amount', value: '\$567'),
                   SizedBox(width: 11.w,),
                   _divider(),
                   SizedBox(width: 11.w,),
                   _buildStatusColumn()

                 ],
               )
             ),
           ),
           OrderTimeLine(),

           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Container(
                 height: 20.h, width: 20.w,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(5.r),
                   border: Border.all(color: Colors.grey)
                 ),
                 child: Center(child: Text('1',
                 style: GoogleFonts.poppins(fontSize: 14.sp),)),
               ),
               SizedBox(width: 10.w,),
               Container(
                 height: 20.h, width: 20.w,
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(5.r),
                     border: Border.all(color: Colors.grey)
                 ),
                 child: Center(child: Text('2',
                   style: GoogleFonts.poppins(fontSize: 14.sp),)),
               ),
               SizedBox(width: 10.w,),
               Container(
                 height: 20.h, width: 20.w,
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(5.r),
                     border: Border.all(color: Colors.grey)
                 ),
                 child: Center(child: Text('3',
                   style: GoogleFonts.poppins(fontSize: 14.sp),)),
               )
             ],
           ),
           
           _deliverytime(date: '27 Dec, 2024'),

           Padding(
             padding: const EdgeInsets.only(left: 22,right: 22,top: 20),
             child: Container(height: 45.h, width: 331.w,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10.r),
                 color: Colors.white
               ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Image.asset('assets/download.png',
                     height: 24.h,width: 24.h,),
                   SizedBox(width: 10.w,),
                   Text('Download Invoice', style: GoogleFonts.poppins(
                     color: HomePage.primaryBlue,
                     fontWeight: FontWeight.w400,
                     fontSize: 14.sp
                   ),)
                 ],
               ),
             ),
           ),
           
           Padding(
             padding: const EdgeInsets.only(left: 22,top: 20),
             child: Text('Need Help?', style: GoogleFonts.poppins(
               fontSize: 16.sp,
               fontWeight: FontWeight.w500
             ),),
           ),
           Padding(
             padding: const EdgeInsets.only(left: 22,top: 25),
             child: Row(
               children: [
                 Container(height: 74.h, width: 140.w,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10.r),
                     color: Colors.white
                   ),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Image.asset('assets/chat.png'),
                       SizedBox(height: 10.h,),
                       Text('Chat Support', style: GoogleFonts.poppins(
                         fontSize: 16.sp, fontWeight: FontWeight.w400
                       ),)
                     ],
                   ),
                 ),
                 SizedBox(width: 51.w,),
                 Container(height: 74.h, width: 140.w,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10.r),
                       color: Colors.white
                   ),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Image.asset('assets/call.png'),
                       SizedBox(height: 10.h,),
                       Text('Call Us', style: GoogleFonts.poppins(
                             fontSize: 16.sp,
                             fontWeight: FontWeight.w400
                         ),)
                     ],
                   ),
                 ),
               ],
             ),
           ),
           SizedBox(height: 20.h,)
         ],
              ),
       ),
     ),
    );
  }
}



//widgets

Widget _buildColumn({ required String title, required String value}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
      children: [
  SizedBox(height: 19.h,),
  Text(title, style: GoogleFonts.poppins(
        fontSize: 14.sp, color: Colors.black
      ),),
  SizedBox(height: 10,),
  Padding(
    padding: const EdgeInsets.only(right: 35),
    child: Text(value, style: GoogleFonts.poppins(
          fontSize: 24.sp
      ),),
  ),
      ],
    );
}

Widget _divider(){
  return Container(color: HomePage.primaryBlue,
    height: 66.h, width: 1.w,
  );
}

Widget _buildStatusColumn(){
  return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Status', style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400, fontSize: 14.sp,
            ),),
            SizedBox(height: 10.h,),
            Container(height: 25.h, width: 90.w,
              decoration: BoxDecoration(
                  color: OrderPage.statusColor,
                borderRadius: BorderRadius.circular(20.r)
              ),
              child: Center(child: Text('In Progress',
              style: GoogleFonts.poppins(fontSize: 12.sp,
              color: OrderPage.darkGreen,
              fontWeight: FontWeight.w400),)),
            )
          ],
        ),
      ));
}


class OrderTimeLine extends StatelessWidget {
  const OrderTimeLine({super.key});

  @override
  Widget build(BuildContext context) {

    final steps = [
      OrderStep(
        title: "Order Scheduled",
        description: "Your order has been picking up by 24 Dec, 10:30 AM",
        statusText: "",
        gif: "assets/calender.gif",
        icon: Icons.inventory_2_outlined,
        state: OrderState.completed,
      ),
      OrderStep(
        title: "Pickup",
        description: "Successfully picked your order at 10:30 AM",
        statusText: "",
        icon: Icons.local_shipping_outlined,
        state: OrderState.completed,
        gif: 'assets/pickup.gif',
      ),
      OrderStep(
        title: "Washing  • Live",
        description: "Premium detergent wash in progress",
        statusText: "In Progress",
        icon: Icons.local_laundry_service_outlined,
        state: OrderState.live,
        gif: 'assets/washing.gif',
      ),
      OrderStep(
        title: "Drying",
        description: "Machine drying with fabric",
        statusText: "Pending",
        icon: Icons.dry_cleaning_outlined,
        state: OrderState.pending,
        gif: 'assets/drying.gif',
      ),
      OrderStep(
        title: "Ironing",
        description: "Professional pressing",
        statusText: "Pending",
        icon: Icons.iron_outlined,
        state: OrderState.pending,
        gif: '',
      ),
      OrderStep(
        title: "Out of Delivery",
        description: "On the way to you",
        statusText: "Pending",
        icon: Icons.delivery_dining_outlined,
        state: OrderState.pending,
        gif: 'assets/delivery.gif',
      ),
      OrderStep(
        title: "Delivered",
        description: "Order Completed",
        statusText: "Expected on 27th Dec",
        icon: Icons.check_circle_outline,
        state: OrderState.pending,
        gif: 'assets/shipment.gif',
      ),
    ];

    return  ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemCount: steps.length,
          shrinkWrap: true,
          physics:const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index){
            return timelineItem(
                step: steps[index],
                isLast: index==steps.length - 1);
          });
  }
}


Widget _deliverytime({required String date}){
  return Padding(
    padding: const EdgeInsets.all(22),
    child: Container(height: 60.h, width: 331.w,
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
                Container(height: 30.h, width: 30.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: HomePage.primaryBlue
                    ),
                    child: Icon(Icons.access_time,
                      color: Colors.white,)),
                SizedBox(width: 12.w  ,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Expected Delivery', style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.green
                    ),),
                    Text(date, style: GoogleFonts.poppins(
                        color: OrderPage.darkGray,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400
                      ),)
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
