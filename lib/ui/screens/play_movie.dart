import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/utilis/app_colors.dart';
import '../../domain/models/movieDetails_model.dart';
import '../app_widget/custome_elevated_button.dart';
import '../presentaion/history_cubit/histor_cubit.dart';

class PlayMovie extends StatelessWidget {
  final String url;
  final MovieDetailsModel movie;

  const PlayMovie({
    super.key,
    required this.url,
    required this.movie,
  });

  Future<void> _openMovie(BuildContext context) async {
    final Uri uri = Uri.parse(url);

    // add movie to history
    context.read<HistoryCubit>().addMovieToHistory(movie);
    print("88888888888888888888888888888888888888888888888888");
    print("88888888888888888888888888888888888888888888888888");
    print("88888888888888888888888888888888888888888888888888");
    print("88888888888888888888888888888888888888888888888888");
    print("88888888888888888888888888888888888888888888888888");
    print("88888888888888888888888888888888888888888888888888");

    print(movie.cast);

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.black,
      body: Center(
        child: CustomElevatedButton(
          backgroundColor: Appcolors.yellow,
          textColor: Appcolors.white,
          onClick: () {
            print("BUTTON PRESSED=======================");
            _openMovie(context);
          },
          text: "Watch Movie",
        ),
      ),
    );
  }
}