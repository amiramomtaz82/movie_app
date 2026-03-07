import 'package:flutter/material.dart';

import 'utilis/app_colors.dart';
import 'utilis/app_text_style.dart';

abstract final class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Appcolors.black,
    primaryColor: Appcolors.white,
    colorScheme: ColorScheme.fromSeed(seedColor: Appcolors.white),
    textTheme: TextTheme(

    ),
  );
}