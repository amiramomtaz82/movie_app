import 'package:flutter/material.dart';
import 'package:movie_app/core/app_text_style.dart';

import '../../core/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hint;
  final bool isPassword;
  final int minLines;
  final TextEditingController? controller;
  FormFieldValidator<String?>?  validator;
 final void Function (String)? onChanged;

  CustomTextField({
    super.key,
    this.onChanged,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    required this.hint,
    this.isPassword = false,
    this.minLines = 1,
    this.controller
  });

  @override
  Widget build(BuildContext context) {
    InputBorder border = OutlineInputBorder(

      borderRadius: BorderRadius.circular(16),
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(style: Appstyles.white16Reg,
        validator: validator,

        decoration: InputDecoration(
          hintText: hint,
          hintStyle: Appstyles.white16Reg,
          // saving time repeating
          border: border,
          enabledBorder: border,
          errorBorder: border,
          focusedBorder: border


          ,filled: true,
          fillColor: Appcolors.darkGrey,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 4),
            child: prefixIcon,
          ),
          prefixIconColor: Appcolors.white,
          suffixIcon: isPassword ? Icon(Icons.remove_red_eye,color: Appcolors.white,) : suffixIcon,
          prefixIconConstraints: BoxConstraints(
            maxWidth: 40,
            maxHeight: 40,
            minHeight: 40,
            minWidth: 40,
          ),
        ),
        controller: controller,
        minLines: minLines,
        maxLines: minLines,
        onChanged: (text){
          print("text");
        },
        obscureText: isPassword,
      ),
    );
  }
}


