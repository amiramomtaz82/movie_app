import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_style.dart';

abstract final class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Appcolors.black,
    primaryColor: Appcolors.white,
    colorScheme: ColorScheme.fromSeed(seedColor: Appcolors.white),
    textTheme: TextTheme(

    ),
  );
}