import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'color_schemes.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: lightColorScheme,
    appBarTheme: AppBarTheme(backgroundColor: lightColorScheme.primary),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: darkColorScheme,
    appBarTheme: AppBarTheme(backgroundColor: darkColorScheme.primary),
  );
}
