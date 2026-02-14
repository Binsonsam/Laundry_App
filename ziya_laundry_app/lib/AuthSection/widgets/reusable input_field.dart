
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ziya_laundry_app/constants/app_colors.dart';

class InputField extends StatelessWidget {
  final String label;
  final String hint;
  final bool obscure;
  final ValueChanged<String>? onChanged;
  final String? errorText;
  final TextEditingController? controller;

  const InputField({
    super.key,
    required this.label,
    required this.hint,
    this.obscure = false,
    this.onChanged,
    this.errorText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 14.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Label
          Text(
            label,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.labelGray,
            ),
          ),
          SizedBox(height: 6.h),

          /// Input Field
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x80404040),
                  blurRadius: 0,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: TextField(
              controller: controller,
              obscureText: obscure,
              onChanged: onChanged,

              /// 🔹 INTERNAL RESPONSIVENESS FIX
              style: TextStyle(
                fontSize: 13.sp,
                height: 1.25, // keeps text vertically centered
                color: Colors.black,
              ),

              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  fontSize: 13.sp,
                  height: 1.25,
                  color: AppColors.hintGray,
                ),

                filled: true,
                fillColor: Colors.white,

                isDense: true, // 🔥 critical – prevents scaling issues

                contentPadding: EdgeInsets.symmetric(
                  horizontal: 14.w,
                  vertical: 14.h, // unchanged visual height
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.r),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          /// Error Text (CUSTOM – NO LAYOUT BREAK)
          if (errorText != null) ...[
            SizedBox(height: 4.h),
            Padding(
              padding: EdgeInsets.only(left: 6.w),
              child: Text(
                errorText!,
                style: TextStyle(
                  fontSize: 11.5.sp,
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
