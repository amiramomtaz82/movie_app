import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_text_style.dart';
import 'package:movie_app/ui/screens/home/home_tab/image_view.dart';

import '../../../../core/app_constant.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedMovie = "";
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Container( height: 650, width: double.infinity,
        child: Stack(children: [
          Image.asset(movieList[currentIndex], height: double.infinity,
            width: double.infinity, fit: BoxFit.cover,
          ),
          Container(decoration: BoxDecoration(gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Appcolors.black.withOpacity(0.7),
              // Start with slight opacity
              Colors.black.withOpacity(.9,)
            ],
          ),


          )
          ),
          Align(alignment: Alignment.topCenter
              , child: Image.asset(Appassets.availableNow)),

          Align(alignment: Alignment.center,
            child: Container(height: 500,
                child: CarouselSlider.builder(

                  itemCount: movieList.length,
                  itemBuilder: (context, index, realIndex) {
                    return Center(
                      child: ClipRRect(borderRadius: BorderRadius.circular(16),
                        child: InkWell(onTap: () {
                          selectedMovie = movieList[index];

                          setState(() {

                          });
                        },
                          child: Image.asset(
                            movieList[index],
                            height: 350,
                            width: 250,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    onPageChanged: (index, r) {
                      currentIndex = index;
                      setState(() {

                      });
                    },
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.5
                    ,
                    autoPlay: false,
                    enlargeCenterPage: true,
                    viewportFraction: 0.7,

                  ),

                )
            ),
          ),

          Align(alignment: Alignment.bottomCenter,
              child: Image.asset(Appassets.watchNow))

        ],),


      ),
      Container(width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(Appstrings.actions, style: Appstyles.white16Reg,
                  textAlign: TextAlign.left,),
                Spacer(),
                InkWell(onTap: () {},

                    child: Text(
                      Appstrings.seeMore, style: Appstyles.yellow14regular,)),
                Icon(Icons.arrow_forward, size: 15, color: Appcolors.yellow,)
              ],
            ),
          )),
      SizedBox(height: 250,
          child: ListView.builder(scrollDirection: Axis.horizontal,
              itemCount: movieList.length,
              itemBuilder:
                  (context, index) =>
                      imageView(movieList[index]))
          ),
        SizedBox(height: 20,),
        Container(width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(Appstrings.adventure, style: Appstyles.white16Reg,
                    textAlign: TextAlign.left,),
                  Spacer(),
                  InkWell(onTap: () {},

                      child: Text(
                        Appstrings.seeMore, style: Appstyles.yellow14regular,)),
                  Icon(Icons.arrow_forward, size: 15, color: Appcolors.yellow,)
                ],
              ),
            )),


        SizedBox(height: 250,
            child: ListView.builder(scrollDirection: Axis.horizontal,
                itemCount: movieList.length,
                itemBuilder:
                    (context, index) =>
                    imageView(movieList[index]))
        ),
        SizedBox(height: 20,),
        Container(width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(Appstrings.animation, style: Appstyles.white16Reg,
                    textAlign: TextAlign.left,),
                  Spacer(),
                  InkWell(onTap: () {},

                      child: Text(
                        Appstrings.seeMore, style: Appstyles.yellow14regular,)),
                  Icon(Icons.arrow_forward, size: 15, color: Appcolors.yellow,)
                ],
              ),
            )),

        SizedBox(height: 250,
            child: ListView.builder(scrollDirection: Axis.horizontal,
                itemCount: movieList.length,
                itemBuilder:
                    (context, index) =>
                    imageView(movieList[index]))
        ),
        SizedBox(height: 20,),

        SizedBox(height: 250,
            child: ListView.builder(scrollDirection: Axis.horizontal,
                itemCount: movieList.length,
                itemBuilder:
                    (context, index) =>
                    imageView(movieList[index]))
        ),
        SizedBox(height: 20,),

        SizedBox(height: 250,
            child: ListView.builder(scrollDirection: Axis.horizontal,
                itemCount: movieList.length,
                itemBuilder:
                    (context, index) =>
                    imageView(movieList[index]))
        ),
        SizedBox(height: 20,),


          ]),
    );
  }
}


