import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///text widget////
class AppText extends StatelessWidget {
  final String text;
  final double fontsize;
  final FontWeight fontweight;
  final Color color;
  const AppText({
    super.key,
    required this.text,
    required this.fontsize,
    required this.fontweight,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: GoogleFonts.poppins(
      fontSize: fontsize,
    fontWeight: fontweight,
    color: color,
      ),);
  }
}

////container widget//
class AppContainer extends StatelessWidget {
  final double h;
  final double w;
  final double borderRadius;
  final Color color;
  final Widget child;

  const AppContainer({
    super.key, required this.h, required this.w, required this.borderRadius, required this.color, required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h,
      width: w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: color,
      ),
      child: child,
    );
  }
}


