import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/ui/app_widget/custom_text_field.dart';
import 'package:movie_app/ui/app_widget/custome_elevated_button.dart';

import '../../../core/app_colors.dart';
import '../../../core/app_constant.dart';
import '../../../core/app_text_style.dart';
import '../../presentaion/cubit_auth.dart';
import '../../presentaion/cubit_state.dart';

class ForgetScreen extends StatefulWidget {
  String email;
 ForgetScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  TextEditingController emailController=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController.text=widget.email;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Appcolors.black,
        appBar: AppBar(backgroundColor: Appcolors.black, centerTitle: true,
            leading:
            IconButton(onPressed: () {
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back, color: Appcolors.yellow,)),

            title: Text(
              Appstrings.forgetPassword, style: Appstyles.yellow14regular,)

        ),
        body:Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocConsumer<AuthCubit, AuthState>(
    listener: (context, state) {
    if (state is AuthError) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(state.message)));
    } else if (state is AuthInitial) {
    ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text("Reset email sent")),
    );
    }
    },
    builder: (context, state) {
      return


        SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(Appassets.forgotPassword, width: double.infinity,
                height: 430, fit: BoxFit.cover,),
              CustomTextField(controller: emailController,
                hint: Appstrings.email,
                prefixIcon: Image.asset(Appassets.email),),

              CustomElevatedButton(text: Appstrings.verify, onClick: () {
                context.read<AuthCubit>().resetPassword(
                  emailController.text.trim(),
                );


              },)
            ],
          ),
        );
    } )

    )
    );
  }
}
