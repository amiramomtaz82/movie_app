import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../core/app_text_style.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final Widget? icon;
  final bool enableBorder;
  final Color borderColor;
  final VoidCallback? onClick;
  const CustomElevatedButton({
    super.key,
    required this.text,
    this.borderColor=Appcolors.yellow,





     this.onClick,
    this.textColor = Appcolors.black,
    this.backgroundColor = Appcolors.yellow,
    this.enableBorder = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(side: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(16),),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              text,
              style: Appstyles.black20med.copyWith(color: textColor),
            ), if (icon != null) ...[SizedBox(width: 4),icon!, ],
          ],
        ),
      ),
    );
  }
  }

