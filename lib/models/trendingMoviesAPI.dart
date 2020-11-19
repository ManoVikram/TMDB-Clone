import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'movieAPI.dart';
import '../API_KEY.dart';

class TrendingMovies with ChangeNotifier {
  List<Movie> _movies = [];

  List<Movie> get movies {
    return [..._movies];
  }

  Future<void> fetchTrendingMovies() async {
    final url =
        "https://api.themoviedb.org/3/trending/movie/day?api_key=$API_KEY";
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;

    if (extractedData == null) {
      return null;
    }

    // print(json.decode(response.body));
    // print(extractedData["results"][1]["title"]);

    final List<Movie> loadedTrendingMovies = [];
    for (var trendingMovie in extractedData["results"]) {
      loadedTrendingMovies.add(
        Movie(
          movieId: trendingMovie["id"],
          movieTitle: trendingMovie["title"],
          moviePoster:
              "https://image.tmdb.org/t/p/w185/${trendingMovie["poster_path"]}",
          backdrop:
              "https://image.tmdb.org/t/p/w185/${trendingMovie["backdrop_path"]}",
          movieRating: trendingMovie["vote_average"] * 1.0,
          movieOverview: trendingMovie["overview"],
          releaseDate: trendingMovie["release_date"],
        ),
      );
    }
    _movies = loadedTrendingMovies;
    notifyListeners();
  }
}
