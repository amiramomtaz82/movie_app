import 'package:flutter/material.dart';
import 'package:movie_app/ui/screens/bording/on_bording_screen.dart';

import '../ui/screens/splash_screen.dart';

abstract final class AppRoutes {
  static MaterialPageRoute get splash =>
      MaterialPageRoute(builder: (_) => SplashScreen());

  static MaterialPageRoute get boarding =>
      MaterialPageRoute(builder: (_) => OnBoardingScreen());
}