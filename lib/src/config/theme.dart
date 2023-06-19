import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: LightThemeColors.descTextColor,
        fontSize: 16,
        height: 24 / 16,
      ),
      bodyLarge: TextStyle(
        color: LightThemeColors.titleItemTextColor,
        fontSize: 18,
        height: 1.5,
      ),
      labelMedium: TextStyle(
        color: LightThemeColors.titleItemTextColor,
        fontSize: 22,
        height: 28 / 22,
        fontWeight: FontWeight.w600,
      ),
      labelLarge: TextStyle(
        color: LightThemeColors.titleTextColor,
        fontSize: 30,
        height: 1.2,
        fontWeight: FontWeight.bold,
      ),
    ),
    fontFamily: GoogleFonts.openSans().fontFamily,
    scaffoldBackgroundColor: LightThemeColors.background,
    cardColor: LightThemeColors.itemColor,
    canvasColor: LightThemeColors.itemColor,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );

  static ThemeData darkTheme = ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    colorScheme: const ColorScheme.dark(),
  );
}
