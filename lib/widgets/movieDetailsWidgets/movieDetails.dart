import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../models/movieAPI.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;

  MovieDetails(this.movie);

  Widget socialAppIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: InkWell(
        child: Material(
          color: Color(0xFF01B4E4),
          // color: Colors.blue,
          shape: CircleBorder(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
        onTap: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          width: double.infinity,
          color: Color(0xFF0D253F),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${movie.movieTitle}",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.clip,
                    softWrap: true,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "(${movie.releaseDate.substring(0, 4)})",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.favorite,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Movie Score 🔥🔥🔥",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  /* VerticalDivider(
                    color: Colors.black,
                    thickness: 50,
                  ), */
                  SizedBox(
                    width: 26,
                  ),
                  Container(
                    height: 80,
                    width: 80,
                    // color: Colors.white,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: SfRadialGauge(
                      // backgroundColor: Colors.blue[900],
                      axes: [
                        RadialAxis(
                          startAngle: 90,
                          endAngle: 90,
                          // showAxisLine: false,
                          showLabels: false,
                          showFirstLabel: false,
                          showTicks: false,
                          minimum: 0,
                          maximum: 100,
                          axisLineStyle: AxisLineStyle(
                            thickness: 0.2,
                            thicknessUnit: GaugeSizeUnit.factor,
                            cornerStyle: CornerStyle.bothFlat,
                            // color: Colors.lightGreenAccent[100],
                            color: Colors.red,
                            // color: Color(0xFF1DB954),
                          ),
                          pointers: [
                            RangePointer(
                              value: movie.movieRating * 10.0,
                              cornerStyle: CornerStyle.bothCurve,
                              width: 0.2,
                              sizeUnit: GaugeSizeUnit.factor,
                              color: Color(0xFF1DB954),
                            ),
                          ],
                          annotations: [
                            GaugeAnnotation(
                              positionFactor: 0.1,
                              angle: 90,
                              widget: Text(
                                "${(movie.movieRating * 10.0).round()}%",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Overview",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  height: 2,
                ),
              ),
              Text(
                movie.movieOverview,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                overflow: TextOverflow.clip,
                softWrap: true,
              ),
            ],
          ),
        ),
        /* Container(
          // height: 160,
          height: 180,
          // color: Color(0xFF032541),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Image(
                  image: AssetImage(
                    "lib/assets/images/TMDB_shortLogo.jpeg",
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SocialAppIcon(FontAwesomeIcons.github),
                  socialAppIcon(FontAwesomeIcons.facebook),
                  socialAppIcon(FontAwesomeIcons.twitter),
                  socialAppIcon(FontAwesomeIcons.instagram),
                  socialAppIcon(FontAwesomeIcons.linkedin),
                  socialAppIcon(FontAwesomeIcons.youtube),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Text(
                    // "Coded with \u2764️ by Mano Vikram",
                    "Coded with ❤️ by Mano Vikram",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            ],
          ),
        ), */
        Container(
          color: Color(0xFF0D253F),
          height: 50,
          child: Center(
            child: Text(
              // "Coded with \u2764️ by Mano Vikram",
              "Coded with ❤️ by Mano Vikram",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
