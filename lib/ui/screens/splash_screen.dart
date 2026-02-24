import 'package:flutter/material.dart';
import 'package:movie_app/core/app_constant.dart';
import 'package:movie_app/core/app_routes.dart';
import 'package:movie_app/core/app_text_style.dart';

import '../../core/app_assets.dart';
import '../../core/app_colors.dart';

class SplashScreen extends StatefulWidget {
const SplashScreen({Key? key}) : super(key: key);

@override
_SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2),(){
      Navigator.push(context, AppRoutes.boarding);
    });
  }
@override
Widget build(BuildContext context) {
return Scaffold(backgroundColor: Appcolors.black,
  body: Column(
      mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.stretch,

      children: [Spacer(),
        Image.asset(Appassets.logo,width: 250,height: 250,),
        Spacer(),
        Image.asset(Appassets.branding,width:186,height: 75,),
        Center(child: Text(Appstrings.brandTitle,style: Appstyles.white14regular,)),
        SizedBox(height: 10,)
      ]
  ),
);
}
}
