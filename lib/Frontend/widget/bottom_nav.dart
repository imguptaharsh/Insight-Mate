import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: GNav(tabs: [
        GButton(
          icon: Icons.chat,
          iconColor: Colors.white,
          text: 'Chat',
          textColor: Colors.white,
        ),
        GButton(
          icon: Icons.home,
          iconColor: Colors.white,
          text: 'Home',
          textColor: Colors.white,
        ),
        GButton(
          icon: Icons.history,
          iconColor: Colors.white,
          text: 'History',
          textColor: Colors.white,
        ),
        GButton(
          icon: Icons.person,
          iconColor: Colors.white,
          text: 'Setting',
          textColor: Colors.white,
        ),
      ]),
    );
  }
}
