import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_constant.dart';
import 'package:movie_app/core/app_routes.dart';
import 'package:movie_app/core/app_text_style.dart';

import 'package:movie_app/ui/app_widget/custom_text_field.dart';
import 'package:movie_app/ui/app_widget/custome_elevated_button.dart';
import 'package:movie_app/ui/presentaion/cubit_auth.dart';
import 'package:movie_app/ui/screens/Authentication/forget_screen.dart';
import 'package:movie_app/ui/screens/Authentication/register_screen.dart';
import 'package:movie_app/ui/screens/Authentication/validation_class.dart';

import '../../../core/show_message.dart';
import '../../presentaion/cubit_state.dart';


class LoginScreen extends StatefulWidget {

 LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> key = GlobalKey();
  bool isSelected = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Appcolors.black,
        body: Form(key: key,
          child: BlocConsumer<AuthCubit,AuthState>(

          listener: (context, state)
              {
                if (state is AuthSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Login Success")),
                  );
                  Navigator.push(context, AppRoutes.home);
                }

                // Handle Google login
                if (state is AuthAuthenticated) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Google login success: ${state.user.email}")),
                  );
                  Navigator.push(context, AppRoutes.home);
                }

                if (state is AuthUnauthenticated) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Google login cancelled or failed")),
                  );
                }

                if (state is AuthNeedsRegistration) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => RegisterScreen(email: state.email),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [

                        Image.asset(Appassets.logo, height: 250, width: 250),

                    CustomTextField(
                      validator: Validation.validateEmail,
                      controller: emailController,
                    hint: Appstrings.email,
                    prefixIcon: Image.asset(Appassets.email),
                    ),

                    CustomTextField(
                      validator: Validation.validatePassword,
                      controller: passwordController,
                    hint: Appstrings.password,
                    prefixIcon: Image.asset(Appassets.password),
                    suffixIcon: Image.asset(Appassets.eyeOff),
                    ),

                    Container(
                    child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (_) => ForgetScreen(email:emailController.text)));
                    },
                    child: Text(
                    Appstrings.forgetPassword,
                    textAlign: TextAlign.right,
                    style: Appstyles.yellow14regular,
                    ),
                    ),
                    ),
                    SizedBox(height: 20),


                    CustomElevatedButton(text: Appstrings.login,
                        onClick: () {
                          if (key.currentState!.validate()) {

                            context.read<AuthCubit>().login(
                              emailController.text.trim(),
                              passwordController.text.trim(),


                            );

                          }



                    }
                    ),
                    SizedBox(height: 10),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text(
                    Appstrings.dontHaveAccount,
                    style: Appstyles.white14regular,
                    ),

                    InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => RegisterScreen(email: ""),
                        ),
                      );
                    },
                    child: Text(
                    Appstrings.createOne,
                    style: Appstyles.yellow14regular,
                    ),
                    ),
                    ],
                    ),
                    SizedBox(height: 20),


                    Row(
                    children: [
                    Expanded(
                      child: Divider(
                      color: Appcolors.yellow,
                      indent: 50,
                      endIndent: 10,
                      ),
                    ),
                    Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                    Appstrings.or,
                    style: Appstyles.yellow14regular,
                    ),
                    ),

                    Expanded(
                      child: Divider(
                      color: Appcolors.yellow,
                      thickness: 1,
                      indent: 10,
                      endIndent: 50,
                      ),
                    ),
                    ],
                    ),
                    SizedBox(height: 20),

                    Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    fixedSize: Size(double.infinity, 50),
                    backgroundColor: Appcolors.yellow,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    ),
                    ),

                    onPressed: (){


                      context.read<AuthCubit>().loginWithGoogle();


                    },
                    child:Row (
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Image.asset(Appassets.google, height: 40, width: 40),

                    Text(
                    Appstrings.loginWithGoogle,
                    style: Appstyles.black14reg,
                    ),
                    ],
                    ),
                    )
                    ),


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
                    ]
                    ),
                  ),
                );
              }),
        )
    );
    }
  }

