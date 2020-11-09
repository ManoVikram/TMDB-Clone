import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

import './movieCard.dart';

class PopularSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Faker faker = Faker();
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              "What's Popular",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            height: 250,
            child: ListView.builder(
              itemBuilder: (contxt, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieCard(
                    imageURL:
                        // Movie image from TMDB API
                        "https://images.pexels.com/photos/3381013/pexels-photo-3381013.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                    height: 200,
                    aspectRatio: 4 / 6,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          faker.person.firstName(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          // Movie release date from TMDB API
                          "${faker.date.month().toString()} ${faker.date.year().toString()}",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              itemCount: 20,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
