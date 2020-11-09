import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './leaderboardRating.dart';
import '../models/ratings.dart';

class LeaderboardTile extends StatelessWidget {
  Widget _tile(Ratings rating) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: InkWell(
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(rating.leadingUserImage),
                  backgroundColor: Colors.transparent,
                ),
                onTap: () {},
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: InkWell(
                    child: Text(
                      rating.leadingUserDetails,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                LeaderboardRating(rating),
              ],
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    final ratings = Provider.of<RatingsData>(context, listen: false).ratings;
    return Container(
      height: 800,
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          ...ratings.map((rating) => _tile(rating)).toList(),
        ],
        shrinkWrap: true,
      ),
    );
  }
}
