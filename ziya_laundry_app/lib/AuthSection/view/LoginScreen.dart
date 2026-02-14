
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ziya_laundry_app/AuthSection/viewmodel/signup_viewmodel.dart';
import 'package:ziya_laundry_app/AuthSection/view/VerificationScreen.dart';
import 'package:ziya_laundry_app/AuthSection/view/ForgotPassword.dart';
import 'package:ziya_laundry_app/AuthSection/widgets/gradient_logo.dart';
import 'package:ziya_laundry_app/AuthSection/widgets/reusable%20input_field.dart';


import 'dart:ui' show Path;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double height = constraints.maxHeight;

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: height),
                child: Stack(
                  children: [
                    /// 🔹 BACKGROUND IMAGE
                    SizedBox(
                      height: height * 0.45,
                      width: 1.sw,
                      child: Image.asset(
                        'assets/login_img (2).jpg',
                        fit: BoxFit.cover,
                      ),
                    ),

                    /// 🔹 LOGO
                    Positioned(
                      top: height * 0.25,
                      left: 20.w,
                      child: GradientLogo()
                    ),
                     
                    /// 🔹 WHITE CARD
                    Positioned(
                      top: height * 0.32,
                      left: 0,
                      right: 0,
                      child: ClipPath(
                        clipper: _TopCurveClipper(),
                        child: Container(
                          width: 1.sw,
                          padding: EdgeInsets.fromLTRB(
                            24.w,
                            28.h,
                            24.w,
                            MediaQuery.of(context).viewInsets.bottom + 32.h,
                          ),
                          color: Colors.white,
                          child: Consumer<AuthViewModel>(
                            builder: (_, vm, __) {
                              return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Welcome Back',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 20.h),

                              InputField(
                                label: 'Name',
                                hint: 'name',
                                onChanged: vm.updateLoginName,
                                errorText: vm.loginNameError,
                              ),

                              InputField(
                                label: 'Mobile Number',
                                hint: '0000000000',
                                onChanged: vm.updateLoginMobile,
                                errorText: vm.loginMobileError,
                              ),

                              InputField(
                                label: 'Password',
                                hint: '********',
                                obscure: true,
                                onChanged: vm.updateLoginPassword,
                                errorText: vm.loginPasswordError,
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                children: [
                                  Checkbox(
                                    value: vm.isRememberMe,
                                    onChanged: (v) => vm.toggleRememberMe(v ?? false),
                                  ),
                                  Text(
                                    'Remember Me',
                                    style: TextStyle(fontSize: 12.sp),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const ForgotPassword()),
                                      );
                                    },
                                    child: Text(
                                      'Forgot Password',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 20.h),

                              SizedBox(
                                width: 1.sw,
                                height: 48.h,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF002F95),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (vm.submitLogin()) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const VerificationScreen(),
                                        ),
                                      );
                                    }
                                  },
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 12.h),
                            ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


/// 🔹 CURVED SHAPE
class _TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width - 160, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 160);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
