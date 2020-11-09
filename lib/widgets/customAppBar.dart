import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  Row get _logo => Row(
        children: [
          SizedBox(
            width: 7,
          ),
          Image.asset(
            "lib/assets/images/TMDB_logo.png",
            width: 150,
          ),
        ],
      );

  Row get _search => Row(
        children: [
          Icon(Icons.search),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _logo,
        _search,
      ],
    );
  }
}
