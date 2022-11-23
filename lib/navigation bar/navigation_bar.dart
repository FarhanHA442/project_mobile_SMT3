import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:project/dashboard/dashboard.dart';

void main() {
  runApp(Navigation());
}

class Navigation extends StatelessWidget{
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Color.fromRGBO(61, 131, 97, 1),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
          child: GNav(
        backgroundColor: Color.fromRGBO(61, 131, 97, 1),
        color: Colors.black,
        activeColor: Colors.black,
        tabBackgroundColor: Color.fromRGBO(238, 242, 230, 1),
        gap: 8,
        onTabChange: (index) {
          print(index);
        },
        padding: EdgeInsets.all(16),
        tabs: const [
          GButton(
            icon: Icons.dashboard,
            text: 'Dashboard',
            ),
          GButton(
            icon: Icons.manage_accounts,
            text: 'Akun',
            ),
        ],
      ),
        ),
    ),
    );
  }
}