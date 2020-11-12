import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 160,
      height: 180,
      color: Color(0xFF032541),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100,
            child: Image(
              image: AssetImage(
                "lib/assets/images/TMDBfooterLogo.jpg",
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SocialAppIcon(FontAwesomeIcons.github),
              SocialAppIcon(FontAwesomeIcons.facebook),
              SocialAppIcon(FontAwesomeIcons.twitter),
              SocialAppIcon(FontAwesomeIcons.instagram),
              SocialAppIcon(FontAwesomeIcons.linkedin),
              SocialAppIcon(FontAwesomeIcons.youtube),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Text(
                // "Coded with \u2764️ by Mano Vikram",
                "Coded with ❤️ by Mano Vikram",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SocialAppIcon extends StatelessWidget {
  final IconData icon;

  SocialAppIcon(this.icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: InkWell(
        child: Material(
          color: Color(0xFF01B4E4),
          // color: Colors.blue,
          shape: CircleBorder(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
