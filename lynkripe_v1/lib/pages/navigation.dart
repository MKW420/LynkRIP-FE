import 'package:flutter/material.dart';
import 'package:lynkripe_v1/constants.dart';
import 'package:lynkripe_v1/pages/shared_hub.dart';
import '/pages/Home.dart';
import '/pages/hubs.dart';
import '/pages/profile.dart';

class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({super.key});

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: <Widget>[
        const Explore(),
        const Hubs(),
        const SharedHub(hubId: '',),
        const ProfilePage(),
      ][currentPageIndex],

      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        backgroundColor: Colors.white70,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: lightPrimary,
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.home, color: primary,), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.hub, color: primary,), label: 'Hubs'),
           NavigationDestination(icon: Icon(Icons.share_location, color: primary,), label: 'shared Hub'),
          NavigationDestination(
            icon: Icon(Icons.account_circle, color: primary,),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
