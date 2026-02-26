import 'package:flutter/material.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/ui/app_widget/custom_text_field.dart';
import 'package:movie_app/ui/app_widget/custome_elevated_button.dart';

import '../../../core/app_colors.dart';
import '../../../core/app_constant.dart';
import '../../../core/app_text_style.dart';

class ForgetScreen extends StatelessWidget {
  const ForgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Appcolors.black,
        appBar: AppBar(backgroundColor: Appcolors.black, centerTitle: true,
            leading:
            IconButton(onPressed: () {
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back, color: Appcolors.yellow,)),

            title: Text(
              Appstrings.forgetPassword, style: Appstyles.yellow14regular,)

        ),
        body:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset(Appassets.forgotPassword,width: double.infinity,
              height: 430,fit: BoxFit.cover,),
              CustomTextField(hint: Appstrings.email,
                prefixIcon: Image.asset(Appassets.email),),
              
              CustomElevatedButton(text: Appstrings.verify,onClick: (){},)
            ],
          ),
        )


    );
  }
}
