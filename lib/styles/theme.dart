import 'package:block_downloader/styles/colors.dart';
import 'package:flutter/material.dart';

ThemeData createTheme(Brightness brightness) {
  ThemeData currentThemeData = ThemeData(brightness: brightness);

  return currentThemeData.copyWith(
    colorScheme: currentThemeData.colorScheme.copyWith(
      primary: red,
    ),
  );
}
