import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ziya_laundry_app/AuthSection/view/LoginScreen.dart';
import 'package:ziya_laundry_app/AuthSection/viewmodel/signup_viewmodel.dart';
import 'package:ziya_laundry_app/AuthSection/widgets/TopRightCurveClipper.dart';
import 'package:ziya_laundry_app/AuthSection/widgets/gradient_logo.dart';
import 'package:ziya_laundry_app/AuthSection/widgets/reusable%20input_field.dart';
import 'package:ziya_laundry_app/constants/app_colors.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Stack(
                  children: [
                    SizedBox(
                      height: 0.45.sh,
                      width: 1.sw,
                      child: Image.asset(
                        'assets/signUp_Img.png',
                        fit: BoxFit.cover,
                      ),
                    ),

                    Positioned(
                      top: 190.h,
                      left: 20.w,
                      child: const GradientLogo(),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 0.28.sh),
                      child: ClipPath(
                        clipper: TopRightCurveClipper(),
                        child: Container(
                          width: 1.sw,
                          padding: EdgeInsets.fromLTRB(
                            24.w,
                            28.h,
                            24.w,
                            MediaQuery.of(context).viewInsets.bottom + 30.h,
                          ),
                          color: Colors.white,
                          child: Consumer<AuthViewModel>(
                            builder: (_, vm, __) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Welcome',
                                    style: TextStyle(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    'Login to continue your laundry journey',
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  SizedBox(height: 18.h),
 InputField(
  label: 'Name',
  hint: 'name',
  onChanged: vm.updateSignupName,
  errorText: vm.signupNameError,
),
InputField(
  label: 'Mobile Number',
  hint: '0000000000',
  onChanged: vm.updateSignupMobile,
  errorText: vm.signupMobileError,
),

InputField(
  label: 'Password',
  hint: '********',
  obscure: true,
  onChanged: vm.updateSignupPassword,
  errorText: vm.signupPasswordError,
),

InputField(
  label: 'Confirm Password',
  hint: '********',
  obscure: true,
  onChanged: vm.updateConfirmPassword,
  errorText: vm.confirmPasswordError,
),


                                  Row(
                                    children: [
                                      Checkbox(
                                        value: vm.isAgreed,
                                        activeColor: const Color(0xFF0064D7),
                                        onChanged: (v) =>
                                            vm.toggleAgreement(v ?? false),
                                      ),
                                      Text(
                                        'I agree with the Terms & Conditions',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 16.h),

                                  SizedBox(
                                    width: 1.sw,
                                    height: 48.h,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            AppColors.primaryBlue,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.r),
                                        ),
                                      ),
                                    onPressed: () {
                                      if (vm.submitSignup()) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const LoginScreen(),
                                          ),
                                        );
                                      }
                                    },
                                      child: Text(
                                        'Sign Up',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
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
