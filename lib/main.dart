import 'package:flutter/material.dart';

import './screens/homeScreen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TMDB",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff032541),
        accentColor: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TMDB(),
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
