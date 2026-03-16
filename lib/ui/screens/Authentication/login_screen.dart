import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_app/core/utilis/app_assets.dart';
import 'package:movie_app/core/utilis/app_colors.dart';
import 'package:movie_app/core/utilis/app_constant.dart';
import 'package:movie_app/core/utilis/app_routes.dart';
import 'package:movie_app/core/utilis/app_text_style.dart';

import 'package:movie_app/ui/app_widget/custom_text_field.dart';
import 'package:movie_app/ui/app_widget/custome_elevated_button.dart';
import 'package:movie_app/ui/presentaion/auth_cubit/cubit_auth.dart';
import 'package:movie_app/ui/screens/Authentication/forget_screen.dart';
import 'package:movie_app/ui/screens/Authentication/register_screen.dart';
import 'package:movie_app/ui/screens/Authentication/validation_class.dart';

import '../../../core/show_message.dart';
import '../../../l10n/app_localizations.dart';
import '../../presentaion/auth_cubit/cubit_state.dart';
import '../../presentaion/lacal_cubit/local_cubit.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> key = GlobalKey();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final bool isSelectedAR = context.watch<LocaleCubit>().currentLocale.languageCode == 'ar';
    final isSelectedEN = context.watch<LocaleCubit>().currentLocale.languageCode == 'en';
    return Scaffold(
      backgroundColor: Appcolors.black,
      body: Form(
        key: key,
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text("Login Success")));
              Navigator.pushReplacement(context, AppRoutes.home);
            }

            // Handle Google login
            if (state is AuthAuthenticated) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Google login success: ${state.user.email}"),
                ),
              );
              Navigator.pushReplacement(context, AppRoutes.home);
            }

            if (state is AuthUnauthenticated) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Google login cancelled or failed"),
                ),
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
                      controller: emailController,
                      hint: AppLocalizations.of(context)!.email,
                      prefixIcon: Image.asset(Appassets.email),
                    ),

                    CustomTextField(
                      validator: Validation.validatePassword,
                      controller: passwordController,
                      hint: AppLocalizations.of(context)!.password,
                      prefixIcon: Image.asset(Appassets.password),
                      suffixIcon: Image.asset(Appassets.eyeOff),
                    ),

                    Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  ForgetScreen(email: emailController.text),
                            ),
                          );
                        },
                        child: Text(
                          AppLocalizations.of(context)!.forgetPassword,
                          textAlign: TextAlign.right,
                          style: Appstyles.yellow14regular,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    CustomElevatedButton(
                      text: AppLocalizations.of(context)!.login,
                      onClick: () {
                        if (key.currentState!.validate()) {
                          context.read<AuthCubit>().login(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          );
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.dontHaveAccount,
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
                            AppLocalizations.of(context)!.createAccount,
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
                            AppLocalizations.of(context)!.or,
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

                        onPressed: () {
                          context.read<AuthCubit>().loginWithGoogle();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              Appassets.google,
                              height: 40,
                              width: 40,
                            ),

                            Text(
                              AppLocalizations.of(context)!.loginWithGoogle,
                              style: Appstyles.black14reg,
                            ),
                          ],
                        ),
                      ),
                    ),
//============================================================================
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
                            InkWell(
                              onTap: () {
                                context.read<LocaleCubit>().changeLanguage(
                                  'ar',
                                );

                              },
                              child: CircleAvatar(backgroundColor: isSelectedAR?Appcolors.yellow:Colors.transparent,
                                child: Image.asset(Appassets.Eg),
                              ),
                            ),
                            Spacer(),

                            InkWell(
                              onTap: () {
                                context.read<LocaleCubit>().changeLanguage(
                                  'en',
                                );

                              },
                              child: CircleAvatar(backgroundColor:isSelectedEN? Appcolors.yellow:Colors.transparent,
                                child: Image.asset(Appassets.LR),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
