import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ziya_laundry_app/AuthSection/view/NewPassword%20.dart';
import 'package:ziya_laundry_app/AuthSection/viewmodel/signup_viewmodel.dart';

class ForgotOTP extends StatefulWidget {
  const ForgotOTP({super.key});

  @override
  State<ForgotOTP> createState() => _ForgotOTPState ();
}

class _ForgotOTPState extends State<ForgotOTP> {
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(4, (_) => FocusNode());
    _controllers = List.generate(4, (_) => TextEditingController());

    // Clear OTP when entering the screen
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthViewModel>().clearOtp();
    });
  }

  @override
  void dispose() {
    for (var node in _focusNodes) node.dispose();
    for (var controller in _controllers) controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color resendGreen = Color(0xFF6EBC45);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          children: [
            SizedBox(height: 40.h),
            
            // Header Text
            Text(
              'Verification',
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: const Color(0xFF333333),
              ),
            ),
            SizedBox(height: 12.h),
            
            // Description Text
            Text(
              'An 4 digit OTP has been sent to\n91**********',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: const Color(0xFF666666),
                height: 1.5,
              ),
            ),
            SizedBox(height: 50.h),

            // OTP Input Fields Row
            Consumer<AuthViewModel>(
              builder: (context, vm, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) {
                    return _otpBox(
                        context, index, vm.otpStatus[index], vm);
                  }),
                );
              },
            ),
            SizedBox(height: 40.h),

            // Timer and Resend Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Wait for 00:52 ',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color.fromARGB(255, 59, 59, 59),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Resend Logic
                  },
                  child: Text(
                    'Resend OTP',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: resendGreen,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Individual OTP Square Widget
  Widget _otpBox(
      BuildContext context, int index, bool? isValid, AuthViewModel vm) {
    Color borderColor;
    if (isValid == null) {
      borderColor = const Color(0xFFD1D8E0); // Default Grey
    } else if (isValid) {
      borderColor = Colors.green; // Correct
    } else {
      borderColor = Colors.red; // Wrong
    }

    return Container(
      width: 55.w,
      height: 55.w,
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FB),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: borderColor, width: 1.5),
      ),
      child: Center(
        child: TextField(
  controller: _controllers[index],
  focusNode: _focusNodes[index],
  textAlign: TextAlign.center,
  keyboardType: TextInputType.number,
  maxLength: 1,

  obscureText: true,           
  obscuringCharacter: '*',     

  style: TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: const Color(0xFF002F95),
  ),

  decoration: const InputDecoration(
    counterText: "",
    border: InputBorder.none,
  ),

  onChanged: (value) {
    if (value.isEmpty) {
      vm.setOtpDigit(index, '');
      if (index > 0) {
        FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
      }
      return;
    }

    // 🔹 Keep ONLY last digit
    final digit = value[value.length - 1];
    _controllers[index].text = digit;

    vm.setOtpDigit(index, digit);

    if (index < 3) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    } else {
      FocusScope.of(context).unfocus();
      if (vm.isOtpValid) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => NewPasswordScreen(),
          ),
        );
      }
    }
  },
),

      ),
    );
  }
}