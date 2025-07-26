import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meditation_center/utils/app.colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.whiteColor,
    primaryColor: AppColors.primaryColor,
    // fontFamily: GoogleFonts.poppins().fontFamily,
    fontFamily: GoogleFonts.raleway().fontFamily,
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 25,
        color: AppColors.textColor,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        fontSize: 18,
        color: AppColors.textColor,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontSize: 16,
        color: AppColors.textColor,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
