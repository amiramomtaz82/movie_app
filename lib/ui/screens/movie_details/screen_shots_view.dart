import 'package:flutter/material.dart';
import 'package:movie_app/core/utilis/app_assets.dart';
screenShotsView(String image ){
  
  return InkWell(onTap: (){},
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(width: double.infinity,
        height: 150,
        child:
        ClipRRect(borderRadius: BorderRadius.circular(16),
            child: Image.asset(image,width: double.infinity,height: double.infinity,
            fit: BoxFit.cover,)),
      ),
    ),
  );
}