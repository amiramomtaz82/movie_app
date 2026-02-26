import 'package:flutter/material.dart';
import 'package:movie_app/ui/screens/Authentication/forget_screen.dart';
import 'package:movie_app/ui/screens/Authentication/login_screen.dart';
import 'package:movie_app/ui/screens/Authentication/register_screen.dart';
import 'package:movie_app/ui/screens/bording/boadrding_three.dart';
import 'package:movie_app/ui/screens/bording/boarding_five.dart';
import 'package:movie_app/ui/screens/bording/boarding_four.dart';
import 'package:movie_app/ui/screens/bording/boarding_one.dart';
import 'package:movie_app/ui/app_widget/custom_boarding.dart';
import 'package:movie_app/ui/screens/bording/boarding_two.dart';
import 'package:movie_app/ui/screens/bording/on_bording_screen.dart';

import '../ui/screens/home/home_screen.dart';
import '../ui/screens/splash_screen.dart';

abstract final class AppRoutes {
  static MaterialPageRoute get splash =>
      MaterialPageRoute(builder: (_) => SplashScreen());

  static MaterialPageRoute get boarding =>
      MaterialPageRoute(builder: (_) => OnBoardingScreen());
  static MaterialPageRoute get boardingOne =>
      MaterialPageRoute(builder: (_) =>BoardingOne());
  static MaterialPageRoute get boardingTwo =>
      MaterialPageRoute(builder: (_) =>BoardingTwo());
  static MaterialPageRoute get boardingThree =>
      MaterialPageRoute(builder: (_) => BoardingThree());
  static MaterialPageRoute get boardingFour=>
      MaterialPageRoute(builder: (_) => BoardingFour());
  static MaterialPageRoute get boardingFive =>
      MaterialPageRoute(builder: (_) => BoardingFive());
  static MaterialPageRoute get login =>
      MaterialPageRoute(builder: (_) => LoginScreen());
  static MaterialPageRoute get register =>
      MaterialPageRoute(builder: (_) => RegisterScreen());
  static MaterialPageRoute get forgotPassword =>
      MaterialPageRoute(builder: (_) => ForgetScreen());
  static MaterialPageRoute get home =>
      MaterialPageRoute(builder: (_) => HomeScreen());
}