import 'package:flutter/material.dart';
import 'package:smartfarming/main.dart';
import 'package:smartfarming/views/mobile/login.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:smartfarming/views/mobile/home_bottom_navigation_screen.dart';
import 'views/mobile/mobile_screen.dart';
import 'widgets/responsive.dart';

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 5, //mengatur waktu
      navigateAfterSeconds: Responsive(
        mobile: MobileScreen(),
      ),
      image: Image.asset('assets/images/logo.jpg'),
      photoSize: 150.0,
    );
  }
}
