// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:ziya_laundry_app/AuthSection/viewmodel/signup_viewmodel.dart';

// class LocationScreen extends StatelessWidget {
//   const LocationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final authVM = Provider.of<AuthViewModel>(context);

//     return Scaffold(
//       backgroundColor: const Color(0xFFEEF2F7), 
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 22.w),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 60.h),
//               Text(
//                 'Your Location',
//                 style: TextStyle(
//                   color: const Color(0xFF002F95),
//                   fontSize: 24.sp,
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               SizedBox(height: 12.h),
//               Text(
//                 'We need your location to check service availability and provide accurate delivery estimates',
//                 style: TextStyle(
//                   fontSize: 16.sp,
//                   height: 1.3,
//                   color: Colors.black,
//                   fontFamily: 'Poppins',
//                 ),
//               ),
//               SizedBox(height: 25.h),
//               _buildInfoBox(),
//               SizedBox(height: 30.h),
//               _buildActionButton(
//                 label: 'Use Current Location',
//                 imagePath: 'assets/arrowIcon.png',
//                 onPressed: () {},
//               ),
//               _buildManualDivider(),
//               Text(
//                 'Enter Pin code',
//                 style: TextStyle(
//                   fontSize: 14.sp,
//                   fontWeight: FontWeight.w500,
//                   fontFamily: 'Poppins',
//                   color: Colors.black,
//                 ),
//               ),
//               SizedBox(height: 10.h),

//               // Pincode Input Row
//               Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       height: 52.h,
//                       decoration: BoxDecoration(
//                         border: Border.all(color: const Color(0xFFBDBDBD)),
//                         color: const Color(0xFFE2EFFF), // Input field blue
//                         borderRadius: BorderRadius.circular(10.r),
//                       ),
//                       child: TextField(
//                         keyboardType: TextInputType.number,
//                         onChanged: authVM.updatePincode,
//                         textAlignVertical: TextAlignVertical.center,
//                         style: TextStyle(fontSize: 18.sp, color: const Color(0xFF4B4B4B)),
//                         decoration: InputDecoration(
//                           hintText: "683851",
//                           hintStyle: TextStyle(color: const Color(0xFF4B4B4B).withOpacity(0.5)),
//                           contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 12.w),
//                   _buildCheckButton(onPressed: authVM.checkLocationAvailability),
//                 ],
//               ),

//               SizedBox(height: 25.h),

//               // Conditional UI: Map or Status Boxes
//               if (!authVM.isPincodeChecked)
//                 _buildMapPlaceholder()
//               else
//                 _buildStatusBox(
//                   isSuccess: authVM.isServiceAvailable,
//                   title: authVM.isServiceAvailable
//                       ? "Great! We serve your area"
//                       : "Sorry! We don't serve your area yet",
//                   message: authVM.isServiceAvailable
//                       ? "You can now enjoy our premium laundry services"
//                       : "Currently, our premium laundry services are not available for this pincode.",
//                 ),

//               if (authVM.isPincodeChecked) ...[
//                 SizedBox(height: 20.h),
//                 _buildShadowedButton(
//                   label: "Continue to Home",
//                   onPressed: () {},
//                 ),
//               ],

//               SizedBox(height: 20.h),
//               _buildTipBox(),
//               SizedBox(height: 40.h),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Divider from Figma
//   Widget _buildManualDivider() {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 20.h),
//       child: Row(
//         children: [
//           const Expanded(child: Divider(color: Color(0xFFBDBDBD))),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10.w),
//             child: Text(
//               "or enter manually",
//               style: TextStyle(color: const Color(0xFF757575), fontSize: 14.sp),
//             ),
//           ),
//           const Expanded(child: Divider(color: Color(0xFFBDBDBD))),
//         ],
//       ),
//     );
//   }

