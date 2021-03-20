import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../constants/colors.dart';
import '../../home_screen.dart';

class NavigationHolder {
  static GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> homeNavigatorKey =
      GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> chatRoomNavigatorKey =
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
              color: pinky,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
              color: warmGrey,
            ),
            activeIcon: Icon(
              Icons.category,
              color: pinky,
            ),
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.people,
              color: warmGrey,
            ),
            activeIcon: Icon(
              Icons.people,
              color: pinky,
            ),
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.calendar_view_day,
              color: warmGrey,
            ),
            activeIcon: Icon(
              Icons.calendar_view_day,
              color: pinky,
            ),
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.settings,
              color: warmGrey,
            ),
            activeIcon: Icon(
              Icons.settings,
              color: pinky,
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
              builder: (context) {
                return HomeScreen();
              },
            );
          case 2:
            return CupertinoTabView(
              builder: (context) {
                return HomeScreen();
              },
            );
          case 3:
            return CupertinoTabView(
              navigatorKey: NavigationHolder.chatRoomNavigatorKey,
              builder: (context) {
                return HomeScreen();
              },
            );
          case 4:
            return CupertinoTabView(
              navigatorKey: NavigationHolder.chatRoomNavigatorKey,
              builder: (context) {
                return HomeScreen();
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
