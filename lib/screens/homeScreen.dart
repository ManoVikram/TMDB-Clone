import 'package:flutter/material.dart';

import '../widgets/customAppBar.dart';
import '../widgets/topBanner.dart';
import '../widgets/popularSection.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: CustomAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBanner(),
            PopularSection(),
          ],
        ),
      ),
    );
  }
}
