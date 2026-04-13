import 'package:flutter/material.dart';
import 'package:habit_flow/core/utils/habitflow_colors.dart';

class HabitFlowTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: HabitFlowColors.surface,
    fontFamily: 'Arial',

    colorScheme: ColorScheme.light(
      primary: HabitFlowColors.primaryBlue,
      secondary: HabitFlowColors.accentPurple,
      surface: HabitFlowColors.surface,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: HabitFlowColors.textPrimary,
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: HabitFlowColors.textPrimary,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: HabitFlowColors.textPrimary,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: HabitFlowColors.textPrimary,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: HabitFlowColors.textSecondary,
      ),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: HabitFlowColors.textPrimary),
      titleTextStyle: TextStyle(
        color: HabitFlowColors.textPrimary,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    cardTheme: CardThemeData(
      color: HabitFlowColors.surfaceAlt,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: HabitFlowColors.primaryBlue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: HabitFlowColors.surfaceAlt,
      hintStyle: const TextStyle(color: HabitFlowColors.textSecondary),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: HabitFlowColors.primaryBlue,
          width: 1.5,
        ),
      ),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: HabitFlowColors.surface,
      selectedItemColor: HabitFlowColors.primaryBlue,
      unselectedItemColor: HabitFlowColors.textSecondary,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: HabitFlowColors.darkBg,

    colorScheme: ColorScheme.dark(
      primary: HabitFlowColors.primaryBlue,
      secondary: HabitFlowColors.accentPurple,
      surface: HabitFlowColors.darkSurface,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: HabitFlowColors.darkTextPrimary,
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: HabitFlowColors.darkTextPrimary,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: HabitFlowColors.darkTextPrimary,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: HabitFlowColors.darkTextPrimary,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: HabitFlowColors.darkTextSecondary,
      ),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: HabitFlowColors.darkTextPrimary),
      titleTextStyle: TextStyle(
        color: HabitFlowColors.darkTextPrimary,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    cardTheme: CardThemeData(
      color: HabitFlowColors.darkSurface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: HabitFlowColors.primaryBlue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
  );
}