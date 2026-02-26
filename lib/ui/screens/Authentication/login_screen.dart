import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_constant.dart';
import 'package:movie_app/core/app_routes.dart';
import 'package:movie_app/core/app_text_style.dart';
import 'package:movie_app/ui/app_widget/custom_text_field.dart';
import 'package:movie_app/ui/app_widget/custome_elevated_button.dart';
import 'package:movie_app/ui/screens/Authentication/register_screen.dart';

import '../../../core/show_message.dart';
import '../../../firebase_manager/data_model.dart';
import '../../../firebase_manager/firebaseAuth.dart';
import '../../../firebase_manager/signe_in_with_google.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> key = GlobalKey();
  bool isSelected = false;
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.black,
      body: Form(
        key: key,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(Appassets.logo, height: 250, width: 250),

              CustomTextField(controller: emailController,
                hint: Appstrings.email,
                prefixIcon: Image.asset(Appassets.email),
              ),

              CustomTextField(controller: passwordController,
                hint: Appstrings.password,
                prefixIcon: Image.asset(Appassets.password),
                suffixIcon: Image.asset(Appassets.eyeOff),
              ),

              Container(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, AppRoutes.forgotPassword);
                  },
                  child: Text(
                    Appstrings.forgetPassword,
                    textAlign: TextAlign.right,
                    style: Appstyles.yellow14regular,
                  ),
                ),
              ),
              SizedBox(height: 20),
              CustomElevatedButton(text: Appstrings.login, onClick: () async {
                showLoading(context);


                try {
                  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  UserDM.currentUser=await getUserFromFireStore(credential.user!.uid);

                  Navigator.pop(context);

                  Navigator.push(context, AppRoutes.home);

                }

                on FirebaseAuthException catch (e) {
                  Navigator.pop(context);
                  var message="";
                  if (e.code == 'user-not-found') {
                    message='No user found for that email.';
                  } else if (e.code == 'wrong-password') {
                    message='Wrong password provided for that user.';
                  }else {message=e.message?? "some thing went wrong ";}
                  showMessage(context,message,title: "Error",posText: "Ok");
                }
                catch(e){showMessage(context, "some thing went wrong",title: "Error",posText: "OK");}
              }),
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
                      Navigator.push(context, AppRoutes.register);
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

                  // onPressed: () async {
                  //   try {
                  //     showLoading(context);
                  //
                  //     final credential = await signInWithGoogle();
                  //
                  //     // OPTIONAL but recommended
                  //     UserDM.currentUser =
                  //     await getUserFromFireStore(credential.user!.uid);
                  //
                  //     Navigator.pop(context); // closes loading dialog
                  //
                  //     Navigator.push(
                  //       context,
                  //       AppRoutes.home,
                  //     );
                  //   } catch (e) {
                  //     Navigator.pop(context);
                  //     showMessage(
                  //       context,
                  //       e.toString(),
                  //       title: "Error",
                  //       posText: "OK",
                  //     );
                  //   }
                  // }
                  onPressed:() async {
                try {
                // 1️⃣ Show loading dialog
                showLoading(context);
                final googleSignIn = GoogleSignIn();

// Force account chooser
                  await googleSignIn.signOut();
                // 2️⃣ Sign in with Google
                final credential = await signInWithGoogle();
                final user = credential.user!;
                final uid = user.uid;

                // 3️⃣ Check if user exists in Firestore
                final doc = await FirebaseFirestore.instance
                    .collection('users')
                    .doc(uid)
                    .get();

                Navigator.pop(context); // Close loading dialog

                if (!doc.exists) {
                // 4️⃣ First-time user → navigate to Complete Profile Screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => RegisterScreen(googleUser: user), // pass google user here
                    ),
                  );
                } else {
                // 5️⃣ Existing user → set current user and go home
                UserDM.currentUser =  await getUserFromFireStore(credential.user!.uid);
                Navigator.pushReplacement(context, AppRoutes.home);
                }
                } catch (e) {
                // 6️⃣ Handle errors
                Navigator.pop(context);
                showMessage(
                context,
                e.toString(),
                title: "Error",
                posText: "OK",
                );
                }
                }

                  ,child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(Appassets.google, height: 40, width: 40),
                      Text(
                        Appstrings.loginWithGoogle,
                        style: Appstyles.black14reg,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
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
            ],
          ),
        ),
      ),
    );
  }
}
