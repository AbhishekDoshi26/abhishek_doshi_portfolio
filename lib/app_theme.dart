import 'package:abhishek_doshi_portfolio/values/values.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const _lightFillColor = Colors.black;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
        textTheme: _textTheme,
        iconTheme: const IconThemeData(color: AppColors.white),
        canvasColor: colorScheme.surface,
        scaffoldBackgroundColor: colorScheme.surface,
        highlightColor: Colors.transparent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        focusColor: AppColors.primaryColor,
        colorScheme: colorScheme.copyWith(secondary: colorScheme.primary),
        dividerColor: Colors.grey.shade200,
        dividerTheme: DividerThemeData(
          color: Colors.grey.shade200,
        ));
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: AppColors.primaryColor,
    secondary: AppColors.primaryColor,
    surface: Color(0xFFFAFBFB),
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  // static const _superBold = FontWeight.w900;
  static const _bold = FontWeight.w700;
  // static const _semiBold = FontWeight.w600;
  // static const _medium = FontWeight.w500;
  static const _regular = FontWeight.w400;
  static const _light = FontWeight.w300;

  static final TextTheme _textTheme = TextTheme(
    displayLarge: GoogleFonts.gloriaHallelujah(
      fontSize: Sizes.TEXT_SIZE_96,
      color: AppColors.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    displayMedium: GoogleFonts.ibmPlexMono(
      fontSize: Sizes.TEXT_SIZE_60,
      color: AppColors.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    displaySmall: GoogleFonts.ibmPlexMono(
      fontSize: Sizes.TEXT_SIZE_48,
      color: AppColors.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    headlineMedium: GoogleFonts.ibmPlexMono(
      fontSize: Sizes.TEXT_SIZE_34,
      color: AppColors.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    headlineSmall: GoogleFonts.ibmPlexMono(
      fontSize: Sizes.TEXT_SIZE_24,
      color: AppColors.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    titleLarge: GoogleFonts.ibmPlexMono(
      fontSize: Sizes.TEXT_SIZE_20,
      color: AppColors.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    titleMedium: GoogleFonts.ibmPlexMono(
      fontSize: Sizes.TEXT_SIZE_18,
      color: AppColors.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    titleSmall: GoogleFonts.ibmPlexMono(
      fontSize: Sizes.TEXT_SIZE_14,
      color: AppColors.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    bodyLarge: GoogleFonts.lato(
      fontSize: Sizes.TEXT_SIZE_16,
      color: AppColors.primaryText2,
      fontWeight: _regular,
      fontStyle: FontStyle.normal,
    ),
    bodyMedium: GoogleFonts.ibmPlexMono(
      fontSize: Sizes.TEXT_SIZE_14,
      color: AppColors.black,
      fontWeight: _light,
      fontStyle: FontStyle.normal,
    ),
    labelLarge: GoogleFonts.lato(
      fontSize: Sizes.TEXT_SIZE_16,
      color: AppColors.black,
      fontStyle: FontStyle.normal,
      fontWeight: _regular,
    ),
    bodySmall: GoogleFonts.ibmPlexMono(
      fontSize: Sizes.TEXT_SIZE_12,
      color: AppColors.primaryText1,
      fontWeight: _regular,
      fontStyle: FontStyle.normal,
    ),
  );
}
