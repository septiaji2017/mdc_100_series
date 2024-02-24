import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'colors.dart';
import 'dart:io';
import 'package:android_intent/android_intent.dart';

void launchURL(String url) async {
  final AndroidIntent intent = AndroidIntent(
    action: 'action_view',
    data: url,
  );

  try {
    await intent.launch();
  } catch (e) {
    print('Error launching URL: $e');
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Page'),
        backgroundColor: kShrineSurfaceWhite,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                'assets/julya_lemniscate.png', // Replace with the path to your image
                width: 150, // Adjust the width as needed
                height: 150, // Adjust the height as needed
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Ridha Septiaji (221511028)',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 5),
            Text(
              'Cimahi, Jawa Barat',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialMediaButton(
                  buttonColor: Color(0xFF1877F2),
                  icon: Icons.facebook,
                  onPressed: () {
                    // launch('https://www.facebook.com/ridhaseptiaji.ridhaseptiaji.9');
                    launchURL('https://www.facebook.com/ridhaseptiaji.ridhaseptiaji.9');
                  },
                ),
                SizedBox(width: 20),
                SocialMediaButton(
                  buttonColor: Color(0xFF1DA1F2),
                  iconPath: 'assets/twitter.svg',
                  onPressed: () {
                    // launch('https://twitter.com/SeptiajiRidha');
                    launchURL('https://twitter.com/SeptiajiRidha');
                  },
                ),
                SizedBox(width: 20),
                SocialMediaButton(
                  buttonColor: Color(0xFFC13584),
                  iconPath: 'assets/instagram.svg',
                  onPressed: () {
                    // launch('https://www.instagram.com/septiaji2017/');
                    launchURL('https://www.instagram.com/septiaji2017/');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SocialMediaButton extends StatelessWidget {
  final String? iconPath;
  final IconData? icon;
  final Color buttonColor;
  final VoidCallback onPressed;

  const SocialMediaButton({
    this.iconPath,
    this.icon,
    required this.buttonColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: buttonColor, // You can customize the color
        ),
        child: Center(
          child: icon != null
              ? Icon(
            icon,
            color: Colors.white, // You can customize the icon color
          )
              : SvgPicture.asset(
            iconPath!,
            width: 25, // Adjust the width of the icon as needed
            height: 25, // Adjust the height of the icon as needed
            color: Colors.white, // You can customize the icon color
          ),
        ),
      ),
    );
  }
}

