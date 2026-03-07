import 'package:flutter/material.dart';
import 'package:movie_app/core/utilis/app_assets.dart';
import 'package:movie_app/core/utilis/app_colors.dart';
import 'package:movie_app/core/utilis/app_constant.dart';
import 'package:movie_app/core/utilis/app_routes.dart';
import 'package:movie_app/core/utilis/app_text_style.dart';
import 'package:movie_app/data/user_dataModel.dart';
import 'package:movie_app/ui/app_widget/custome_elevated_button.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 400,width: double.infinity,
              decoration: BoxDecoration(color: Appcolors.darkGrey),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [SizedBox(height: 30,),
        
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [

                        Expanded(
                          child: Column(children: [
                          ClipRRect(borderRadius: BorderRadius.circular(60),
                              child:_buildProfileImage())

                          ,
                    SizedBox(height: 20,),
                            Text(UserDM.currentUser!.name??"gest",
                              style: Appstyles.white20bold,)
                                                  ],),
                        ),

                      Expanded(
                        child: Column(mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("${movieList.length}",style: Appstyles.white36Med),
                            SizedBox(height: 10,),
                            Text(Appstrings.wishList,style: Appstyles.white24Med)

                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text("${movieList.length}",style: Appstyles.white36Med,),
                            SizedBox(height: 10,),
                            Text(Appstrings.history,style: Appstyles.white24Med,)

                          ],
                        ),
                      )
                    ],),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
                    children: [
                    Expanded(flex:2,child:
                    CustomElevatedButton(
                      text: Appstrings.editProfile,onClick: (){
Navigator.push(context,AppRoutes.updateProfile);

                    },)),
                    Expanded(flex:1 ,
                      child: CustomElevatedButton(textColor: Appcolors.white,
                        borderColor: Appcolors.red,
        
                        onClick: (){},backgroundColor: Appcolors.red,icon:
                      Icon(Icons.exit_to_app_sharp,color: Appcolors.white,),
                        text: Appstrings.exist,),
                    )
                  ],),
                  DefaultTabController(length: 2,
                    child: TabBar(
                      labelColor: Appcolors.white,
                      unselectedLabelColor: Appcolors.white,
                      unselectedLabelStyle: Appstyles.white16Reg,
                      labelStyle: Appstyles.white16Reg,
                      indicatorColor: Appcolors.yellow,
                      tabs:[
                      Tab(icon: Image.asset(Appassets.menue),
                          text:Appstrings.wishList),
                      Tab(icon:Image.asset(Appassets.folder),text: Appstrings.history,)
                    ],
                    ),
                  )
                ],),
              ),

            ),SizedBox(height: 70,),
            Image.asset(Appassets.empty1,height: 124,width: 124,)
          ],
        ),
      ),
    );
  }
  Widget _buildProfileImage() {
    final user = UserDM.currentUser;

    if (user == null) {
      // ⏳ While loading or not set
      return Image.asset(
        Appassets.photo2,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      );
    }

    final image = user.image;

    if (image == null || image.isEmpty || image.startsWith("http")) {
      return Image.asset(
        Appassets.photo2,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      );
    }

    return Image.asset(
      image,
      width: 100,
      height: 100,
      fit: BoxFit.cover,
    );
  }
}
