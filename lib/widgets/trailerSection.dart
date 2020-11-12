import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import './movieCard.dart';
import '../models/trendingMoviesAPI.dart';
import '../models/movieVideosAPI.dart';

class TrailerSection extends StatefulWidget {
  @override
  _TrailerSectionState createState() => _TrailerSectionState();
}

class _TrailerSectionState extends State<TrailerSection> {
  Future<void> _urlLauncher(String url) async {
    if (await canLaunch(url)) {
      print("1");
      await launch(url);
    } else {
      print("2");
      url = null;
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text("ERROR: Cannot open trailer"),
          elevation: 7,
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Faker faker = Faker();
    final trendingMovies = Provider.of<TrendingMovies>(context);
    Provider.of<TrendingMovies>(context, listen: false).fetchTrendingMovies();
    return Stack(
      children: [
        Container(
          height: 350,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                Colors.grey.shade900.withOpacity(0.6),
                BlendMode.color,
              ),
              image: NetworkImage(
                "https://image.tmdb.org/t/p/w600_and_h900_bestv2/ekraj4ksvIKeuvQVEevEJkuybZd.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(36.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Latest Trailers",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 250,
                child: ListView.builder(
                  itemBuilder: (contxt, index) => Column(
                    children: [
                      MovieCard(
                        imageURL: trendingMovies.movies[index].moviePoster,
                        // "https://image.tmdb.org/t/p/w220_and_h330_face/n6hptKS7Y0ZjkYwbqKOK3jz9XAC.jpg",
                        // Replace with image from TMDB API
                        stackChild: Center(
                          child: InkWell(
                            child: SizedBox(
                              height: 40,
                              child: Image.asset(
                                "lib/assets/images/playButton.png",
                                color: Colors.white70,
                              ),
                            ),
                            onTap: () async {
                              await Provider.of<MovieVideos>(context,
                                      listen: false)
                                  .fetchVideos(
                                      trendingMovies.movies[index].movieId);
                              final videos = Provider.of<MovieVideos>(context,
                                      listen: false)
                                  .videos;
                              if (videos.isEmpty) {
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("ERROR: Cannot open trailer"),
                                    elevation: 7,
                                    backgroundColor:
                                        Theme.of(context).errorColor,
                                  ),
                                );
                                return;
                              }
                              final videoURLkey = videos[0].videoKey;
                              _urlLauncher(
                                  "https://www.youtube.com/watch?v=$videoURLkey");
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        // faker.lorem.words(5).toString(),
                        // Replace with movie title from TMDB API
                        trendingMovies.movies[index].movieTitle,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  itemCount: trendingMovies.movies.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
