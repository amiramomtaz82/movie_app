import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utilis/app_assets.dart';
import 'package:movie_app/core/utilis/app_colors.dart';
import 'package:movie_app/core/utilis/app_constant.dart';
import 'package:movie_app/core/utilis/app_text_style.dart';
import 'package:movie_app/ui/app_widget/custom_text_field.dart';
import 'package:movie_app/ui/app_widget/custome_elevated_button.dart';
import 'package:movie_app/ui/screens/home/profile_tab/image_selected.dart';

import '../../../../domain/models/user_dataModel.dart';

import '../../../presentaion/auth_cubit/cubit_auth.dart';
import '../../Authentication/forget_screen.dart';
import '../../Authentication/login_screen.dart';

class UpadteProfile extends StatefulWidget {
  const UpadteProfile({Key? key}) : super(key: key);

  @override
  State<UpadteProfile> createState() => _UpadteProfileState();
}

class _UpadteProfileState extends State<UpadteProfile> {
  int selectedIndex=0;
 late TextEditingController nameController;
 late TextEditingController phoneController;
 String pickedImage=UserDM.currentUser?.image?? avatarList[2];

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController=TextEditingController(text: UserDM.currentUser?.name);
    phoneController=TextEditingController(text:UserDM.currentUser?.phone);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold( appBar: AppBar(backgroundColor: Appcolors.black, centerTitle: true,
          leading:
          IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back, color: Appcolors.yellow,)),

          title: Text(
            Appstrings.pickAvatar, style: Appstyles.yellow14regular,)

      ),
        backgroundColor: Appcolors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(onTap: (){
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  builder: (context) {
                    return StatefulBuilder(
                      builder: (context, setModalState) {
                        return Container(
                          height: 500,
                          color: Appcolors.darkGrey,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 1,
                                mainAxisSpacing: 15,
                                crossAxisSpacing: 15,
                              ),
                              itemCount: avatarList.length,
                              itemBuilder: (context, index) {
                                return ImageSelected(
                                  image: avatarList[index],
                                  isSelected: index == selectedIndex,
                                  onTap: () {
                                    // 👇 THIS rebuilds bottom sheet
                                    setModalState(() {
                                      selectedIndex = index;
                                    });

                                    // 👇 THIS updates main screen
                                    setState(() {

                                      pickedImage = avatarList[index];
                                    });
                                  },
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(pickedImage
                  ),
                ),
              ),
              SizedBox(height: 20),
              CustomTextField(controller: nameController,
                  prefixIcon: Icon(Icons.person), hint:""),
              SizedBox(height: 10),
              CustomTextField(controller: phoneController,
                hint:"" ,
                prefixIcon: Image.asset(Appassets.phone),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  child: InkWell(onTap: (){

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (_) => ForgetScreen(email:UserDM.currentUser?.email??"")));
                  },
                    child: Text(
                      Appstrings.resetPassword,
                      style: Appstyles.white16Reg,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 300),
              CustomElevatedButton(
                borderColor: Appcolors.red,
                backgroundColor: Appcolors.red,
                textColor: Appcolors.white,
                text: Appstrings.deleteAccount,
                onClick: ()  async {
                  try {
                    await context.read<AuthCubit>().deleteAccount();
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => LoginScreen()),
                          (route) => false,
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: $e')),
                    );
                  }
                },
              ),

              CustomElevatedButton(
                text: Appstrings.updateData,
                onClick: () async {
                  await context.read<AuthCubit>().updateUser(
                    name: nameController.text,
                    phone: phoneController.text,
                    avatar: pickedImage ?? UserDM.currentUser?.image,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
