import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle regular = GoogleFonts.openSans(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.3,
      color: const Color(0xFFFFFFFF));

  static TextStyle medium = regular.copyWith(
      fontSize: 20, fontWeight: FontWeight.w700, letterSpacing: -0.3);
}
