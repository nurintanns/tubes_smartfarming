import 'package:flutter/material.dart';

import 'shared/app_theme.dart';
import 'views/mobile/mobile_screen.dart';
import 'widgets/responsive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SwiggyUI',
      debugShowCheckedModeBanner: false,
      theme: appPrimaryTheme(),
      home: const Responsive(
        mobile: MobileScreen(),
      ),
    );
  }
}
