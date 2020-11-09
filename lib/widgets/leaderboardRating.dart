import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LeaderboardRating extends StatelessWidget {
  final rating;

  LeaderboardRating(this.rating);

  Widget _linearPercentIndicator(double ratingPercent, String ratingValue,
          int primaryColor, int secondaryColor, BuildContext contxt) =>
      LinearPercentIndicator(
        width: MediaQuery.of(contxt).size.width - 150,
        lineHeight: 8,
        animation: true,
        animationDuration: 2500,
        percent: ratingPercent,
        trailing: Text(
          ratingValue,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        linearStrokeCap: LinearStrokeCap.roundAll,
        linearGradient: LinearGradient(
          colors: [
            Color(primaryColor),
            Color(secondaryColor),
          ],
          begin: Alignment.centerRight,
          end: Alignment(-1, -1),
        ),
        backgroundColor: Colors.white,
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _linearPercentIndicator(
          rating.allTimeEditPercent,
          rating.allTimeEditValue,
          0xFF2FD9AD,
          0xFFB3FBCC,
          context,
        ),
        _linearPercentIndicator(
          rating.editsThisWeekPercent,
          rating.editsThisWeekValue,
          0xFFDF4F65,
          0xFFFCBD6F,
          context,
        ),
      ],
    );
  }
}
