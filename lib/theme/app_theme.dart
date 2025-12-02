import 'package:flutter/material.dart';

class AppTheme {
  // App palette (compile-time constants)
  static const Color pastelPink   = Color(0xFFF9DDE2);
  static const Color pastelBlue   = Color(0xFFDDECF9);
  static const Color pastelYellow = Color(0xFFFFF3C4);
  static const Color textDark     = Color(0xFF3A3A3A);

  static ThemeData light() {
    final ColorScheme scheme = ColorScheme.fromSeed(
      seedColor: pastelPink,
      primary: pastelPink,
      secondary: pastelBlue,
      surface: Colors.white,
      background: Colors.white,
      brightness: Brightness.light,
    );

    return ThemeData(
      colorScheme: scheme,
      // If you prefer Material 2 visuals, set false. (True is fine too.)
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,

      // Keep these non-const to avoid any "constant expression" issues.
      textTheme: TextTheme(
        headlineMedium: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: textDark,
        ),
        bodyMedium: const TextStyle(
          fontSize: 16,
          color: textDark,
        ),
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: pastelPink,
        foregroundColor: textDark,
        elevation: 0,
        centerTitle: true,
      ),

      // IMPORTANT: CardTheme must be non-const because of withOpacity().
      cardTheme: CardThemeData(
        color: pastelYellow.withOpacity(0.6),
        elevation: 2, // must be null or >= 0
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.antiAlias,
        surfaceTintColor: Colors.transparent, // avoids M3 overlay tint
        shadowColor: pastelBlue.withOpacity(0.3),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: pastelPink,
          foregroundColor: textDark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: pastelBlue.withOpacity(0.25),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: pastelBlue),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: pastelPink, width: 2),
        ),
      ),
    );
  }
}