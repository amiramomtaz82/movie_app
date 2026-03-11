import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utilis/app_assets.dart';
import 'package:movie_app/core/utilis/app_colors.dart';
import 'package:movie_app/core/utilis/app_text_style.dart';
import 'package:movie_app/ui/presentaion/movie_cubit/home_tab_cubit/cubit.dart';
import 'package:movie_app/ui/screens/home/home_tab/build_crouse_slide.dart';
import 'package:movie_app/ui/screens/home/home_tab/genre_widget.dart';
import 'package:movie_app/ui/screens/home/home_tab/image_view.dart';

import '../../../../core/di/di.dart';
import '../../../../core/utilis/app_constant.dart';
import '../../../presentaion/movie_cubit/genre_cubit.dart';
import '../../movie_details/genger_card.dart';

class HomeTab extends StatefulWidget {

  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
late HomeCubit homeCubit;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeCubit=getIt<HomeCubit>();
    loadHome();
}
Future<void> loadHome() async {
  await homeCubit.loadMovies(); // load carousel first

  for (var genre in gengerTitleList) {
   await homeCubit.loadMoviesByGenre(genre);
  }
}

  @override
  Widget build(BuildContext context) {
    return
      BlocProvider.value(value: homeCubit ,
      child: Scaffold(backgroundColor: Appcolors.black,
        body: SingleChildScrollView(
          child: Column(children: [BuildCrouseSlide(),
            ...gengerTitleList.map(
            (genre) =>GenreWidget(genre: genre),),
            SizedBox(height: 30,)



              ]),
        ),
      ),
    );
  }
}