// Widget _buildStatusBox({
//   required bool isSuccess,
//   required String title,
//   required String message,
// }) {
//   return Container(
//     width: double.infinity,
//     padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
//     decoration: BoxDecoration(
//       color: const Color(0xFFEAF3FF),
//       borderRadius: BorderRadius.circular(12.r),
//       border: Border.all(
//         color: const Color(0xFF9EC5FF),
//         width: 1,
//       ),
//     ),
//     child: Row(
//       crossAxisAlignment: CrossAxisAlignment.center, // ✅ KEY FIX
//       children: [
//         Center(
//           child: Image.asset(
//             isSuccess
//                 ? 'assets/TickMark.png'
//                 : 'assets/closeIMG.png',
//             width: 26.w,
//             height: 26.w,
//             fit: BoxFit.contain,
//           ),
//         ),
//         SizedBox(width: 12.w),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center, // ✅ aligns text block
//             children: [
//               Text(
//                 title,
//                 style: TextStyle(
//                   fontSize: 16.sp,
//                   fontWeight: FontWeight.w600,
//                   fontFamily: 'Poppins',
//                   color: Colors.black,
//                 ),
//               ),
//               SizedBox(height: 4.h),
//               Text(
//                 message,
//                 style: TextStyle(
//                   fontSize: 14.sp,
//                   height: 1.4,
//                   fontFamily: 'Poppins',
//                   color: Colors.black,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }


//   Widget _buildShadowedButton({required String label, required VoidCallback onPressed}) {
//     return Container(
//       width: double.infinity,
//       height: 52.h,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10.r),
//         boxShadow: const [
//           BoxShadow(
//             color: Color(0x40000000), // #00000040
//             offset: Offset(0, 0),
//             blurRadius: 0,
//             spreadRadius: 1, // Creates the 1px solid border effect
//           ),
//         ],
//       ),
//       child: ElevatedButton(
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: const Color(0xFF002F95),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
//           elevation: 0, 
//         ),
//         child: Text(
//           label,
//           style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w500),
//         ),
//       ),
//     );
//   }

//   Widget _buildCheckButton({required VoidCallback onPressed}) {
//     return SizedBox(
//       width: 100.w,
//       height: 52.h,
//       child: ElevatedButton(
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: const Color(0xFF0053CF),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
//           elevation: 0,
//         ),
//         child: Text('Check', style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600)),
//       ),
//     );
//   }

//   Widget _buildInfoBox() {
//     return Container(
//       width: 331.w,
//       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
//       decoration: BoxDecoration(
//         color: const Color(0xFFDBEBFF),
//         borderRadius: BorderRadius.circular(10.r),
//         border: Border.all(
//           color: Colors.black.withOpacity(0.1),
//           width: 1,
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min, 
//         children: [
//           Text(
//             'Why we need this:',
//             style: TextStyle(
//               fontSize: 16.sp,
//               fontWeight: FontWeight.w500,
//               fontFamily: 'Poppins',
//               color: Colors.black,
//             ),
//           ),
//           SizedBox(height: 6.h),
//           _buildInfoItem('Check if we serve your area'),
//           _buildInfoItem('Provide accurate delivery times'),
//           _buildInfoItem('Find nearest pickup points'),
//         ],
//       ),
//     );
//   }

//   Widget _buildInfoItem(String text) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 4.h), 
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: EdgeInsets.only(top: 2.h),
//             child: Text(
//               '•',
//               style: TextStyle(
//                 fontSize: 16.sp,
//                 height: 1,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//           SizedBox(width: 6.w),
//           Expanded(
//             child: Text(
//               text,
//               style: TextStyle(
//                 fontSize: 14.sp,
//                 height: 1.35,
//                 fontFamily: 'Poppins',
//                 color: Colors.black,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }


//   Widget _buildMapPlaceholder() {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(12.r),
//       child: Image.asset(
//         "assets/googleMap.png",
//         height: 180.h,
//         width: double.infinity,
//         fit: BoxFit.cover,
//       ),
//     );
//   }

//   Widget _buildActionButton({required String label, required String imagePath, required VoidCallback onPressed}) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         backgroundColor: const Color(0xFF002F95),
//         minimumSize: Size(double.infinity, 52.h),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
//         elevation: 0,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.asset(imagePath, width: 22.w, height: 22.w, color: Colors.white),
//           SizedBox(width: 10.w),
//           Text(label, style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w600)),
//         ],
//       ),
//     );
//   }

