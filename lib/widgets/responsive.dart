import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    Key? key,
    required this.mobile,
  }) : super(key: key);

  final Widget mobile;

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 650;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 650 &&
        MediaQuery.of(context).size.width < 1100;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1100;
  }

  static bool isTabletDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 650;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return mobile;
      },
    );
  }
}
