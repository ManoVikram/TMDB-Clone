import 'package:flutter/material.dart';

import '../models/movieAPI.dart';
import '../widgets/customAppBar.dart';
import '../widgets/appDrawer.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const String routeName = "/movieDetails";

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context).settings.arguments as Movie;

    return Scaffold(
      backgroundColor: Color(0xFF032541),
      appBar: AppBar(
        title: CustomAppBar(),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              child: Image.network(
                movie.moviePoster,
                width: double.infinity,
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    movie.movieTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.clip,
                  ),
                  Text(
                    "Release Date: ${movie.releaseDate}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            Container(
              color: Colors.white,
              // margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                child: Column(
                  children: [
                    Text(
                      "Overview",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    Text(
                      movie.movieOverview,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
