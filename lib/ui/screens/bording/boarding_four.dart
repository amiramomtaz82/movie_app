import 'package:flutter/material.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_constant.dart';
import 'package:movie_app/core/app_routes.dart';
import 'package:movie_app/ui/app_widget/custom_boarding.dart';

class BoardingFour extends StatelessWidget {
  const BoardingFour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBoarding(onClick:
    (){
      Navigator.push(context,AppRoutes.boardingFive);
    },
        title:Appstrings.rate,
        image: Appassets.image2,
        text: Appstrings.share,
    onClickBack:(){
      Navigator.pop(context);
    } ,);
  }
}
