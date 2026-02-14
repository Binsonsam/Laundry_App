
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziya_laundry_app/Cart/View/cart_screen.dart';
import 'package:ziya_laundry_app/Orders/View/order_screen.dart';
import 'package:ziya_laundry_app/RateList/ViewModel/category_mode.dart';
import 'package:ziya_laundry_app/RateList/ViewModel/serviceRatelist_model.dart';
import 'package:ziya_laundry_app/RateList/Widgets/note_materialCare.dart';
import 'package:ziya_laundry_app/RateList/Widgets/rates.dart';
import 'package:ziya_laundry_app/RateList/Widgets/service_rate.dart';

import '../../home/View/home_screen.dart';

class RatePage extends StatelessWidget {
   const RatePage({super.key});

   static const  mintGreen = Color(0xFFAFFFB4);
   static const  lightBlue = Color(0xFFC8D9FF);
   static const  softLavender = Color(0xFFFAE9FF);
   static const  deepViolet = Color(0xFF5D0078);
   static const  softPink = Color(0xFFFFE8EA);
   static const  lightSkyBlue = Color(0xFFC0E3FF);
   static const  tealBlue = Color(0xFF007595);
   static const  softPeriwinkle = Color(0xFFE3E3FF);
   static const  vividBlue = Color(0xFF0000E6);
   static const  peachLight = Color(0xFFFFE4D7);
   static const  burntOrange = Color(0xFFA63600);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HomePage.bgColor,
        body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
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
                      Text('Complete Rate List',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp
                        ),),
                      SizedBox(height: 5.h),
                      Text('Categorized by materiel type',
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400
                        ),
                      )
                    ],
                  ),
                  SizedBox(width: 43.w,),
                  Container(
                    height: 25.h,
                    width: 71.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: RatePage.mintGreen,
                      border: Border.all(
                        color: OrderPage.darkGreen,
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/rate.png',
                          height: 15.h,width: 15.w,
                        color: OrderPage.darkGreen,),
                        Center(child: Text('2026')),
                      ],
                    )
                  )
                ],
              ),
                  SizedBox(height: 20.h,),

                  SizedBox(
                    height: 36.h,
                    width: 330.w,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        label: Text('Search by item, material, or service'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r)
                        )
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  ////list container/////
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: categories.length,
                      itemBuilder: (context, index){
                        final cat = categories[index];
                    return GestureDetector(
                      onTap: ()=> showDetails(context, cat),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: cat.color.withOpacity(1),
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                              color: cat.textcolor,
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              children: [
                                Image.asset(cat.image,height: 30.h,width: 30.w,),
                                SizedBox(width: 12.w,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(cat.title,
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp,
                                        color: cat.textcolor,
                                      ),),
                                    Text('${cat.items.length} Items',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),),
                                  ],
                                ),
                                const Spacer(),
                                const Icon(Icons.chevron_right,color: Colors.grey,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                  
                  Padding(
                    padding: const EdgeInsets.only(left: 21,right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Service Rate List',
                        style: GoogleFonts.poppins(
                          color: CartPage.deepBlue,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),),
                        SizedBox(height: 20.h,),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: serviceList.length,
                          itemBuilder: (context, index) {
                            return ServiceRateList(
                              rate: serviceList[index],
                            );
                          },
                        )

                      ],
                    ),
                  ),
                  Container(
                    height: 691.h,width: 335.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/alert-circle.png',height: 24.h,width: 24.w,),
                              SizedBox(width: 10.w,),
                              Text('Important Notes & Material Care',
                              style: GoogleFonts.poppins(
                                fontSize: 14.sp,fontWeight: FontWeight.w500,color: OrderPage.darkGray
                              ),)
                            ],
                          ),
                          SizedBox(height: 5.h,),
                          MaterialCare(
                              text1: '•Cotton & Light Fabrics: ', text2: 'Regular wash & iron suitable. Quick drying.'),
                          MaterialCare(
                              text1: '•Silk & Delicate: ', text2: 'Dry clean recommended. \nHand wash for light silk items.'),
                          MaterialCare(
                              text1: '•Wool & Heavy: ', text2: 'Dry clean only. Special \ncare for winter garments.'),
                          MaterialCare(
                              text1: '•Synthetic/Polyester: ', text2: 'Can be washed. \nAvoid high heat ironing.'),
                          MaterialCare(
                              text1: '•Leather Items: ', text2: 'Special cleaning process. \nPer piece charges only.'),
                          MaterialCare(
                              text1: '•Designer/Party Wear: ', text2: 'Charged as per \ncloth value and complexity.'),
                          MaterialCare(
                              text1: '•Minimum Order: )', text2: '3 KG (orders below 3 KG \nwill be charged as 3 KG'),
                          MaterialCare(
                              text1: '•All Prices Include: ', text2: 'Free pickup and \ndelivery'),
                          MaterialCare(
                              text1: '•Express Service: ', text2: 'Available at 50% \nadditional charges'),
                          MaterialCare(
                              text1: '•Material Verification: ', text2: 'Our team will verify \nfabric type during pickup'),
                        ],
                      ),
                    ),

                  )
              ],
              ),
            ))
    );
  }
}
