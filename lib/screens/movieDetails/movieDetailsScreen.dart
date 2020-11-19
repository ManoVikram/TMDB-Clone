import 'package:flutter/material.dart';

import '../../widgets/customAppBar.dart';
import '../../widgets/appDrawer.dart';
import '../../models/movieAPI.dart';
import '../../widgets/movieDetailsWidgets/movieDetails.dart';
import './../../widgets/movieDetailsWidgets/movieBanner.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const String routeName = "/movieDetails";

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context).settings.arguments as Movie;

    return Scaffold(
      appBar: AppBar(
        title: CustomAppBar(),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MovieBanner(movie),
            MovieDetails(movie),
          ],
        ),
      ),
    );
  }
}
