import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utilis/app_colors.dart';
import 'package:movie_app/core/utilis/app_constant.dart';
import 'package:movie_app/ui/screens/home/movie_image.dart';

import '../../../../core/di/di.dart';
import '../../../../core/utilis/resource.dart';
import '../../../presentaion/movie_cubit/movie_cubit.dart';
import '../../../presentaion/movie_cubit/movie_cubit_state.dart';
import '../profile_tab/image_selected.dart';

class BrowesTab extends StatefulWidget {
  const BrowesTab({Key? key}) : super(key: key);

  @override
  State<BrowesTab> createState() => _BrowesTabState();
}

class _BrowesTabState extends State<BrowesTab> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {

        if (state.moviesApi.status == ApiStatus.success &&
            state.moviesApi.data != null) {

          return GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
            ),
            itemCount: state.moviesApi.data!.length,
            itemBuilder: (context, index) {
              return MovieImage(
                movie: state.moviesApi.data![index],
                rating: state.moviesApi.data![index],
              );
            },
          );
        }

        else if (state.moviesApi.status == ApiStatus.error) {
          return Text(state.moviesApi.errorMessage ?? "");
        }

        else {
          print("-----------------------------");
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }}