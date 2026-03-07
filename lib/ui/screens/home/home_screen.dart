import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utilis/app_colors.dart';
import 'package:movie_app/ui/screens/home/browes_tab/browes_tab.dart';
import 'package:movie_app/ui/screens/home/home_tab/home_tab.dart';
import 'package:movie_app/ui/screens/home/profile_tab/profile_tab.dart';
import 'package:movie_app/ui/screens/home/search_tab/search_tab.dart';

import '../../../core/di/di.dart';
import '../../../core/utilis/app_assets.dart';
import '../../presentaion/movie_cubit/movie_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=0;
  var movieCubit = getIt<MovieCubit>();
  List<Widget> selctedScreenTab=[
    HomeTab(),
    SearchTab(),BrowesTab(),ProfileTab()
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieCubit.loadMovies();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => movieCubit,
      child: Scaffold(backgroundColor: Appcolors.black,
        body: selctedScreenTab[selectedIndex],
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.all(8),

          decoration: BoxDecoration(


            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
              )
            ],
          ),
          child: Theme(
          data: ThemeData(canvasColor: Appcolors.darkGrey),
          child: ClipRRect(borderRadius: BorderRadius.circular(16),
            child: BottomNavigationBar(
              selectedItemColor: Appcolors.yellow,
              unselectedItemColor: Appcolors.white,
              currentIndex: selectedIndex,
              onTap: (newIndex) {
                selectedIndex = newIndex;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    Appassets.vector,
                    width: 24,
                    color: selectedIndex == 0
                        ? Appcolors.yellow
                        : Appcolors.white,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    Appassets.vector1,
                    width: 24,
                    color: selectedIndex == 1
                        ? Appcolors.yellow
                        : Appcolors.white,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    Appassets.explore,
                    width: 24,
                    color: selectedIndex == 2
                        ? Appcolors.yellow
                        : Appcolors.white,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    Appassets.profile,
                    width: 24,
                    color: selectedIndex == 3
                        ? Appcolors.yellow
                        : Appcolors.white,
                  ),
                  label: "",
                ),
              ],
            ),
          ),
        ),
      )

      ),
    );

  }
}