import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziya_laundry_app/Cart/View/cart_screen.dart';
import 'package:ziya_laundry_app/home/View/home_screen.dart';
import 'package:ziya_laundry_app/Orders/View/order_screen.dart';
import 'package:ziya_laundry_app/RateList/View/rate_screen.dart';


class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {

  int _currentIndex=0;

  final List<Widget> _pages =  [
   HomePage(),
    OrderPage(),
    CartPage(),
    RatePage(),
    Center(child: Text("Profile")),
  ];

  final List<String> _icons = [
    "assets/home.png",
    "assets/orders.png",
    "assets/cart.png",
    "assets/ratelist.png",
    "assets/account.png"
  ];

  final List<String> _labels = [
    "Home",
    "Orders",
    "Cart",
    "Rate List",
    "Account",
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: HomePage.bgColor,
     body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        height: 68.h,
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black12,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_icons.length, (index) {
            final isSelected = _currentIndex == index;

            return GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = index;
                });
              },
              child: AnimatedContainer(
                height: 48.h, width: 49.w,
                duration: const Duration(milliseconds: 250),
                padding: EdgeInsets.symmetric(vertical: 6.h,horizontal: 16.w),
                decoration: BoxDecoration(
                  color: isSelected ? CartPage.deepBlue : Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      _icons[index],
                      height: 19.h, width: 17.w,
                      color: isSelected ? Colors.white : Colors.grey,
                    ),
                    const SizedBox(height: 2,),
                    FittedBox(
                      child: Text(
                        _labels[index],
                        style: GoogleFonts.poppins(
                          fontSize: 10.sp,
                          color: isSelected ? Colors.white : Colors.grey,
                          fontWeight:
                          isSelected ? FontWeight.w500 : FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                )
              ),
            );
          }),
        ),
      ),
    );
  }
}
