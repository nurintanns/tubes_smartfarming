import 'package:flutter/material.dart';

import 'home.dart';

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

enum TabItem { home, favorite, notification, account }

class MainPageState extends State<MainPage> {
  TabItem _currentItem = TabItem.home;
  final List<TabItem> _bottomTabs = [
    TabItem.home,
    TabItem.favorite,
    TabItem.notification,
    TabItem.account
  ];

  void _onSelectTab(int index) {
    TabItem selectedTabItem = _bottomTabs[index];

    setState(() {
      _currentItem = selectedTabItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90.0,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context)),
        backgroundColor: Color(0xFFFAFAFA),
        centerTitle: true,
        title: Text(
          "Ensiklopedia Tumbuhan",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: _buildPage(),
      ),
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(TabItem tabItem) {
    Color color = _currentItem == tabItem ? Colors.green : Colors.grey.shade400;

    IconData _icon(TabItem item) {
      switch (item) {
        case TabItem.home:
          return Icons.home_rounded;
        case TabItem.favorite:
          return Icons.favorite;
        case TabItem.notification:
          return Icons.notifications;
        case TabItem.account:
          return Icons.person;
        default:
          throw 'Unknown $item';
      }
    }

    return BottomNavigationBarItem(
      icon: Icon(
        _icon(tabItem),
        color: color,
        size: 30,
      ),
      label: '',
    );
  }

  Widget _buildPage() {
    switch (_currentItem) {
      case TabItem.home:
        return HomePage();
      case TabItem.favorite:
      // return; Favorite
      case TabItem.notification:
      // return; Notification
      case TabItem.account:
      // return; Account
      default:
        return HomePage();
    }
  }
}
