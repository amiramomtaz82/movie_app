import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_constant.dart';
import 'package:movie_app/core/app_routes.dart';
import 'package:movie_app/core/app_text_style.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:movie_app/ui/app_widget/custom_text_field.dart';
import 'package:movie_app/ui/app_widget/custome_elevated_button.dart';
import 'package:movie_app/ui/screens/home/home_screen.dart';

import '../../../core/show_message.dart';

import '../../presentaion/cubit_auth.dart';
import '../../presentaion/cubit_state.dart';

class RegisterScreen extends StatefulWidget {
  User? googleUser;
  String email;
  RegisterScreen({Key? key,required this.email}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isSelected= false;
  late TextEditingController emailController;

  TextEditingController nameController= TextEditingController();
  TextEditingController phoneController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  TextEditingController confirm_passwordController= TextEditingController();
String selectedAvatar="assets/images/Component 11 – 2.png";

  void initState() {
    super.initState();
    emailController = TextEditingController(text: widget.email);
  }
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    confirm_passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Appcolors.black,
      appBar: AppBar(backgroundColor: Appcolors.black,centerTitle: true,
    leading:
        IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:Icon(Icons.arrow_back,color: Appcolors.yellow,)),

        title: Text(Appstrings.register,style: Appstyles.yellow14regular,)
      ,
      )
    ,body: SingleChildScrollView(child:
    BlocConsumer<AuthCubit, AuthState>(
    listener: (context, state) {
    if (state is AuthError) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(state.message)));
    }

    if (state is AuthSuccess) {
    Navigator.push(context,AppRoutes.home);

    }
    },
    builder: (context, state) {
      return SingleChildScrollView(
        child: Column(
            children: [
              Container(child: CarouselSlider.builder(
                itemCount: avatarList.length,
                itemBuilder: (context, index, realIndex) {
                  return Center(
                    child: ClipOval(
                      child: InkWell(onTap: () {
                        selectedAvatar = avatarList[index];
                        setState(() {
        
                        });
                      },
                        child: Image.asset(
                          avatarList[index],
                          width: 200,
                          height: 200,
        
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.3
                  ,
                  autoPlay: false,
                  enlargeCenterPage: true,
                  viewportFraction: 0.5,
        
                ),
        
              )
              ),
              SizedBox(height: 20,),
              CustomTextField(controller: nameController,
        
                hint: Appstrings.name, prefixIcon: Image.asset(Appassets.name),),
              CustomTextField(controller: emailController,
                  hint: Appstrings.email,
                  prefixIcon: Image.asset(Appassets.email)),
        
        
              CustomTextField(
                controller: passwordController,
                hint: Appstrings.password,
                prefixIcon: Image.asset(Appassets.password),
                suffixIcon: Image.asset(Appassets.eyeOff),),
        
        
              CustomTextField(controller: confirm_passwordController,
                hint: Appstrings.confirmPassword,
                prefixIcon: Image.asset(Appassets.password),
                suffixIcon: Image.asset(Appassets.eyeOff),),
        
        
              CustomTextField(controller: phoneController,
                hint: Appstrings.phone,
                prefixIcon: Image.asset(Appassets.phone),),
        
        
              CustomElevatedButton(text: Appstrings.createAccount,
        
                  onClick: () async {
                    context.read<AuthCubit>().register(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                      name: nameController.text.trim(),
                      phone: phoneController.text.trim(),
                    );
                  })
        
              , SizedBox(height: 20),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Appcolors.yellow),
                  ),
                  width: 90,
                  height: 40,
                  child: Row(
                    children: [
                      CircleAvatar(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: isSelected
                                  ? Appcolors.yellow
                                  : Colors.transparent,
                            ),
                          ),
                          child: Image.asset(Appassets.LR),
                        ),
                      ),
                      Spacer(),
        
                      CircleAvatar(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: isSelected
                                  ? Appcolors.yellow
                                  : Colors.transparent,
                            ),
                          ),
                          child: Image.asset(Appassets.Eg),
                        ),
                      ),
                    ],
                  ),
                ),
        
        
              ),
            ]
        ),
      );
    })
    )
    );
  }


  }
