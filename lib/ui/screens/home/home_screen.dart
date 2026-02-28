import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/ui/screens/home/home_tab/home_tab.dart';

import '../../../core/app_assets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Appcolors.black,
      body: HomeTab(),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(8),

        decoration: BoxDecoration(
          color: Appcolors.darkGrey,
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
    )

    );

  }
}