import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import './movieCard.dart';
import '../screens/movieDetailsScreen.dart';
import '../models/popularMoviesAPI.dart';

class PopularSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Faker faker = Faker();
    final popularMovies = Provider.of<PopularMovies>(context);
    Provider.of<PopularMovies>(context, listen: false).fetchPopularMovies();
    // print(DateFormat.yMMM().format(DateTime.now()));
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              "What's Popular",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            height: 250,
            child: ListView.builder(
              itemBuilder: (contxt, index) => InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    MovieDetailsScreen.routeName,
                    arguments: popularMovies.movies[index],
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MovieCard(
                      imageURL:
                          // Movie image from TMDB API
                          popularMovies.movies[index].moviePoster,
                      // "https://images.pexels.com/photos/3381013/pexels-photo-3381013.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                      height: 200,
                      aspectRatio: 4 / 6,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              // faker.person.firstName(),
                              popularMovies.movies[index].movieTitle,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              // Movie release date from TMDB API
                              DateFormat.yMMM()
                                  .format(DateTime.parse(
                                      popularMovies.movies[index].releaseDate))
                                  .toString(),
                              // "${faker.date.month().toString()} ${faker.date.year().toString()}",
                              overflow: TextOverflow.fade,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              itemCount: popularMovies.movies.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
