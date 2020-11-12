import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../API_KEY.dart';

class Video {
  final String videoKey;
  final String videoSite;
  final String videoType;

  Video({this.videoKey, this.videoSite, this.videoType});
}

class MovieVideos with ChangeNotifier {
  List<Video> _videos = [];

  List<Video> get videos {
    return [..._videos];
  }

  Future<void> fetchVideos(int movieId) async {
    final url =
        "https://api.themoviedb.org/3/movie/$movieId/videos?api_key=$API_KEY&language=en-US";
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;

    if (extractedData == null) {
      return null;
    }

    final List<Video> loadedVideos = [];
    for (var video in extractedData["results"]) {
      loadedVideos.add(
        Video(
          videoKey: video["key"],
          videoSite: video["site"],
          videoType: video["type"],
        ),
      );
    }
    _videos = loadedVideos;
    notifyListeners();
  }
}
