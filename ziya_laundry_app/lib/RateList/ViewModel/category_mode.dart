import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziya_laundry_app/Cart/View/cart_screen.dart';
import 'package:ziya_laundry_app/CommonWidgets/Widgets.dart';
import 'package:ziya_laundry_app/home/View/home_screen.dart';

class FabricCategory{
  final String title;
  final Color textcolor;
  final Color color;
  final String image;
  final List<FabricItem> items;

  FabricCategory({
    required this.title,
    required this.image,
    required this.color,
    required this.items,
    required this.textcolor,
  });
}

class FabricItem{
  final String name;
  final String price;
  final String unit;
  final String fabricType;


  FabricItem({
    required this.name,
    required this.price,
    required this.unit,
    required this.fabricType,
  });
}

void showDetails(BuildContext context, FabricCategory category){
  showGeneralDialog(
      context: context,
      pageBuilder: (context, anim1, anim2){
        return Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Container(
              height: 782.h,
              width: 299.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                color: Colors.white,
              ),
              child: Material(
                child: FabricDetailerDrawer(category: category),
              ),
            ),
          ),
        );
      },
    transitionBuilder: (context, anim1, anim2, child){
        return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero
            ).animate(anim1),
        child: child,);

    }
      );
}


class FabricDetailerDrawer extends StatelessWidget {
  final FabricCategory category;
  const FabricDetailerDrawer({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          },
              icon: Icon(Icons.arrow_back_ios)),
          title: Text(category.title,
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),),
          backgroundColor: Colors.white,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: category.items.length,
              itemBuilder: (context, index){
                final item = category.items[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 23,right: 21,bottom: 9),
                  child: Container(
                    height: 59.h,
                    width: 247.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.r)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AppText(
                                  text: item.name,
                                  fontsize: 12.sp,
                                  fontweight: FontWeight.w400,
                                  color: Colors.black),
                              item.fabricType.trim().isEmpty
                                  ? const SizedBox.shrink()
                                  : Container(
                                height: 20.h,
                                width: 64.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: CartPage.deepBlue,
                                ),
                                child: Center(
                                  child: Text(
                                    item.fabricType,
                                    style: GoogleFonts.poppins(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(item.price,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: HomePage.primaryBlue,
                              ),),
                              Text(item.unit,
                              style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.green
                              ),)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
