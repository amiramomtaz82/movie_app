import 'package:flutter/material.dart';
import 'package:movie_app/core/utilis/app_assets.dart';
import 'package:movie_app/core/utilis/app_constant.dart';
import 'package:movie_app/core/utilis/app_routes.dart';
import 'package:movie_app/core/utilis/app_text_style.dart';
import 'package:movie_app/ui/app_widget/custome_elevated_button.dart';

import '../../../core/utilis/app_colors.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:Container(
      width: double.infinity,
      height: double.infinity,
     
      child: Stack(fit: StackFit.expand,
       children: [Image.asset(Appassets.onBoarding,fit: BoxFit.cover,),
         Container(
           decoration: BoxDecoration(
             gradient: LinearGradient(
               colors: [
                 Appcolors.black.withOpacity(0.5),
                 // Start with slight opacity
                 Colors.black.withOpacity(.8,)
               ],
               begin: Alignment.bottomCenter,
               end: Alignment.topCenter,
             ),
           ),
         ),
         Align(alignment: Alignment.bottomCenter,
           child: Column(mainAxisSize: MainAxisSize.min,
               children: [
             Text(Appstrings.findYourNext,
             style: Appstyles.white36Med,textAlign: TextAlign.center,),

             SizedBox(height: 20,),

             Text(Appstrings.getAccess,style: Appstyles.grey20regular,),

             SizedBox(height: 20,),
             CustomElevatedButton(text:Appstrings.explore , onClick: (){
               Navigator.push(context, AppRoutes.boardingOne);
             }),
             SizedBox(height: 20,)]

         )
         )
       ])

         )
      );



  }
}
