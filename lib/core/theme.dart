import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Dark Mode Palette
  static const Color darkBackground = Color(0xFF171614);
  static const Color darkSurface = Color(0xFF1C1B19);
  static const Color darkTextPrimary = Color(0xFFCDCCCA);
  static const Color darkAccent = Color(0xFF4F98A3);
  static const Color darkTextMuted = Color(0xFF797876);

  // Light Mode Palette
  static const Color lightBackground = Color(0xFFF7F6F2);
  static const Color lightSurface = Color(0xFFF9F8F5);
  static const Color lightTextPrimary = Color(0xFF28251D);
  static const Color lightAccent = Color(0xFF01696F);
  static const Color lightTextMuted = Color(0xFF7A7974);

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkBackground,
      colorScheme: const ColorScheme.dark(
        surface: darkSurface,
        primary: darkAccent,
        onSurface: darkTextPrimary,
      ),
      textTheme: GoogleFonts.interTextTheme().copyWith(
        displayLarge: GoogleFonts.playfairDisplay(
          fontSize: 48,
          fontWeight: FontWeight.bold,
          color: darkTextPrimary,
        ),
        displayMedium: GoogleFonts.playfairDisplay(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: darkTextPrimary,
        ),
        displaySmall: GoogleFonts.playfairDisplay(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: darkTextPrimary,
        ),
        bodyLarge: GoogleFonts.inter(fontSize: 18, color: darkTextPrimary),
        bodyMedium: GoogleFonts.inter(fontSize: 16, color: darkTextPrimary),
        bodySmall: GoogleFonts.inter(fontSize: 14, color: darkTextMuted),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: lightBackground,
      colorScheme: const ColorScheme.light(
        surface: lightSurface,
        primary: lightAccent,
        onSurface: lightTextPrimary,
      ),
      textTheme: GoogleFonts.interTextTheme().copyWith(
        displayLarge: GoogleFonts.playfairDisplay(
          fontSize: 48,
          fontWeight: FontWeight.bold,
          color: lightTextPrimary,
        ),
        displayMedium: GoogleFonts.playfairDisplay(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: lightTextPrimary,
        ),
        displaySmall: GoogleFonts.playfairDisplay(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: lightTextPrimary,
        ),
        bodyLarge: GoogleFonts.inter(fontSize: 18, color: lightTextPrimary),
        bodyMedium: GoogleFonts.inter(fontSize: 16, color: lightTextPrimary),
        bodySmall: GoogleFonts.inter(fontSize: 14, color: lightTextMuted),
      ),
    );
  }
}
