import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_app/core/utilis/app_colors.dart';
import 'package:movie_app/core/utilis/app_text_style.dart';
imageView (String image) {

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Stack( children: [
      Image.asset(image,height: 220,width: 140,),
      Align(alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            height:28,width: 58,
            decoration: BoxDecoration(
            color: Appcolors.darkGrey.withAlpha(200),
              borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(children: [
                Text("7.7", style:Appstyles.white16Reg ,),Spacer(),
                Icon(Icons.star,color: Appcolors.yellow,size: 15,)
              ],),
            ),

          ),
        ),
      ),
    ],),
  );
}