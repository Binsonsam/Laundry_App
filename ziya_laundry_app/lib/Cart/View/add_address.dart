import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziya_laundry_app/home/View/home_screen.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomePage.bgColor,
      body: SafeArea(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        SizedBox(height: 10.h,),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: IconButton(onPressed: (){
                Navigator.pop(context);
              },
                  icon: Icon(Icons.arrow_back_ios,size: 24,)),
            ),
            Text('Edit Address', style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, fontSize: 18.sp
                ),),
          ],
            ),
          SizedBox(height: 20.h,),
          Column(
            children: [
              _buildCard(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          _buildTextField('Name *', 'Name'),
                          _buildTextField('Mobile *', 'Mobile'),
                        ],
                      ),
                    ],
                  )),

              _buildCard(child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: _buildTextField('Pincode *', 'Pincode')),
                      Expanded(child: _buildTextField('State *', 'State')),
                    ],
                  ),
                ],
              )),

            ],
          )
          ],
        ),
      ),
    );
  }

  /// CARD CONTAINER
  Widget _buildCard({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.only(left: 23,right: 22,bottom: 20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: const [
            BoxShadow(
              blurRadius: 3,
              color: Colors.black12,
            )
          ],
        ),
        child: child,
      ),
    );
  }

  /// TEXTFIELD DESIGN
  Widget _buildTextField(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,labelStyle: GoogleFonts.poppins(fontSize: 12.sp,fontWeight: FontWeight.w400),
          hintText: hint,
          border: const UnderlineInputBorder(),
        ),
      ),
    );
  }
}

