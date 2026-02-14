// import 'package:flutter/material.dart';

// class NewPassword extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           width: 375,
//           height: 812,
//           clipBehavior: Clip.antiAlias,
//           decoration: BoxDecoration(color: const Color(0xFFFBFBFB)),
//           child: Stack(
//             children: [
//               Positioned(
//                 left: 35,
//                 top: 131,
//                 child: Container(
//                   width: 305,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     spacing: 237,
//                     children: [
//                       Container(
//                         width: double.infinity,
//                         padding: const EdgeInsets.symmetric(horizontal: 92),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           spacing: 10,
//                           children: [
//                             Text(
//                               'New Password',
//                               style: TextStyle(
//                                 color: const Color(0xFF141414),
//                                 fontSize: 18,
//                                 fontFamily: 'Roboto',
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             Container(
//                               width: 40,
//                               height: 34,
//                               decoration: ShapeDecoration(
//                                 color: const Color(0xFFFBFBFB),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
//                               ),
//                             ),
//                             Text(
//                               'Enter New Password',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 14,
//                                 fontFamily: 'Roboto',
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                             Text(
//                               'Confirm Password',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 14,
//                                 fontFamily: 'Roboto',
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                             Text(
//                               '8 symbols at least',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 color: const Color(0xFFB4B4B4),
//                                 fontSize: 10,
//                                 fontFamily: 'Roboto',
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                             SizedBox(
//                               width: 49,
//                               height: 7,
//                               child: Text(
//                                 '********',
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   color: const Color(0xFFB4B4B4),
//                                   fontSize: 14,
//                                   fontFamily: 'Roboto',
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         width: double.infinity,
//                         height: 40,
//                         padding: const EdgeInsets.symmetric(horizontal: 133, vertical: 5),
//                         decoration: ShapeDecoration(
//                           color: const Color(0xFF002F95),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           shadows: [
//                             BoxShadow(
//                               color: Color(0x3F000000),
//                               blurRadius: 4,
//                               offset: Offset(0, 5),
//                               spreadRadius: 0,
//                             )
//                           ],
//                         ),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           spacing: 10,
//                           children: [
//                             Text(
//                               'Submit',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                                 fontFamily: 'Roboto',
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 35.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40.h),
              
              // Title
              Text(
                'New Password',
                style: TextStyle(
                  color: const Color(0xFF141414),
                  fontSize: 18.sp,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
              
              SizedBox(height: 60.h),

              // Enter New Password Field
              _buildInputField(
                label: 'Enter New Password',
                hint: '8 symbols at least',
                controller: _passwordController,
              ),

              SizedBox(height: 25.h),

              // Confirm Password Field
              _buildInputField(
                label: 'Confirm Password',
                hint: '********',
                controller: _confirmController,
              ),

              SizedBox(height: 52.h),

              // Submit Button
              _buildSubmitButton(
                onPressed: () {
                  // Add logic here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
  required String label,
  required String hint,
  required TextEditingController controller,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          color: Colors.black,
          fontSize: 14.sp,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
      ),
      SizedBox(height: 8.h),
      Container(
        width: 304.w,
        constraints: BoxConstraints(
          minHeight: 35.h, // ✅ keeps exact visual height
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: const Color(0xFF319F43)),
        ),
        child: TextField(
          controller: controller,
          obscureText: true,
          textAlignVertical: TextAlignVertical.center,
          style: TextStyle(fontSize: 14.sp),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
            hintText: hint,
            hintStyle: TextStyle(
              color: const Color(0xFFB4B4B4),
              fontSize: 14.sp,
              fontFamily: 'Roboto',
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    ],
  );
}


  // Widget _buildInputField({
  //   required String label,
  //   required String hint,
  //   required TextEditingController controller,
  // }) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         label,
  //         style: TextStyle(
  //           color: Colors.black,
  //           fontSize: 14.sp,
  //           fontFamily: 'Roboto',
  //           fontWeight: FontWeight.w400,
  //         ),
  //       ),
  //       SizedBox(height: 8.h),
  //       Container(
  //         width: 304.w,
  //         height: 35.h,
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(10.r),
  //           border: Border.all(color: const Color(0xFF319F43)),
  //         ),
  //         child: TextField(
  //           controller: controller,
  //           obscureText: true,
  //           textAlignVertical: TextAlignVertical.center,
  //           style: TextStyle(fontSize: 14.sp),
  //           decoration: InputDecoration(
  //             contentPadding: EdgeInsets.fromLTRB(15.w, 0, 15.w, 0),
  //             hintText: hint,
  //             hintStyle: TextStyle(
  //               color: const Color(0xFFB4B4B4),
  //               fontSize: 14.sp,
  //               fontFamily: 'Roboto',
  //             ),
  //             border: InputBorder.none,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget _buildSubmitButton({required VoidCallback onPressed}) {
    return Container(
      width: double.infinity,
      height: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0x3F000000),
            blurRadius: 4.r,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF002F95),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          elevation: 0,
        ),
        child: Text(
          'Submit',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}