import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFF00E51);
  static const Color secondary = Color(0xFFFF9E1B);
  static const Color ligthBackground = Color(0xffff8dbcf);
  static const Color darkBackground = Color(0xff1f1f1f);
  static const Color titleColor = Color(0xfffa6a6a6);

  static const primaryGradient = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );
}
