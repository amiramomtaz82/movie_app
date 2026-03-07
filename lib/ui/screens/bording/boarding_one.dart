import 'package:flutter/material.dart';
import 'package:movie_app/core/utilis/app_assets.dart';
import 'package:movie_app/core/utilis/app_constant.dart';
import 'package:movie_app/core/utilis/app_routes.dart';
import 'package:movie_app/ui/app_widget/custom_boarding.dart';

class BoardingOne extends StatelessWidget {
  const BoardingOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBoarding(title: Appstrings.discover, image: Appassets.image1,
        onClick:(){

      Navigator.push(context, AppRoutes.boardingTwo);
    },

        text: Appstrings.explore_a_vast,
    backButton: false,
    );
  }
}
