import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:project/dashboard/dashboard.dart';
import 'package:project/manajemen akun/manajemen_akun.dart';

void main() {
  runApp(Navigation());
}

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavigationBar(),
    );
  }
}

class NavigationBar extends StatefulWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int index = 0;
  final screens = [
    Dashboard(),
    ManajemenAkun(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: ConvexAppBar(
          curveSize: 70,
          backgroundColor: Color.fromRGBO(61, 131, 97, 1),
          activeColor: Colors.white,
          color: Colors.white,
          items: const [
            TabItem(icon: Icons.dashboard, title: 'Dashboard'),
            TabItem(icon: Icons.manage_accounts, title: 'Akun'),
          ],
          // initialActiveIndex: 0,
          onTap: (int i) {
            setState(() => index = i);
          }),
    );
  }
}
