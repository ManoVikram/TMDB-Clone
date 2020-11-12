import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          /* SvgPicture.asset(
            "lib/assets/images/TMDB_logo.svg",
          ), */
        ],
      );

  Row get _searchAndUser => Row(
        children: [
          Icon(Icons.search),
          /* SizedBox(
            width: 7,
          ),
          DropdownButton(
            icon: Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
            items: [
              DropdownMenuItem(
                child: Text("Logout"),
                value: "logout",
              ),
            ],
            underline: Container(),
            onChanged: (value) {},
          ), */
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _logo,
        _searchAndUser,
      ],
    );
  }
}
