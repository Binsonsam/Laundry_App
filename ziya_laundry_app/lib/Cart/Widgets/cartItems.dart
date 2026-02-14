
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziya_laundry_app/Cart/View/cart_screen.dart';
import 'package:ziya_laundry_app/Cart/ViewModel/CartModel.dart';

Widget CartItems({
  required CartItem  item,
  required VoidCallback onAdd,
  required VoidCallback onRemove,
  required VoidCallback onDelete,
  required int index,
}){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Container(
      height: 131.h, width: 330.w,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
          boxShadow: [BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10.r,
              offset: Offset(0, 2)
          )]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Padding(
            padding: const EdgeInsets.only(left: 15,top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 31.h, width: 103.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: CartPage.deepBlue
                  ),
                  child: Center(
                    child: Text(item.washtype,
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400
                      ),),
                  ),
                ),
                SizedBox(height: 10.h,),
                Container(
                  height: 65.h, width: 85.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r)
                  ),
                  child: Image.asset(item.picture,
                    fit: BoxFit.fill,),
                )
              ],
            ),
          ),
          SizedBox(width: 15.w,),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(item.dresstype,
                  style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400
                  ),),
                Row(
                  children: [
                    Text('\$${item.price}',
                      style: GoogleFonts.poppins(
                          color: CartPage.deepBlue,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400
                      ),),
                    Text('/piece',
                      style: GoogleFonts.poppins(
                          color: CartPage.deepBlue,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400
                      ),),
                  ],
                ),
                Text('\$${item.total}',
                  style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400
                  ),),
              ],
            ),
          ),


          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(onTap: onAdd,
                  child: Container(
                    height: 25.h, width: 25.w,
                    decoration: BoxDecoration(
                        color: CartPage.lightLavender,
                        borderRadius: BorderRadius.circular(5.r)
                    ),
                    child: Center(child: Text('+',
                      style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: CartPage.blueAccent
                      ),)),
                  ),
                ),
                Text('${item.qty}',
                  style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500
                  ),),
                InkWell(
                  onTap: onRemove,
                  child: Container(
                    height: 25.h, width: 25.w,
                    decoration: BoxDecoration(
                        color: CartPage.softPink,
                        borderRadius: BorderRadius.circular(5.r)
                    ),
                    child: Center(child: Text('-',
                      style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.redAccent
                      ),)),
                  ),
                )
              ],
            ),
          ),

          IconButton(onPressed: onDelete,
              icon: Icon(Icons.delete,color: CartPage.deepBlue,)),
        ],
      ),
    ),
  );
}