//   Widget _buildTipBox() {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10.r),
//         border: Border.all(color: const Color(0xFFD1D1D1)),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Text('💡', style: TextStyle(fontSize: 16)),
//           SizedBox(width: 8.w),
//           Text(
//             'Tip: You can save multiple addresses after login',
//             style: TextStyle(fontSize: 12.sp, color: Colors.black),
//           ),
//         ],
//       ),
//     );
//   }
// }
  // import 'package:flutter/material.dart';
  // import 'package:flutter_screenutil/flutter_screenutil.dart';
  // import 'package:provider/provider.dart';
  // import 'package:ziya_laundry_app/AuthSection/viewmodel/signup_viewmodel.dart';

  // class LocationScreen extends StatelessWidget {
  //   const LocationScreen({super.key});

  //   @override
  //   Widget build(BuildContext context) {
  //     final authVM = Provider.of<AuthViewModel>(context);

  //     return Scaffold(
  //       backgroundColor: const Color(0xFFEEF2F7),
  //       resizeToAvoidBottomInset: true,
  //       body: SafeArea(
  //         child: SingleChildScrollView(
  //           keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
  //           child: Padding(
  //             padding: EdgeInsets.symmetric(horizontal: 22.w),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 SizedBox(height: 40.h),

  //                 Text(
  //                   'Your Location',
  //                   style: TextStyle(
  //                     color: const Color(0xFF002F95),
  //                     fontSize: 24.sp,
  //                     fontFamily: 'Poppins',
  //                     fontWeight: FontWeight.w600,
  //                   ),
  //                 ),

  //                 SizedBox(height: 12.h),

  //                 Text(
  //                   'We need your location to check service availability and provide accurate delivery estimates',
  //                   style: TextStyle(
  //                     fontSize: 16.sp,
  //                     height: 1.3,
  //                     color: Colors.black,
  //                     fontFamily: 'Poppins',
  //                   ),
  //                 ),

  //                 SizedBox(height: 25.h),

  //                 _buildInfoBox(),

  //                 SizedBox(height: 30.h),

  //                 _buildActionButton(
  //                   label: 'Use Current Location',
  //                   imagePath: 'assets/arrowIcon.png',
  //                   onPressed: () {},
  //                 ),

  //                 _buildManualDivider(),

  //                 Text(
  //                   'Enter Pin code',
  //                   style: TextStyle(
  //                     fontSize: 14.sp,
  //                     fontWeight: FontWeight.w500,
  //                     fontFamily: 'Poppins',
  //                     color: Colors.black,
  //                   ),
  //                 ),

  //                 SizedBox(height: 10.h),

  //                 Row(
  //                   children: [
  //                     Expanded(
  //                       child: Container(
  //                         height: 52.h,
  //                         decoration: BoxDecoration(
  //                           border: Border.all(color: const Color(0xFFBDBDBD)),
  //                           color: const Color(0xFFE2EFFF),
  //                           borderRadius: BorderRadius.circular(10.r),
  //                         ),
  //                         child: TextField(
  //                           keyboardType: TextInputType.number,
  //                           onChanged: authVM.updatePincode,
  //                           textAlignVertical: TextAlignVertical.center,
  //                           style: TextStyle(
  //                             fontSize: 18.sp,
  //                             color: const Color(0xFF4B4B4B),
  //                           ),
  //                           decoration: InputDecoration(
  //                             hintText: "683851",
  //                             hintStyle: TextStyle(
  //                               color: const Color(0xFF4B4B4B).withOpacity(0.5),
  //                             ),
  //                             contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
  //                             border: InputBorder.none,
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     SizedBox(width: 12.w),
  //                     _buildCheckButton(
  //                       onPressed: authVM.checkLocationAvailability,
  //                     ),
  //                   ],
  //                 ),

  //                 SizedBox(height: 25.h),

  //                 if (!authVM.isPincodeChecked)
  //                   _buildMapPlaceholder()
  //                 else
  //                   _buildStatusBox(
  //                     isSuccess: authVM.isServiceAvailable,
  //                     title: authVM.isServiceAvailable
  //                         ? "Great! We serve your area"
  //                         : "Sorry! We don't serve your area yet",
  //                     message: authVM.isServiceAvailable
  //                         ? "You can now enjoy our premium laundry services"
  //                         : "Currently, our premium laundry services are not available for this pincode.",
  //                   ),

  //                   SizedBox(height: 20.h),
  //                   _buildShadowedButton(
  //                     label: "Continue to Home",
  //                     onPressed: () {},
  //                   ),
                  

  //                 SizedBox(height: 20.h),

  //                 _buildTipBox(),

  //                 SizedBox(height: 40.h),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     );
  //   }

  //   Widget _buildManualDivider() {
  //     return Padding(
  //       padding: EdgeInsets.symmetric(vertical: 20.h),
  //       child: Row(
  //         children: [
  //           const Expanded(child: Divider(color: Color(0xFFBDBDBD))),
  //           Padding(
  //             padding: EdgeInsets.symmetric(horizontal: 10.w),
  //             child: Text(
  //               "or enter manually",
  //               style: TextStyle(
  //                 color: const Color(0xFF757575),
  //                 fontSize: 14.sp,
  //               ),
  //             ),
  //           ),
  //           const Expanded(child: Divider(color: Color(0xFFBDBDBD))),
  //         ],
  //       ),
  //     );
  //   }

  //   Widget _buildStatusBox({
  //     required bool isSuccess,
  //     required String title,
  //     required String message,
  //   }) {
  //     return Container(
  //       width: double.infinity,
  //       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
  //       decoration: BoxDecoration(
  //         color: const Color(0xFFEAF3FF),
  //         borderRadius: BorderRadius.circular(12.r),
  //         border: Border.all(color: const Color(0xFF9EC5FF)),
  //       ),
  //       child: Row(
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           Image.asset(
  //             isSuccess ? 'assets/TickMark.png' : 'assets/closeIMG.png',
  //             width: 26.w,
  //             height: 26.w,
  //           ),
  //           SizedBox(width: 12.w),
  //           Expanded(
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   title,
  //                   style: TextStyle(
  //                     fontSize: 16.sp,
  //                     fontWeight: FontWeight.w600,
  //                     fontFamily: 'Poppins',
  //                   ),
  //                 ),
  //                 SizedBox(height: 4.h),
  //                 Text(
  //                   message,
  //                   style: TextStyle(
  //                     fontSize: 14.sp,
  //                     height: 1.4,
  //                     fontFamily: 'Poppins',
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     );
  //   }

  //   Widget _buildInfoBox() {
  //     return Container(
  //       width: double.infinity,
  //       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
  //       decoration: BoxDecoration(
  //         color: const Color(0xFFDBEBFF),
  //         borderRadius: BorderRadius.circular(10.r),
  //         border: Border.all(color: Colors.black.withOpacity(0.1)),
  //       ),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             'Why we need this:',
  //             style: TextStyle(
  //               fontSize: 16.sp,
  //               fontWeight: FontWeight.w500,
  //               fontFamily: 'Poppins',
  //             ),
  //           ),
  //           SizedBox(height: 6.h),
  //           _buildInfoItem('Check if we serve your area'),
  //           _buildInfoItem('Provide accurate delivery times'),
  //           _buildInfoItem('Find nearest pickup points'),
  //         ],
  //       ),
  //     );
  //   }

  //   Widget _buildInfoItem(String text) {
  //     return Padding(
  //       padding: EdgeInsets.only(bottom: 4.h),
  //       child: Row(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Padding(
  //             padding: EdgeInsets.only(top: 2.h),
  //             child: Text('•', style: TextStyle(fontSize: 16.sp)),
  //           ),
  //           SizedBox(width: 6.w),
  //           Expanded(
  //             child: Text(
  //               text,
  //               style: TextStyle(
  //                 fontSize: 14.sp,
  //                 height: 1.35,
  //                 fontFamily: 'Poppins',
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     );
  //   }

  //   Widget _buildMapPlaceholder() {
  //     return ClipRRect(
  //       borderRadius: BorderRadius.circular(12.r),
  //       child: Image.asset(
  //         "assets/googleMap.png",
  //         height: 180.h,
  //         width: double.infinity,
  //         fit: BoxFit.cover,
  //       ),
  //     );
  //   }

  //   Widget _buildActionButton({
  //     required String label,
  //     required String imagePath,
  //     required VoidCallback onPressed,
  //   }) {
  //     return ElevatedButton(
  //       onPressed: onPressed,
  //       style: ElevatedButton.styleFrom(
  //         backgroundColor: const Color(0xFF002F95),
  //         minimumSize: Size(300.w, 41.h),
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(10.r),
  //         ),
  //         elevation: 0,
  //       ),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Image.asset(imagePath, width: 22.w, height: 22.w, color: Colors.white),
  //           SizedBox(width: 10.w),
  //           Text(
  //             label,
  //             style: TextStyle(
  //               color: Colors.white,
  //               fontSize: 18.sp,
  //               fontWeight: FontWeight.w600,
  //             ),
  //           ),
  //         ],
  //       ),
  //     );
  //   }

  //   Widget _buildCheckButton({required VoidCallback onPressed}) {
  //     return SizedBox(
  //       width: 100.w,
  //       height: 52.h,
  //       child: ElevatedButton(
  //         onPressed: onPressed,
  //         style: ElevatedButton.styleFrom(
  //           backgroundColor: const Color(0xFF0053CF),
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(10.r),
  //           ),
  //           elevation: 0,
  //         ),
  //         child: Text(
  //           'Check',
  //           style: TextStyle(
  //             color: Colors.white,
  //             fontSize: 16.sp,
  //             fontWeight: FontWeight.w600,
  //           ),
  //         ),
  //       ),
  //     );
  //   }

  //   Widget _buildShadowedButton({
  //     required String label,
  //     required VoidCallback onPressed,
  //   }) {
  //     return Container(
  //       width:300.w,
  //       height: 40.h,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(10.r),
  //         boxShadow: const [
  //           BoxShadow(
  //             color: Color(0x40000000),
  //             spreadRadius: 1,
  //           ),
  //         ],
  //       ),
  //       child: ElevatedButton(
  //         onPressed: onPressed,
  //         style: ElevatedButton.styleFrom(
  //           backgroundColor: const Color(0xFF002F95),
  //           elevation: 0,
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(10.r),
  //           ),
  //         ),
  //         child: Text(
  //           label,
  //           style: TextStyle(
  //             color: Colors.white,
  //             fontSize: 16.sp,
  //             fontWeight: FontWeight.w500,
  //           ),
  //         ),
  //       ),
  //     );
  //   }

  //   Widget _buildTipBox() {
  //     return Container(
  //       width: double.infinity,
  //       padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(10.r),
  //         border: Border.all(color: const Color(0xFFD1D1D1)),
  //       ),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           const Text('💡', style: TextStyle(fontSize: 16)),
  //           SizedBox(width: 8.w),
  //           Text(
  //             'Tip: You can save multiple addresses after login',
  //             style: TextStyle(fontSize: 12.sp),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  // }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ziya_laundry_app/AuthSection/viewmodel/signup_viewmodel.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authVM = Provider.of<AuthViewModel>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFEEF2F7),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),
                Text(
                  'Your Location',
                  style: TextStyle(
                    color: const Color(0xFF002F95),
                    fontSize: 24.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  'We need your location to check service availability and provide accurate delivery estimates',
                  style: TextStyle(
                    fontSize: 16.sp,
                    height: 1.3,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: 25.h),

                // Info Box - Strictly matching Figma 331x114
                Center(child: _buildInfoBox()),

                SizedBox(height: 30.h),

                // Main Action Button
                Center(
                  child: _buildActionButton(
                    label: 'Use Current Location',
                    imagePath: 'assets/arrowIcon.png',
                    onPressed: () {},
                  ),
                ),

                _buildManualDivider(),

                Text(
                  'Enter Pin code',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.h),

                // Pincode Input Row
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 52.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFBDBDBD)),
                          color: const Color(0xFFE2EFFF),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          onChanged: authVM.updatePincode,
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: const Color(0xFF4B4B4B),
                          ),
                          decoration: InputDecoration(
                            hintText: "683851",
                            hintStyle: TextStyle(
                              color: const Color(0xFF4B4B4B).withOpacity(0.5),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    _buildCheckButton(
                      onPressed: authVM.checkLocationAvailability,
                    ),
                  ],
                ),

                SizedBox(height: 25.h),

                // Conditional UI
                if (!authVM.isPincodeChecked)
                  _buildMapPlaceholder()
                else ...[
                  _buildStatusBox(
                    isSuccess: authVM.isServiceAvailable,
                    title: authVM.isServiceAvailable
                        ? "Great! We serve your area"
                        : "Sorry! We don't serve your area yet",
                    message: authVM.isServiceAvailable
                        ? "You can now enjoy our premium laundry services"
                        : "Currently, our premium laundry services are not available for this pincode.",
                  ),
                  if (authVM.isServiceAvailable) ...[
                    SizedBox(height: 20.h),
                    Center(
                      child: _buildShadowedButton(
                        label: "Continue to Home",
                        onPressed: () {},
                      ),
                    ),
                  ]
                ],

                SizedBox(height: 20.h),
                _buildTipBox(),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- UI COMPONENTS ---

  // Widget _buildInfoBox() {
  //   return Container(
  //     width: 331.w,
  //     height: 114.h,
  //     padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
  //     decoration: BoxDecoration(
  //       color: const Color(0xFFDBEBFF),
  //       borderRadius: BorderRadius.circular(10.r),
  //       border: Border.all(color: Colors.black.withOpacity(0.1)),
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Text(
  //           'Why we need this:',
  //           style: TextStyle(
  //             fontSize: 16.sp,
  //             fontWeight: FontWeight.w500,
  //             fontFamily: 'Poppins',
  //             color: Colors.black,
  //           ),
  //         ),
  //         SizedBox(height: 4.h),
  //         _buildInfoItem('Check if we serve your area'),
  //         _buildInfoItem('Provide accurate delivery times'),
  //         _buildInfoItem('Find nearest pickup points'),
  //       ],
  //     ),
  //   );
  // }
  Widget _buildInfoBox() {
  return Container(
    width: 331.w,
    constraints: BoxConstraints(
      minHeight: 114.h, // keeps exact UI height
    ),
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
    decoration: BoxDecoration(
      color: const Color(0xFFDBEBFF),
      borderRadius: BorderRadius.circular(10.r),
      border: Border.all(color: Colors.black.withOpacity(0.1)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Why we need this:',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
            color: Colors.black,
          ),
        ),
        SizedBox(height: 4.h),
        _buildInfoItem('Check if we serve your area'),
        _buildInfoItem('Provide accurate delivery times'),
        _buildInfoItem('Find nearest pickup points'),
      ],
    ),
  );
}


  Widget _buildInfoItem(String text) {
    return Padding(
      padding: EdgeInsets.only(top: 1.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('• ', style: TextStyle(fontSize: 14.sp, color: Colors.black)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14.sp,
                height: 1.2,
                fontFamily: 'Poppins',
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String label,
    required String imagePath,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: 331.w,
      height: 48.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF002F95),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 20.w, height: 20.w, color: Colors.white),
            SizedBox(width: 10.w),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShadowedButton({
    required String label,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 331.w,
      height: 48.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x40000000), // Exact #00000040 shadow
            spreadRadius: 1,
            blurRadius: 0,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF002F95),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }

  Widget _buildStatusBox({
    required bool isSuccess,
    required String title,
    required String message,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF3FF),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFF9EC5FF)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            isSuccess ? 'assets/TickMark.png' : 'assets/closeIMG.png',
            width: 30.w,
            height: 30.w,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 13.sp,
                    height: 1.4,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckButton({required VoidCallback onPressed}) {
    return SizedBox(
      width: 100.w,
      height: 52.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0053CF),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          elevation: 0,
        ),
        child: Text(
          'Check',
          style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildManualDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Row(
        children: [
          const Expanded(child: Divider(color: Color(0xFFBDBDBD))),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              "or enter manually",
              style: TextStyle(color: const Color(0xFF757575), fontSize: 14.sp),
            ),
          ),
          const Expanded(child: Divider(color: Color(0xFFBDBDBD))),
        ],
      ),
    );
  }

  Widget _buildMapPlaceholder() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: Image.asset(
        "assets/googleMap.png",
        height: 180.h,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildTipBox() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: const Color(0xFFD1D1D1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('💡', style: TextStyle(fontSize: 16)),
          SizedBox(width: 8.w),
          Text(
            'Tip: You can save multiple addresses after login',
            style: TextStyle(fontSize: 12.sp, fontFamily: 'Poppins'),
          ),
        ],
      ),
    );
  }
}