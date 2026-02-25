import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class Appstyles {
  static final TextStyle white14regular = TextStyle(


      color: Appcolors.white, fontWeight: FontWeight.w400, fontSize: 14);


  static final TextStyle black20med = TextStyle(


      color: Appcolors.black, fontWeight: FontWeight.w500, fontSize: 20);


  static final TextStyle white36Med = TextStyle(


      color: Appcolors.white, fontWeight: FontWeight.w500, fontSize: 36);

  static final TextStyle grey20regular = TextStyle(
      color: Appcolors.grey, fontWeight: FontWeight.w400, fontSize: 20,decoration: TextDecoration.none,);

  static final TextStyle white16Reg= TextStyle(
      color: Appcolors.white, fontWeight: FontWeight.w400, fontSize: 16,decoration: TextDecoration.none,);

  static final TextStyle white24Med= TextStyle(
      color: Appcolors.white, fontWeight: FontWeight.w600, fontSize: 24,decoration: TextDecoration.none,);


}