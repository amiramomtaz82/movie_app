
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/utilis/app_colors.dart';
import 'package:movie_app/core/utilis/app_constant.dart';
import 'package:movie_app/core/utilis/app_text_style.dart';

import '../../../core/network/models/response/list_movie_response/class_model.dart';
import '../../../core/utilis/app_assets.dart';

class CastCard extends StatelessWidget {
  Cast cast;

 CastCard({super.key,required this.cast});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container( height: 95,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
      color: Appcolors.darkGrey),

        child:  Row(
        children: [
          Expanded(flex: 1,
              child: ClipRRect(borderRadius: BorderRadius.circular(16)
                  ,child:  cast.urlSmallImage != null
                    ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(borderRadius: BorderRadius.circular(16),
                      child: Image.network(cast.urlSmallImage!)),
                )
                    : Image.asset(Appassets.noImage),




              )
          ),
          Expanded(flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [Row(
                children: [

                  Expanded(
                    child: Text("${Appstrings.name} : ${cast.name??"" }",style: Appstyles.white16Reg,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                  ),

                ],
              ),
                Row(children: [
                  Expanded(
                    child: Text("${Appstrings.character} : ${cast.characterName??""} ",style: Appstyles.white16Reg,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,),
                  ),],)

              ],),
            ),
          )
        ],
      ),


      ),
    );
  }
}
