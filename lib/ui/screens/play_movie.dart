import 'package:flutter/material.dart';
import 'package:movie_app/core/utilis/app_colors.dart';
import 'package:movie_app/ui/app_widget/custome_elevated_button.dart';
import 'package:url_launcher/url_launcher.dart';

class PlayMovie extends StatelessWidget {
  final String url;

  const PlayMovie({super.key, required this.url});

  Future<void> _openMovie() async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Appcolors.black,

      body: Center(
        child: CustomElevatedButton(backgroundColor: Appcolors.yellow,
        textColor: Appcolors.white,
        onClick: _openMovie,
        text: "Watch Movie"),

      )
    );
  }
}