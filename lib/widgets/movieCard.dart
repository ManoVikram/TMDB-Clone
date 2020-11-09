import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final double aspectRatio;
  final double height;
  final Widget stackChild;
  final String imageURL;

  MovieCard({
    this.aspectRatio,
    this.height,
    this.stackChild,
    this.imageURL,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 170,
      padding: EdgeInsets.only(right: 24),
      child: AspectRatio(
        aspectRatio: aspectRatio ?? 300 / 170,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageURL),
                  fit: BoxFit.cover,
                ),
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
            ),
            stackChild ?? Container(),
          ],
        ),
      ),
    );
  }
}
