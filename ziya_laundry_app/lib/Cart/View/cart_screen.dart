import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziya_laundry_app/Cart/View/schedule_pickup_screen.dart';
import 'package:ziya_laundry_app/Cart/ViewModel/CartModel.dart';
import 'package:ziya_laundry_app/Cart/Widgets/cartItems.dart';
import 'package:ziya_laundry_app/Cart/Widgets/deliveryTime.dart';
import 'package:ziya_laundry_app/home/View/home_screen.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  static const  deepBlue = Color(0xFF1D4897);
  static const  lightLavender = Color(0xFFF2F2FF);
  static const  blueAccent = Color(0xFF0004FF);
  static const  softPink = Color(0xFFFFF2F2);
  static const  deepIndigo = Color(0xFF0003C5);
  static const  green = Color(0xFF00B24A);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  void _showDeletePopup(BuildContext context, int index) async {
    final RenderBox overlay =
    Overlay.of(context).context.findRenderObject() as RenderBox;

    final result = await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        overlay.size.width - 220, // 👈 horizontal position
        overlay.size.height / 2,  // 👈 vertical position
        20,
        20,
      ),
      items: [
        PopupMenuItem(
          enabled: false,
          child: SizedBox(
            width: 180,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Are you sure you want to delete this item?',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontSize: 13),),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: Size(70, 30),
                      ),
                      onPressed: () {
                        setState(() {
                          cartItems.removeAt(index);
                        });
                        Navigator.pop(context);
                      },
                      child: Text('Yes'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        minimumSize: Size(70, 30),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('No'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  final List<CartItem> cartItems = [
    CartItem(
      washtype: 'Wash & Iron',
      picture: 'assets/formalShirt.png',
      dresstype: 'Formal Shirt',
      price: 49,
      qty: 3,
    ),
    CartItem(
      washtype: 'Wash & Fold',
      picture: 'assets/jeans.jpg',
      dresstype: 'Jeans',
      price: 59,
      qty: 2,
    ),
    CartItem(
      washtype: 'Wash & Fold',
      picture: 'assets/shirt.jpg',
      dresstype: 'T-Shirt',
      price: 39,
      qty: 3,
    ),
    CartItem(
      washtype: 'Wash & Iron',
      picture: 'assets/kurtha.png',
      dresstype: 'Kurtha',
      price: 69,
      qty: 2,
    ),
  ];

  int get subtotal {
    return cartItems.fold(0, (sum, item) => sum + item.total);
  }

  @override
  Widget build(BuildContext context) {
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
                  IconButton(onPressed: (){},
                      icon: Icon(Icons.arrow_back_ios,size: 24,)),
                  //Track order id
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('My Cart', style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500, fontSize: 18.sp),),
                      SizedBox(height: 5.h),
                      Row(
                        children: [
                          Text('${cartItems.length} Items', style: GoogleFonts.poppins(
                                fontSize: 14.sp, fontWeight: FontWeight.w400),
                          ),
                          Text('  •  Review & confirm', style: GoogleFonts.poppins(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
                        SizedBox(height: 20.h,),

              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return CartItems(
                    item: item,
                    index: index,
                    onAdd: () {
                      setState(() => item.qty++);
                    },
                    onRemove: () {
                      if (item.qty > 1) {
                        setState(() => item.qty--);
                      }
                    },
                    onDelete: () {
                      _showDeletePopup(context, index);
                    },
                  );
                },
              ),
              SizedBox(height: 20.h,),

                        Container(height: 93.h, width: 330.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: Colors.grey)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Row(
                                  children: [
                                    Image.asset('assets/coupon.png',height: 24.h,width: 20.w,),
                                    SizedBox(width: 4.w,),
                                    Text('Apply Coupon Code', style: GoogleFonts.poppins(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500
                                    ),)
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(height: 27.h, width: 174.w,
                                    color: Colors.white,
                                    child: Center(
                                      child: TextField(
                                        cursorHeight: 15,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.r),
                                          )
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){},
                                    child: Container(height: 27.h, width: 104.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.r),
                                        color: CartPage.deepBlue
                                      ),
                                      child: Center(
                                        child: Text('Apply', style: GoogleFonts.poppins(
                                            color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp),),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        deliverytime(date: '24 - 48 hours after pickup'),
                        Container(height: 60.h, width: 331.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.white
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Row(
                              children: [
                                Image.asset('assets/shield.png',height: 15.h,width: 15.w,),
                                SizedBox(width: 8.w,),
                                Text('Hygiene Assured • Sanitized Packaging\n • Quality Checked',
                                style: GoogleFonts.poppins(
                                  color: CartPage.green,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400
                                ),)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h,),
                        Container(height: 95.h, width: 331.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: Colors.white
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 18),
                            child: Row(
                              children: [
                                Image.asset('assets/refresh.png',height: 15.h,width: 14.w,),
                                SizedBox(width: 8.w,),
                                Text('Damage Policy: We take full\n responsibility for any damage during \nour service. Claims processed within\n 24 hours.',
                                  style: GoogleFonts.poppins(
                                      color: CartPage.deepIndigo,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400
                                  ),)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h,),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Subtotal', style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp
                                ),),
                                Text('$subtotal', style: GoogleFonts.poppins(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500
                                ),)
                              ],
                            ),
                            SizedBox(height: 16.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Deliver Charge', style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp
                                  ),),
                                Text('Free', style: GoogleFonts.poppins(
                                    color: Colors.green,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500
                                  ),)
                              ],
                            ),
                            SizedBox(height: 10.h,),
                            Container(
                              width: 332.w,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)
                              ),
                            ),
                            SizedBox(height: 14.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total', style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                  ),),
                                Text('$subtotal', style: GoogleFonts.poppins(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500
                                  ),)
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h,),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext)=>SchedulePickup()));
                          },
                          child: Container(height: 40.h, width: 300.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: CartPage.deepBlue,
                            ),
                            child: Center(
                              child: Text('Schedule Pickup', style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w500
                              ),),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h,),

                      ],
                    ),
            ),
          )
      ),
    );
  }
}


