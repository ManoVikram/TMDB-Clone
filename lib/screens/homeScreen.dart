import 'package:flutter/material.dart';

import '../widgets/customAppBar.dart';
import '../widgets/appDrawer.dart';
import '../widgets/topBanner.dart';
import '../widgets/popularSection.dart';
import '../widgets/trailerSection.dart';
import '../widgets/topRatedSection.dart';
import '../widgets/leaderboardSection.dart';
import '../widgets/footer.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/homeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: CustomAppBar(),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            TopBanner(),
            PopularSection(),
            TrailerSection(),
            TopRatedSection(),
            LeaderboardSection(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
