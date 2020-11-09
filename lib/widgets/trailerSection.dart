import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

import './movieCard.dart';

class TrailerSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Faker faker = Faker();
    return Stack(
      children: [
        Container(
          height: 350,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                Colors.grey.shade900.withOpacity(0.6),
                BlendMode.color,
              ),
              image: NetworkImage(
                "https://image.tmdb.org/t/p/w600_and_h900_bestv2/ekraj4ksvIKeuvQVEevEJkuybZd.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(36.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Latest Trailers",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 250,
                child: ListView.builder(
                  itemBuilder: (contxt, index) => Column(
                    children: [
                      MovieCard(
                        imageURL:
                            "https://image.tmdb.org/t/p/w220_and_h330_face/n6hptKS7Y0ZjkYwbqKOK3jz9XAC.jpg",
                        // Replace with image from TMDB API
                        stackChild: Center(
                          child: SizedBox(
                            height: 40,
                            child: Image.asset(
                              "lib/assets/images/playButton.png",
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        faker.lorem.words(5).toString(),
                        // Replace with movie title from TMDB API
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
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
        ),
      ],
    );
  }
}
