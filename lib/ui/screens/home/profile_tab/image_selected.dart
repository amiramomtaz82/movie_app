import 'package:flutter/material.dart';
import 'package:movie_app/core/utilis/app_colors.dart';
//
// class ImageSelected extends StatefulWidget {
//   String image;
// VoidCallback function;
//   bool isSelected=true;
//  ImageSelected({Key? key,required this.image,required this.isSelected,required this.function}) : super(key: key);
//
//   @override
//   _ImageSelectedState createState() => _ImageSelectedState();
// }
//
// class _ImageSelectedState extends State<ImageSelected> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: InkWell(onTap:widget.function,
//
//
//
//         child: Container(width: 80,height: 85,
//             decoration: BoxDecoration(
//             gradient:widget.isSelected? LinearGradient(
//                 colors:[
//                   Appcolors.yellow.withOpacity(0.56),
//                   Colors.white.withOpacity(0.0),
//                 ],
//                 begin: Alignment.center,
//                 end: Alignment.center):null,
//
//         borderRadius: BorderRadius.circular(16)),
//             child: Image.asset(widget.image,)),
//       ),
//     );
//   }
// }
class ImageSelected extends StatelessWidget {
  final String image;
  final bool isSelected;
  final VoidCallback onTap;

  const ImageSelected({
    Key? key,
    required this.image,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 80,
          height: 85,
          decoration: BoxDecoration(
            gradient: isSelected
                ? LinearGradient(
              colors: [
                Appcolors.yellow.withOpacity(0.56),
                Colors.white.withOpacity(0.0)
              ],

             begin: Alignment.center,
                end: Alignment.center)
                : null,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.asset(image),
        ),
      ),
    );
  }
}