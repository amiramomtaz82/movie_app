import 'package:flutter/material.dart';
import 'package:movie_app/core/utilis/app_assets.dart';
import 'package:movie_app/core/utilis/app_colors.dart';
import 'package:movie_app/core/utilis/app_constant.dart';
import 'package:movie_app/core/utilis/app_routes.dart';
import 'package:movie_app/core/utilis/app_text_style.dart';
import 'package:movie_app/ui/app_widget/custome_elevated_button.dart';

class CustomBoarding extends StatelessWidget {
  String title;
  String? text;
  String image;

  bool backButton;
  String textButton;
  VoidCallback onClick;
  VoidCallback? onClickBack;

  CustomBoarding({
    Key? key,
    required this.onClick,
    this.textButton = "Next",
    required this.title,
    this.onClickBack,
    required this.image,
    this.backButton = true,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Image.asset(
            image,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ), Container(decoration: BoxDecoration(gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Appcolors.black.withOpacity(0.5),
              // Start with slight opacity
              Colors.black.withOpacity(.5,)
            ],
          ),


          )
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Appcolors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      title,
                      style: Appstyles.white24Med,
                      textAlign: TextAlign.center,

                    ),
                    SizedBox(height: 20),
                    if(text!=null)
                    Text(
                      text!,
                      style: Appstyles.white16Reg,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    CustomElevatedButton(text: textButton, onClick: onClick),

                    if (backButton && onClickBack != null) ...[
                      SizedBox(height: 10),

                      CustomElevatedButton(
                        text: "back",

                        textColor: Appcolors.yellow,
                        onClick: onClickBack,
                        backgroundColor: Appcolors.black,
                        enableBorder: true,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
