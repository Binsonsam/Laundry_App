
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ziya_laundry_app/AuthSection/view/signup_screen.dart';
import 'package:ziya_laundry_app/AuthSection/view/VerificationScreen.dart';
import 'package:ziya_laundry_app/AuthSection/view/ForgotOTP.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.h),

                /// Back Arrow
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: Icon(Icons.arrow_back, size: 22.sp),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),

                SizedBox(height: 20.h),

                /// Title
                Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto',
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 60.h),

                /// Label
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter Phone No:',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto',
                      color: Colors.black,
                    ),
                  ),
                ),

                SizedBox(height: 10.h),

                /// Phone Input (Responsive & Centered)
                SizedBox(
                  height: 40.h,
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    style: TextStyle(fontSize: 14.sp),
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 10.h,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide:
                            const BorderSide(color: Color(0xFF319F43)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide:
                            const BorderSide(color: Color(0xFF319F43)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide:
                            const BorderSide(color: Color(0xFF319F43)),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 25.h),

                /// Back to Sign in
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Text(
                    'Back to sign in',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xFF2196F3),
                      fontFamily: 'Roboto',
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),

                SizedBox(height: 30.h),

                /// Get OTP Button (No fixed width)
                SizedBox(
                  width: double.infinity,
                  height: 40.h,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ForgotOTP()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF002F96),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Text(
                      'Get OTP',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Roboto',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30.h),

                /// Footer Text
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'Roboto',
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 49.h),

                /// Sign up Button
                SizedBox(
                  width: double.infinity,
                  height: 36.h,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignupScreen()),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Color(0xFF319F43)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      elevation: 2,
                    ),
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'Roboto',
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
