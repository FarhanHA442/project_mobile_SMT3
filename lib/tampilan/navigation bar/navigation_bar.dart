import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:project/tampilan/dashboard/dashboard.dart';
import 'package:project/tampilan/manajemen akun/manajemen_akun.dart';

class NavigationBarFirst extends StatefulWidget {
  const NavigationBarFirst({Key? key}) : super(key: key);

  @override
  State<NavigationBarFirst> createState() => _NavigationBarFirstState();
}

class _NavigationBarFirstState extends State<NavigationBarFirst> {
  int _activePageIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _activePageIndex = index;
            });
          },
          children: [
            DashboardPage(),
            ManajemenAkunPage(),
          ]),
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        color: Color.fromRGBO(61, 131, 97, 1),
        backgroundColor: Colors.white,
        buttonBackgroundColor: Color.fromRGBO(61, 131, 97, 1),
        index: _activePageIndex,
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: Duration(microseconds: 600), curve: Curves.ease);
        },
        items: [
          Icon(
            Icons.space_dashboard_outlined,
            color: Colors.white,
            size: 30,
          ),
          Icon(
            Icons.manage_accounts_outlined,
            color: Colors.white,
            size: 30,
          ),
        ],
      ),
    );
  }
}

class NavigationBarSecond extends StatefulWidget {
  const NavigationBarSecond({Key? key}) : super(key: key);

  @override
  State<NavigationBarSecond> createState() => _NavigationBarSecondState();
}

class _NavigationBarSecondState extends State<NavigationBarSecond> {
  int _activePageIndex = 1;
  final PageController _pageController = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _activePageIndex = index;
            });
          },
          children: [
            DashboardPage(),
            ManajemenAkunPage(),
          ]),
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        color: Color.fromRGBO(61, 131, 97, 1),
        backgroundColor: Colors.white,
        buttonBackgroundColor: Color.fromRGBO(61, 131, 97, 1),
        index: _activePageIndex,
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: Duration(microseconds: 600), curve: Curves.ease);
        },
        items: [
          Icon(
            Icons.space_dashboard_outlined,
            color: Colors.white,
            size: 30,
          ),
          Icon(
            Icons.manage_accounts_outlined,
            color: Colors.white,
            size: 30,
          ),
        ],
      ),
    );
  }
}
