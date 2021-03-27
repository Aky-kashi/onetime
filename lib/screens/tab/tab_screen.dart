import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:onetime/screens/mypage/mypage_screen.dart';
import 'package:onetime/screens/notifications/notification_screen.dart';
import 'package:onetime/screens/post/post_class_screen.dart';
import 'package:onetime/screens/settings/settings_screen.dart';

import '../../constants/colors.dart';
import '../home/home_screen.dart';

class NavigationHolder {
  static GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> homeNavigatorKey =
      GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> notificationNavigatorKey =
      GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> publishNavigatorKey =
      GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> myPageNavigatorKey =
      GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> settingsNavigatorKey =
      GlobalKey<NavigatorState>();
}

class TabScreen extends StatefulWidget {
  static const routeName = '/tab-screen';

  final String pageIndex;

  TabScreen({
    this.pageIndex,
  });

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _defaultIndex = 0;
  int _selectedIndex = 0;

  void _onTapHandler(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = _defaultIndex;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.home,
              color: warmGrey,
            ),
            activeIcon: Icon(
              Icons.home,
              color: Colors.blue,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              color: warmGrey,
            ),
            activeIcon: Icon(
              Icons.notifications,
              color: Colors.blue,
            ),
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.publish,
              color: warmGrey,
            ),
            activeIcon: Icon(
              Icons.publish,
              color: Colors.blue,
            ),
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.person,
              color: warmGrey,
            ),
            activeIcon: Icon(
              Icons.person,
              color: Colors.blue,
            ),
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.settings,
              color: warmGrey,
            ),
            activeIcon: Icon(
              Icons.settings,
              color: Colors.blue,
            ),
          ),
        ],
        onTap: _onTapHandler,
        currentIndex: _selectedIndex,
        backgroundColor: white,
        iconSize: 30,
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              navigatorKey: NavigationHolder.homeNavigatorKey,
              builder: (context) {
                return HomeScreen();
              },
            );
          case 1:
            return CupertinoTabView(
              navigatorKey: NavigationHolder.notificationNavigatorKey,
              builder: (context) {
                return NotificationScreen();
              },
            );
          case 2:
            return CupertinoTabView(
              builder: (context) {
                return PublishClassScreen();
              },
            );
          case 3:
            return CupertinoTabView(
              navigatorKey: NavigationHolder.myPageNavigatorKey,
              builder: (context) {
                return MyPageScreen();
              },
            );
          case 4:
            return CupertinoTabView(
              navigatorKey: NavigationHolder.settingsNavigatorKey,
              builder: (context) {
                return SettingsScreen();
              },
            );
          default:
            {
              return CupertinoTabView(
                builder: (context) {
                  return HomeScreen();
                },
              );
            }
        }
      },
    );
  }
}
