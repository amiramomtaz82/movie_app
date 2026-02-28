import 'package:flutter/material.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_constant.dart';
import 'package:movie_app/core/app_text_style.dart';
import 'package:movie_app/ui/app_widget/custom_text_field.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Appcolors.black,
      body: Column(children: [
        CustomTextField(hint: Appstrings.search,prefixIcon:
        IconButton(onPressed: (){},
            icon: Image.asset(Appassets.vector1)),
        ),Spacer(),

        Image.asset(Appassets.empty1,height: 124,width: 124,)
        ,Spacer()
      ]
      
      )
        ),
    );
  }
}
