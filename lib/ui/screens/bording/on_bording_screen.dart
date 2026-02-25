import 'package:flutter/material.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_constant.dart';
import 'package:movie_app/core/app_routes.dart';
import 'package:movie_app/core/app_text_style.dart';
import 'package:movie_app/ui/app_widget/custome_elevated_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Appassets.onBoarding),
          fit: BoxFit.cover,
        ),
      ),child: Column(
      children: [Spacer(),
        Text(Appstrings.findYourNext,style: Appstyles.white36Med,textAlign: TextAlign.center,),SizedBox(height: 20,),
        Text(Appstrings.getAccess,style: Appstyles.grey20regular,),SizedBox(height: 20,),
        CustomElevatedButton(text:Appstrings.explore , onClick: (){
          Navigator.push(context, AppRoutes.boardingOne);
        }),
        SizedBox(height: 20,)

      ],
    ),
    ),


    );
  }
}
