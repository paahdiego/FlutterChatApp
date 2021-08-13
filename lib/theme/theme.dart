import 'package:flutter/material.dart';
import 'package:flutter_chat_app/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
export './app_colors.dart';
export './app_images.dart';

class AppTheme {
  static ThemeData lightThemeData(BuildContext context) {
    final appBarTheme = AppBarTheme(centerTitle: false, elevation: 0);
    return ThemeData.light().copyWith(
      primaryColor: AppColors.kPrimaryColor,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: appBarTheme,
      iconTheme: IconThemeData(color: AppColors.kContentColorLightTheme),
      textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
          .apply(bodyColor: AppColors.kContentColorLightTheme),
      colorScheme: ColorScheme.light(
        primary: AppColors.kPrimaryColor,
        secondary: AppColors.kSecondaryColor,
        error: AppColors.kErrorColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.kContentColorLightTheme.withOpacity(0.7),
        unselectedItemColor:
            AppColors.kContentColorLightTheme.withOpacity(0.32),
        selectedIconTheme: IconThemeData(color: AppColors.kPrimaryColor),
        showUnselectedLabels: true,
      ),
    );
  }

  static ThemeData darkThemeData(BuildContext context) {
    final appBarTheme = AppBarTheme(centerTitle: false, elevation: 0);
    return ThemeData.dark().copyWith(
      primaryColor: AppColors.kPrimaryColor,
      scaffoldBackgroundColor: AppColors.kContentColorLightTheme,
      appBarTheme: appBarTheme,
      iconTheme: IconThemeData(color: AppColors.kContentColorDarkTheme),
      textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
          .apply(bodyColor: AppColors.kContentColorDarkTheme),
      colorScheme: ColorScheme.dark().copyWith(
        primary: AppColors.kPrimaryColor,
        secondary: AppColors.kSecondaryColor,
        error: AppColors.kErrorColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.kContentColorLightTheme,
        selectedItemColor: Colors.white70,
        unselectedItemColor: AppColors.kContentColorDarkTheme.withOpacity(0.32),
        selectedIconTheme: IconThemeData(color: AppColors.kPrimaryColor),
        showUnselectedLabels: true,
      ),
    );
  }
}
