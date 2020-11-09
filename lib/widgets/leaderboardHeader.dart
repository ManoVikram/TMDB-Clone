import 'package:flutter/material.dart';

class LeaderboardHeader extends StatelessWidget {
  Widget _editLeaderboardHeader(
      String title, int primaryColor, int secondaryColor) {
    return Row(
      children: [
        _bulletCircle(
          primaryColor,
          secondaryColor,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _bulletCircle(int primaryColor, int secondaryColor) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Color(primaryColor),
            Color(secondaryColor),
          ],
          begin: Alignment.centerRight,
          end: Alignment(-1, -1),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        "Leaderboard",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      title: _editLeaderboardHeader(
        "All Time Edits",
        0xFFDF4F65,
        0xFFFCBD6F,
      ),
      subtitle: _editLeaderboardHeader(
        "Edits This Week",
        0xFF2FD9AD,
        0xFFB3FBCC,
      ),
    );
  }
}
