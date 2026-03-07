import 'package:flutter/material.dart';
import 'package:movie_app/core/utilis/app_assets.dart';
import 'package:movie_app/core/utilis/app_constant.dart';
import 'package:movie_app/core/utilis/app_routes.dart';
import 'package:movie_app/ui/app_widget/custom_boarding.dart';

class BoardingFive extends StatelessWidget {
  const BoardingFive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBoarding(onClick:
    (){
      Navigator.push(context,AppRoutes.login);
    }, title: Appstrings.start, image:Appassets.image1917,
    textButton: "Finish",
    onClickBack: (){Navigator.pop(context);},);
  }
}
