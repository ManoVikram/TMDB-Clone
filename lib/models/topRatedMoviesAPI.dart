import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'movieAPI.dart';
import '../API_KEY.dart';

class TopRatedMovies with ChangeNotifier {
  List<Movie> _movies = [];

  List<Movie> get movies {
    return [..._movies];
  }

  Future<void> fetchTopRatedMovies() async {
    final url =
        "https://api.themoviedb.org/3/movie/top_rated?api_key=$API_KEY&language=en-US&page=1";
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;

    if (extractedData == null) {
      return null;
    }

    // print(json.decode(response.body));
    // print(extractedData["results"][1]["title"]);

    final List<Movie> loadedTopRatedMovies = [];
    for (var topRatedMovie in extractedData["results"]) {
      loadedTopRatedMovies.add(
        Movie(
          movieId: topRatedMovie["id"],
          movieTitle: topRatedMovie["title"],
          moviePoster:
              "https://image.tmdb.org/t/p/w185/${topRatedMovie["poster_path"]}",
          backdrop:
              "https://image.tmdb.org/t/p/w185/${topRatedMovie["backdrop_path"]}",
          movieRating: topRatedMovie["vote_average"] * 1.0,
          movieOverview: topRatedMovie["overview"],
          releaseDate: topRatedMovie["release_date"],
        ),
      );
    }
    _movies = loadedTopRatedMovies;
    notifyListeners();
  }
}
