import 'package:flutter/material.dart';

import '../widgets/customAppBar.dart';
import '../widgets/topBanner.dart';
import '../widgets/popularSection.dart';
import '../widgets/trailerSection.dart';
import '../widgets/leaderboardSection.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: CustomAppBar(),
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            TopBanner(),
            PopularSection(),
            TrailerSection(),
            LeaderboardSection(),
          ],
        ),
      ),
    );
  }
}
