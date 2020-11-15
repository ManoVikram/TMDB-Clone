import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import './screens/homeScreen.dart';
import './screens/welcomeScreen.dart';
import './screens/loginScreen.dart';
import './screens/signUpScreen.dart';
import './screens/movieDetailsScreen.dart';
import './models/popularMoviesAPI.dart';
import './models/topRatedMoviesAPI.dart';
import './models/movieVideosAPI.dart';
import './models/trendingMoviesAPI.dart';
import './models/auth.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // WidgetsFlutterBinding.ensureInitialized();
    // final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return /* FutureBuilder(
      future: _initialization,
      // future: Firebase.initializeApp(),
      builder: (context, snapshot) => */
        MultiProvider(
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
        ChangeNotifierProvider(
          create: (contxt) => Auth(),
        ),
      ],
      child:
          /* FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) =>  */
          MaterialApp(
        title: "TMDB",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xff032541),
          accentColor: Color(0xFF01B4E4),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: TMDB(),
        routes: {
          WelcomeScreen.routeName: (contxt) => WelcomeScreen(),
          LoginScreen.routeName: (contxt) => LoginScreen(),
          SignUpScreen.routeName: (contxt) => SignUpScreen(),
          HomeScreen.routeName: (contxt) => HomeScreen(),
          MovieDetailsScreen.routeName: (contxt) => MovieDetailsScreen(),
        },
      ),
      // ),
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
      // body: HomeScreen(),
      // body: WelcomeScreen(),
      body: StreamBuilder(
        // stream: FirebaseAuth.instance.authStateChanges(),
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (contxt, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (userSnapshot.hasData) {
            return HomeScreen();
          }

          return WelcomeScreen();
        },
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
