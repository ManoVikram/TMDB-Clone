import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/homeScreen.dart';
import './models/popularMoviesAPI.dart';
import './models/topRatedMoviesAPI.dart';
import './models/movieVideosAPI.dart';
import './models/trendingMoviesAPI.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (contxt) => PopularMovies(),
        ),
        ChangeNotifierProvider(
          create: (contxt) => TopRatedMovies(),
        ),
        ChangeNotifierProvider(
          create: (contxt) => MovieVideos(),
        ),
        ChangeNotifierProvider(
          create: (contxt) => TrendingMovies(),
        ),
      ],
      child: MaterialApp(
        title: "TMDB",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xff032541),
          accentColor: Color(0xFF01B4E4),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: TMDB(),
      ),
    );
  }
}

class TMDB extends StatefulWidget {
  @override
  _TMDBState createState() => _TMDBState();
}

class _TMDBState extends State<TMDB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
    );
  }
}

void main() => runApp(MyApp());
