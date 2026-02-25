import 'package:flutter/material.dart';
import 'package:movie_app/ui/app_widget/custom_boarding.dart';

import '../../../core/app_assets.dart';
import '../../../core/app_colors.dart';
import '../../../core/app_constant.dart';
import '../../../core/app_routes.dart';
import '../../../core/app_text_style.dart';
import '../../app_widget/custome_elevated_button.dart';

class BoardingThree extends StatelessWidget {
  const BoardingThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBoarding(

        onClickBack: (){Navigator.pop(context);},

        title:Appstrings.create, image: Appassets.badBoys, onClick: (){
      Navigator.push(context,AppRoutes.boardingFour);
    }, text: Appstrings.save,

    );
  }
}
