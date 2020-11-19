import 'package:flutter/material.dart';

import '../../models/movieAPI.dart';

class MovieBanner extends StatelessWidget {
  final Movie movie;

  MovieBanner(this.movie);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Color(0xFF0D253F),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.blueGrey,
                BlendMode.color,
              ),
              child: Image.network(
                "${movie.backdrop}",
                width: size.width,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image.network(
                    "${movie.moviePoster}",
                    width: size.width * 0.5,
                    height: 260,
                  ),
                ),
                /* Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${movie.movieTitle}",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.clip,
                      softWrap: true,
                    ),
                    Text(
                      "(${movie.releaseDate.substring(0, 4)})",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ), */
              ],
            ),
          ),
        ],
      ),
    );
  }
}
