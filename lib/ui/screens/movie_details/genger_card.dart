import 'package:flutter/cupertino.dart';
import 'package:movie_app/core/utilis/app_colors.dart';
import 'package:movie_app/core/utilis/app_constant.dart';
import 'package:movie_app/core/utilis/app_text_style.dart';

gengerCard (String title){

  return
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(height: 36,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
        color: Appcolors.darkGrey),
         child: Center(child: Text(title,style: Appstyles.white16Reg,)), ),
    );



}
