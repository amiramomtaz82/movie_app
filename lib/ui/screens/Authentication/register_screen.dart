import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
import '../../../firebase_manager/data_model.dart';
import '../../../firebase_manager/firebaseAuth.dart';

class RegisterScreen extends StatefulWidget {
  User? googleUser;
  RegisterScreen({Key? key,this.googleUser}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isSelected= false;
  TextEditingController emailController= TextEditingController();

  TextEditingController nameController= TextEditingController();
  TextEditingController phoneController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  TextEditingController confirm_passwordController= TextEditingController();
String selectedAvatar="assets/images/Component 11 – 2.png";
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
      ),body: SingleChildScrollView(
        child: Column(
            children: [
              Container(child:CarouselSlider.builder(
                itemCount: avatarList.length,
                itemBuilder: (context, index, realIndex) {
                  return Center(
                    child: ClipOval(
                      child: InkWell(onTap: (){
                        selectedAvatar=avatarList[index];
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
                  height:MediaQuery.of(context).size.height * 0.3
                  ,
                  autoPlay: false,
                  enlargeCenterPage: true,
                  viewportFraction: 0.5,
        
                ),
        
              )
              ),
              SizedBox(height: 20,),
              CustomTextField(controller: nameController,

                hint: Appstrings.name,prefixIcon: Image.asset(Appassets.name),),
              CustomTextField(controller: emailController,
                  hint: Appstrings.email,prefixIcon: Image.asset(Appassets.email)),


              CustomTextField(
                controller:passwordController,
                hint: Appstrings.password,prefixIcon: Image.asset(Appassets.password),
                suffixIcon: Image.asset(Appassets.eyeOff),),


              CustomTextField(controller: confirm_passwordController,
                hint: Appstrings.confirmPassword,prefixIcon: Image.asset(Appassets.password),
                suffixIcon: Image.asset(Appassets.eyeOff),),


              CustomTextField(controller: phoneController,
                hint: Appstrings.phone,prefixIcon: Image.asset(Appassets.phone),),



      CustomElevatedButton(text: Appstrings.createAccount,onClick:()async {
registerUser();})
      //   try {
      //     showLoading(context);
      //     final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      //       email: emailController.text,
      //       password: passwordController.text,
      //     );
      //     UserDM.currentUser=UserDM(id: credential.user!.uid,
      //         email: emailController.text,
      //         name: nameController.text,
      //         avatar:selectedAvatar ,
      //
      //         favouriteEvents: [],
      //         phoneNumber: phoneController.text
      //     );
      //
      //     ///creating doc in fire store=====================
      //     createUserInFireStore(UserDM.currentUser!);
      //
      //     Navigator.pop(context);
      //     Navigator.push(context, AppRoutes.home);
      //
      //   }
      //   ///// error handling================================
      //   on FirebaseAuthException catch (e) {
      //     Navigator.pop(context);
      //     var message="";
      //     if (e.code == 'weak-password') {
      //       message='The password provided is too weak.';
      //     } else if (e.code == 'email-already-in-use') {
      //       message='The account already exists for that email.';
      //     }
      //     else {message=e.message??"some thing went wrong";}
      //     showMessage(context, message, title: "Error",posText: "ok");
      //   } catch (e) {
      //     print(e);
      //   }
      //
      // } ,),
              ,SizedBox(height: 20),
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
        

          ),]
      )
        )
    );
  }

  Future<void> registerUser() async {
    // 1️⃣ Validate inputs
    if (nameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        selectedAvatar == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields and select an avatar')),
      );
      return; // stop execution
    }

    try {
      showLoading(context); // show loading dialog

      String uid;
      String email;

      if (widget.googleUser != null) {
        // Google user → already authenticated
        uid = widget.googleUser!.uid;
        email = widget.googleUser!.email!;
        emailController.text=email;
      } else {
        // Regular email/password registration
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        uid = credential.user!.uid;
        email = emailController.text;
      }

      // 2️⃣ Create UserDM
      UserDM.currentUser = UserDM(
        id: uid,
        email: email,
        name: nameController.text,
        avatar: selectedAvatar!,
        phoneNumber: phoneController.text,
        favouriteEvents: [],
      );

      // 3️⃣ Save user to Firestore
      await createUserInFireStore(UserDM.currentUser!);

      Navigator.pop(context); // close loading dialog
      Navigator.pushReplacement(context, AppRoutes.home);
    }
    // 4️⃣ Firebase Auth Errors
    on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      var message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = e.message ?? "Something went wrong";
      }
      showMessage(context, message, title: "Error", posText: "OK");
    }
    // 5️⃣ Other errors
    catch (e) {
      Navigator.pop(context);
      showMessage(context, e.toString(), title: "Error", posText: "OK");
    }
  }
  }
