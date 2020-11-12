import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import './movieAPI.dart';
import '../API_KEY.dart';

class PopularMovies with ChangeNotifier {
  List<Movie> _movies = [];

  List<Movie> get movies {
    return [..._movies];
  }

  Future<void> fetchPopularMovies() async {
    final url =
        "https://api.themoviedb.org/3/movie/popular?api_key=$API_KEY&language=en-US&page=1";
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;

    if (extractedData == null) {
      return null;
    }

    // print(json.decode(response.body));
    // print(extractedData["results"][1]["title"]);

    final List<Movie> loadedPopularMovies = [];
    for (var popularMovie in extractedData["results"]) {
      loadedPopularMovies.add(
        Movie(
          movieId: popularMovie["id"],
          movieTitle: popularMovie["title"],
          moviePoster:
              "https://image.tmdb.org/t/p/w185/${popularMovie["poster_path"]}",
          movieOverview: popularMovie["overview"],
          releaseDate: popularMovie["release_date"],
        ),
      );
    }
    _movies = loadedPopularMovies;
    notifyListeners();
  }
}
