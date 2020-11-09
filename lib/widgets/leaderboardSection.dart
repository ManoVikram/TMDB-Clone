import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './leaderboardHeader.dart';
import './leaderboardTile.dart';
import '../models/ratings.dart';

class LeaderboardSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RatingsData(),
      child: Column(
        children: [
          LeaderboardHeader(),
          LeaderboardTile(),
        ],
      ),
    );
  }
}
