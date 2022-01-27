import 'package:flutter/material.dart';
import 'package:smartfarming/views/mobile/account/notification_screen.dart';
import 'package:smartfarming/views/mobile/home/swiggy_screen.dart';

import '../../utils/app_colors.dart';
import 'account/account_screen.dart';

class HomeBottomNavigationScreen extends StatefulWidget {
  const HomeBottomNavigationScreen({Key? key}) : super(key: key);

  @override
  _HomeBottomNavigationScreenState createState() =>
      _HomeBottomNavigationScreenState();
}

class _HomeBottomNavigationScreenState
    extends State<HomeBottomNavigationScreen> {
  final List<Widget> _children = [
    const SwiggyScreen(),
    NotificationScreen(),
    AccountScreen(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final labelTextStyle =
        Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 8.0);
    return Scaffold(
      body: _children[selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 50.0,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: darkOrange,
          unselectedItemColor: Colors.grey,
          currentIndex: selectedIndex,
          selectedLabelStyle: labelTextStyle,
          unselectedLabelStyle: labelTextStyle,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'HOME',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'NOTIFICATION',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'ACCOUNT',
            ),
          ],
        ),
      ),
    );
  }
}
