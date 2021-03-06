import 'package:block_downloader/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const defaultSpacing = 8.0;

double spacing([double times = 1]) => times * defaultSpacing;

BorderRadius createBorderRadius([double times = 0.5]) =>
    BorderRadius.circular(spacing(times));

ThemeData createTheme(Brightness brightness) {
  ThemeData currentThemeData = ThemeData(brightness: brightness);

  return currentThemeData.copyWith(
    colorScheme: currentThemeData.colorScheme.copyWith(
      primary: primary,
      secondary: primary,
    ),
    scaffoldBackgroundColor: background,
    textTheme: GoogleFonts.interTextTheme(currentThemeData.textTheme),
  );
}
